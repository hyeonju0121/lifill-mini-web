package com.mycompany.lifill_mini_web.controller;

import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
import com.mycompany.lifill_mini_web.dto.request.ItemPageRequest;
import com.mycompany.lifill_mini_web.dto.request.SingleOrderRequest;
import com.mycompany.lifill_mini_web.dto.response.ProductResponse;
import com.mycompany.lifill_mini_web.security.LifillUserDetails;
import com.mycompany.lifill_mini_web.service.MemberService;
import com.mycompany.lifill_mini_web.service.OrderService;
import com.mycompany.lifill_mini_web.service.ProductService;

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

	@RequestMapping("")
	public String index() {
		log.info("index() 실행");
		return "item/index";
	}

	@RequestMapping("/category1")
	public String category1() {
		log.info("category1() 실행");
		return "item/category1";
	}

	/*
	 * @RequestMapping("/category2") public String category2() {
	 * log.info("category2() 실행"); return "item/category2"; }
	 */

	/*@GetMapping("/category2")
	public String productResponseList(Model model) {
		// Service에서 게시물 목록 요청
		List<ProductResponse> productResponseList = productService.getProductResponseList();
		log.info("service 실행");

		
		 * for (ProductResponse temp : productResponseList) { log.info("temp={}",
		 * temp.toString()); }
		 
		// 판매중인 상품 total count 가져오기
		int totalCnt = productService.getSalesOnCnt();

		// JSP 에서 사용할 수 있도록 설정
		model.addAttribute("productResponseList", productResponseList);
		model.addAttribute("totalCnt", totalCnt);
		return "item/category2";
	}*/

	//public String categoriesFunction(String pageNo, Model model, HttpSession session) {
	/*@GetMapping("/categories/function")
	public String categoriesFunction( Model model) {
		if (pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			if (pageNo == null) {
				// 세션에 저장되어 있지 않을 경우 "1"로 강제 세팅
				pageNo = "1";
			}
		}

		// 세션에 pageNo 저장
		session.setAttribute("pageNo", pageNo);
		// 문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);

		// Pager 객체 생성
		int rowsPagingTarget = productService.getSalesOnCnt();
		Pager pager = new Pager(8, 8, rowsPagingTarget, intPageNo);
		
		// Service에서 게시물 목록 요청
		List<ProductResponse> productResponseList = productService.getProductResponseList();

		// 판매중인 상품 total count 가져오기
		int totalCnt = productService.getSalesOnCnt();

		// JSP 에서 사용할 수 있도록 설정
		//model.addAttribute("pager", pager);
		model.addAttribute("productResponseList", productResponseList);
		model.addAttribute("totalCnt", totalCnt);
		return "item/function";
	}*/
	
	
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

	@RequestMapping("/category3")
	public String category3() {
		log.info("category3() 실행");
		return "item/category3";
	}

	@RequestMapping("/category4")
	public String category4() {
		log.info("category4() 실행");
		return "item/category4";
	}

	@RequestMapping("/category5")
	public String category5() {
		log.info("category5() 실행");
		return "item/category5";
	}

	@RequestMapping("/category6")
	public String category6() {
		log.info("category6() 실행");
		return "item/category6";
	}

	@RequestMapping("/item_view")
	public String itemView(Model model, String prdcode) {
		log.info("itemView() 실행");

		ProductResponse product = productService.getProductResponse(prdcode);

		model.addAttribute("product", product);

		return "item/item_view";
	}

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

	// 장바구니에 담긴 상품을 구매하려 할 때 실행되는 내용
	@RequestMapping("/buyOnCart")
	public String buyOnCart(String mid, String prdcode, int ordAmount, int ordPrice, Model model) {
		log.info("buyOnCart() 실행");

		return "item/order";
	}

	@Transactional
	@PostMapping("/buy")
	public String buy(SingleOrderRequest singleOrder) {
		log.info("buy() 실행");

		log.info("singleOrder={}", singleOrder.toString());

		orderService.createOrder(singleOrder);

		return "item/orderComplete";
	}

	/*
	 * // 구매 완료시 보여지는 JSP
	 * 
	 * @PostMapping("/orderComplete") public String orderComplete(SingleOrderRequest
	 * singleOrder) { log.info("orderComplete() 실행");
	 * 
	 * log.info("singleOrder={}", singleOrder.toString());
	 * 
	 * orderService.createOrder(singleOrder);
	 * 
	 * return "item/orderComplete"; }
	 */
}
