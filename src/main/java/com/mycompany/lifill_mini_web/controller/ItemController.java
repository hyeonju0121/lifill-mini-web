package com.mycompany.lifill_mini_web.controller;

import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.lifill_mini_web.dto.Member;
import com.mycompany.lifill_mini_web.dto.Pager;
import com.mycompany.lifill_mini_web.dto.Review;
import com.mycompany.lifill_mini_web.dto.request.ItemPageRequest;
import com.mycompany.lifill_mini_web.dto.request.MultipleOrdersRequest;
import com.mycompany.lifill_mini_web.dto.request.OrderItem;
import com.mycompany.lifill_mini_web.dto.request.SingleOrderRequest;
import com.mycompany.lifill_mini_web.dto.response.OrdersResponse;
import com.mycompany.lifill_mini_web.dto.response.ProductResponse;
import com.mycompany.lifill_mini_web.security.LifillUserDetails;
import com.mycompany.lifill_mini_web.service.MemberService;
import com.mycompany.lifill_mini_web.service.OrderService;
import com.mycompany.lifill_mini_web.service.ProductService;
import com.mycompany.lifill_mini_web.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/item")
@Slf4j
@Controller
public class ItemController {

	@Resource
	private ProductService productService;
	@Resource
	private OrderService orderService;
	@Resource
	private MemberService memberService;
	@Resource
	private ReviewService reviewService;
	
	// 기능별 스토어 ------------------------------------------------------
	@GetMapping("/categories/function")
	public String categoriesFunctionSubCategory(Model model, 
				@RequestParam(required = false, value="subCategory",
							  defaultValue="all") String subCategory,
				@RequestParam(required = false, value="sort",
							  defaultValue="0") String sort,
				@RequestParam(required = false, value="filter",
							  defaultValue="0") String filter,
				@RequestParam(required = false, value="pageNo",
							  defaultValue="1") String pageNo, 
				HttpSession session) {
		
		ItemPageRequest request = new ItemPageRequest();
		request.setSubCategory(subCategory);
		request.setSort(sort);
		request.setFilter(filter);
		request.setPageNo(pageNo);
		
		log.info("request.toString={}", request.toString());
		
		if (pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			if (pageNo == null) {
				// 세션에 저장되어 있지 않을 경우 "1"로 강제 세팅
				pageNo = "1";
			}
		}
		session.setAttribute("pageNo", pageNo);

		int intPageNo = Integer.parseInt(pageNo);

		// 페이징 대상이 되는 전체 행의 수 구하기 
		int rows = productService.getItemPageRequestCount(request);

		Pager pager = new Pager(12, 12, rows, intPageNo);
		request.setPager(pager);
		
		// Service에서 게시물 목록 요청
		List<ProductResponse> productResponseList = productService.getProductResponseList(request);

		// JSP 에서 사용할 수 있도록 설정
		model.addAttribute("pager", pager);
		model.addAttribute("productResponseList", productResponseList);
		model.addAttribute("totalCnt", rows);
		return "item/function";
	}
	

	// 성분별 스토어 ------------------------------------------------------
	@GetMapping("/categories/ingredient")
	public String categoriesIngredient(Model model,
			@RequestParam(required = false, value = "subCategory", defaultValue = "all") String subCategory,
			@RequestParam(required = false, value = "sort", defaultValue = "0") String sort,
			@RequestParam(required = false, value = "filter", defaultValue = "0") String filter,
			@RequestParam(required = false, value = "pageNo", defaultValue = "1") String pageNo, HttpSession session) {

		ItemPageRequest request = new ItemPageRequest();
		request.setSubCategory(subCategory);
		request.setSort(sort);
		request.setFilter(filter);
		request.setPageNo(pageNo);

		log.info("request.toString={}", request.toString());

		if (pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			if (pageNo == null) {
				// 세션에 저장되어 있지 않을 경우 "1"로 강제 세팅
				pageNo = "1";
			}
		}
		session.setAttribute("pageNo", pageNo);

		int intPageNo = Integer.parseInt(pageNo);

		// 페이징 대상이 되는 전체 행의 수 구하기
		int rows = productService.getIgdItemPageRequestCount(request);

		Pager pager = new Pager(12, 12, rows, intPageNo);
		request.setPager(pager);
		
		// Service에서 게시물 목록 요청
		List<ProductResponse> productResponseList = productService.getIgdProductResponseList(request);

		// JSP 에서 사용할 수 있도록 설정
		model.addAttribute("pager", pager);
		model.addAttribute("productResponseList", productResponseList);
		model.addAttribute("totalCnt", rows);
		
		return "item/ingredient";
	}


	// 상품 상세페이지 ------------------------------------------------
	@RequestMapping("/item_view")
	public String itemView(Model model, String prdcode) {
		log.info("itemView() 실행");

		ProductResponse product = productService.getProductResponse(prdcode);

		List<Review> review = reviewService.getReviewList(prdcode);
		model.addAttribute("product", product);
		model.addAttribute("review", review);
		model.addAttribute("reviewCount", review.size());
		
		return "item/item_view";
	}


	// 상품 구매하기 ------------------------------------------------
	@Secured("ROLE_USER")
	@RequestMapping("/buyNow")
	public String buyNow(String prdcode, int ordamount, int ordprice, Model model) {
		log.info("buyNow() 실행");

		// 로그인한 회원의 객체 얻기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		LifillUserDetails userDetails = (LifillUserDetails) authentication.getPrincipal();
		Member member = userDetails.getMember();

		String maddress = memberService.getMemberAddress(member);
		String mzipcode = memberService.getMemberZipcode(member);

		// 서비스 -> prdcode 기준으로 해당 productResponse 객체 가져오기
		ProductResponse productResponse = productService.getProductResponse(prdcode);
		// jsp에서 사용할 수 있도록 model로 넘겨주기
		model.addAttribute("product", productResponse);
		model.addAttribute("amount", ordamount);
		model.addAttribute("price", ordprice);
		model.addAttribute("member", member);
		model.addAttribute("maddress", maddress);
		model.addAttribute("mzipcode", mzipcode);

		return "item/order";
	}

	// 장바구니에 담긴 상품을 구매하려 할 때 실행되는 컨트롤러 ----------------------
	@Secured("ROLE_USER")
	@GetMapping("/buyOnCart")
	public String buyOnCart(OrderItem item, Model model) {
		log.info("buyOnCart() 실행");
		log.info("사용자가 주문 넣은 항목 request.toString={}", item.toString());

		// 로그인한 회원의 객체 얻기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		LifillUserDetails userDetails = (LifillUserDetails) authentication.getPrincipal();
		Member member = userDetails.getMember();

		String maddress = memberService.getMemberAddress(member);
		String mzipcode = memberService.getMemberZipcode(member);

		// 서비스 -> prdcode 기준으로 해당 productResponse 객체 가져오기
	    List<OrdersResponse> productResponse = productService.getProductsResponse(item);
		
		// jsp에서 사용할 수 있도록 model로 넘겨주기
		model.addAttribute("product", productResponse);
		model.addAttribute("member", member);
		model.addAttribute("maddress", maddress);
		model.addAttribute("mzipcode", mzipcode);

		return "item/orders";
	}

	// 단일 상품 구매 --------------------------------------------
	@Transactional
	@PostMapping("/buy")
	public String buy(SingleOrderRequest singleOrder) {
		log.info("buy() 실행");

		log.info("singleOrder={}", singleOrder.toString());

		orderService.createOrder(singleOrder);

		return "item/orderComplete";
	}
	
	// 다중 상품 구매 ---------------------------------------------
	@Transactional
	@PostMapping("/buyMultiple")
	public String buyMultiple(MultipleOrdersRequest orders) {
		log.info("buyMultiple() 실행");

		log.info("orders={}", orders.toString());

		orderService.createOrders(orders);

		return "item/orderComplete";
	}

	// 첨부파일 다운로드 -----------------------------------------------
	@GetMapping("/attachDownload")
	public void attachDownload(String prdcode, HttpServletResponse response) throws Exception {
		// 다운로드할 데이터를 준비
		ProductResponse product = productService.getProductResponse(prdcode);
		byte[] data = productService.getAttachData(prdcode);

		// 응답 헤더 구성
		response.setContentType(product.getPrdimgrep1type());
		// 한글 파일의 이름 -> 인코딩 변경
		String fileName = new String(product.getPrdimgrep1oname().getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		// 응답 본문에 파일 데이터 출력
		OutputStream os = response.getOutputStream();
		os.write(data);
		os.write(data);
		os.flush();
		os.close();
	}
	
	@GetMapping("/attachDetailDownload")
	public void attachDetailDownload(String prdcode, HttpServletResponse response) throws Exception {
		// 다운로드할 데이터를 준비
		ProductResponse product = productService.getProductResponse(prdcode);
		byte[] data = productService.getAttachDetailData(prdcode);

		// 응답 헤더 구성
		response.setContentType(product.getPrdimgdetailtype());
		// 한글 파일의 이름 -> 인코딩 변경
		String fileName = new String(product.getPrdimgdetailoname().getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		// 응답 본문에 파일 데이터 출력
		OutputStream os = response.getOutputStream();
		os.write(data);
		os.write(data);
		os.flush();
		os.close();
	}
}
