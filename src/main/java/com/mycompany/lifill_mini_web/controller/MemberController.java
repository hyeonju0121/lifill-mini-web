package com.mycompany.lifill_mini_web.controller;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.lifill_mini_web.dto.Member;
import com.mycompany.lifill_mini_web.dto.request.CartAddItemRequest;
import com.mycompany.lifill_mini_web.dto.request.CreateInquiryRequest;
import com.mycompany.lifill_mini_web.dto.response.GetCartItemResponse;
import com.mycompany.lifill_mini_web.dto.response.InquiryResponse;
import com.mycompany.lifill_mini_web.dto.response.MemberResponse;
import com.mycompany.lifill_mini_web.dto.response.OrderResponse;
import com.mycompany.lifill_mini_web.dto.response.ProductResponse;
import com.mycompany.lifill_mini_web.dto.response.ReviewResponse;
import com.mycompany.lifill_mini_web.security.LifillUserDetails;
import com.mycompany.lifill_mini_web.service.MemberService;
import com.mycompany.lifill_mini_web.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/member")
@Slf4j
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Resource
	private ProductService productService;

	@RequestMapping("")
	public String index() {
		log.info("index() 실행");
		return "member/index";
	}

	@RequestMapping("/sign_in")
	public String signIn() {
		log.info("signIn() 실행");
		return "member/sign_in";
	}

	@RequestMapping("/sign_up")
	public String signUp() {
		log.info("signUp() 실행");
		return "member/sign_up";
	}

	// 아이디 찾기 기능
	@RequestMapping("/find_id")
	public String findId(Member member, Model model) {
		log.info("member.findId()실행");
		memberService.findId(member);

		if (memberService.findId(member) == null || memberService.findId(member) == "") {
			return "member/result_id";
		}
		model.addAttribute("mid", memberService.findId(member));

		return "member/find_id";
	}

	// 비밀번호 찾기 기능
	@RequestMapping("/find_pw")
	public String findPw(Member member, Model model) {
		log.info("member.findPw()실행");
		memberService.findPw(member);

		if (memberService.findPw(member) == null || memberService.findPw(member) == "") {
			return "member/result_pw";
		}
		model.addAttribute("mpassword", memberService.findPw(member));
		model.addAttribute("mid", member.getMid());

		return "/member/find_pw";
	}

	@PostMapping("/ChangePw")
	// 비밀번호 재설정
	public String ChangePw(Member member) {
		log.info("Mpassword:" + member.getMpassword());
		log.info("Mid:" + member.getMid());
		memberService.changePw(member);
		return "redirect:/member/sign_in";

	}

	@RequestMapping("/join")
	public String join(MemberResponse memberResponse) {
		log.info("실행");
		log.info("memberResponse={}", memberResponse.toString());

		memberService.join(memberResponse);
		return "redirect:/member/sign_in";
	}

	// ----------------- 장바구니 관련 -------------------
	@Secured("ROLE_USER")
	@RequestMapping("/addCart")
	public String addCart(@RequestParam String prdcode, @RequestParam String ordamount, @RequestParam String ordprice) {
		CartAddItemRequest request = new CartAddItemRequest();
		request.setPrdcode(prdcode);
		request.setOrdamount(ordamount);
		request.setOrdprice(ordprice);

		log.info("request={}", request.toString());

		// 사용자 장바구니 추가 비즈니스 로직
		productService.addCartItem(request);

		return "redirect:/member/cart";
	}

	@Secured("ROLE_USER")
	@RequestMapping("/cart")
	public String cart(Model model) {
		log.info("cart() 실행");
		// 로그인한 회원의 객체 얻기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		LifillUserDetails userDetails = (LifillUserDetails) authentication.getPrincipal();
		Member member = userDetails.getMember();

		// 사용자 장바구니 내역 조회 비즈니스 로직 추가
		List<GetCartItemResponse> cartItemList = memberService.getCartItem();

		// 사용자 장바구니 건수 조회
		int totalCnt = memberService.getCartTotalCnt();
		
		model.addAttribute("mid", member.getMid());
		model.addAttribute("cartItemList", cartItemList);
		model.addAttribute("totalCnt", totalCnt);

		return "member/cart";
	}
	// ------------------------------------------------

	@Secured("ROLE_USER")
	@RequestMapping("/mypage")
	public String myPage(Model model) {
		log.info("mypage() 실행");

		// 로그인 사용자 정보 얻기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		LifillUserDetails userDetails = (LifillUserDetails) authentication.getPrincipal();
		Member member = userDetails.getMember();

		// 주문 객체 가져오기
		List<OrderResponse> orderList = memberService.getOrderListInThisMonth();
		int totalOrderCnt = memberService.getOrderCountInThisMonth();
		int totalWaitDepositStatusCnt = memberService.getWaitDepositStatusInThisMonth();
		int totalCompletePaymentStatusCnt = memberService.getCompletePaymentStatusInThisMonth();
		int totalPreparingDeliveryStatusCnt = memberService.getPreparingDeliveryStatusInThisMonth();
		int totalShippingStatusCnt = memberService.getShippingStatusInThisMonth();
		int totalDeliveryCompletedStatusCnt = memberService.getDeliveryCompletedStatusInThisMonth();

		model.addAttribute("orderList", orderList);
		model.addAttribute("mname", member.getMname());
		model.addAttribute("totalOrderCnt", totalOrderCnt);
		model.addAttribute("totalWaitDepositStatusCnt", totalWaitDepositStatusCnt);
		model.addAttribute("totalCompletePaymentStatusCnt", totalCompletePaymentStatusCnt);
		model.addAttribute("totalPreparingDeliveryStatusCnt", totalPreparingDeliveryStatusCnt);
		model.addAttribute("totalShippingStatusCnt", totalShippingStatusCnt);
		model.addAttribute("totalDeliveryCompletedStatusCnt", totalDeliveryCompletedStatusCnt);
		return "member/mypage/myPage";
	}

	@Secured("ROLE_USER")
	@RequestMapping("/orderList")
	public String orderList(Model model, Authentication authentication) {
		log.info("orderList() 실행");

		// 주문 객체 가져오기
		List<OrderResponse> orderList = memberService.getOrderList();
		int totalOrderCnt = memberService.getOrderCount();
		int totalWaitDepositStatusCnt = memberService.getWaitDepositStatus();
		int totalCompletePaymentStatusCnt = memberService.getCompletePaymentStatus();
		int totalPreparingDeliveryStatusCnt = memberService.getPreparingDeliveryStatus();
		int totalShippingStatusCnt = memberService.getShippingStatus();
		int totalDeliveryCompletedStatusCnt = memberService.getDeliveryCompletedStatus();

		model.addAttribute("orderList", orderList);
		model.addAttribute("totalOrderCnt", totalOrderCnt);
		model.addAttribute("totalWaitDepositStatusCnt", totalWaitDepositStatusCnt);
		model.addAttribute("totalCompletePaymentStatusCnt", totalCompletePaymentStatusCnt);
		model.addAttribute("totalPreparingDeliveryStatusCnt", totalPreparingDeliveryStatusCnt);
		model.addAttribute("totalShippingStatusCnt", totalShippingStatusCnt);
		model.addAttribute("totalDeliveryCompletedStatusCnt", totalDeliveryCompletedStatusCnt);

		return "member/mypage/orderList";
	}

	@Secured("ROLE_USER")
	@RequestMapping("/orderView")
	public String orderView(Model model, String ordid, String mid) {
		log.info("orderView() 실행");
		log.info("order={}", ordid);

		// 해당 주문 건 가져오기
		List<OrderResponse> orders = memberService.getOrdersDetail(ordid);

		model.addAttribute("orders", orders);

		return "member/mypage/orderView";
	}

	@Secured("ROLE_USER")
	@RequestMapping("/orderListClaim")
	public String orderListClaim() {
		log.info("orderListClaim() 실행");
		return "member/mypage/orderList_claim";
	}

	@Secured("ROLE_USER")
	@RequestMapping("/myInquiryList")
	public String myInquiryList(Model model) {
		log.info("myInquiryList() 실행");

		// 문의 객체 가져오기
		List<InquiryResponse> inquiryList = memberService.getMToMInquiry();
		int totalMTMCnt = memberService.getMTMCount();
		int totalApplyCnt = memberService.getMTMApplyCount();
		int totalNoApplyCnt = memberService.getMTMNoApplyCount();

		model.addAttribute("inquiryList", inquiryList);
		model.addAttribute("totalMTMCnt", totalMTMCnt);
		model.addAttribute("totalApplyCnt", totalApplyCnt);
		model.addAttribute("totalNoApplyCnt", totalNoApplyCnt);

		return "member/mypage/myInquiryList";
	}

	@Secured("ROLE_USER")
	@RequestMapping("/csInquiry")
	public String csInquiry(Model model, String prdcode) {
		log.info("csInquiry() 실행");

		// 해당 상품코드 객체 가져오기
		ProductResponse product = productService.getProductResponse(prdcode);
		model.addAttribute("product", product);

		return "member/mypage/csInquiry";
	}

	@Secured("ROLE_USER")
	@RequestMapping("/myQnaList")
	public String myQnaList(Model model) {
		log.info("myQnaList() 실행");

		// 문의 객체 가져오기
		List<InquiryResponse> inquiryList = memberService.getQnaInquiry();
		int totalQnaCnt = memberService.getQnaCount();
		int totalApplyCnt = memberService.getQnaApplyCount();
		int totalNoApplyCnt = memberService.getQnaNoApplyCount();

		model.addAttribute("inquiryList", inquiryList);
		model.addAttribute("totalQnaCnt", totalQnaCnt);
		model.addAttribute("totalApplyCnt", totalApplyCnt);
		model.addAttribute("totalNoApplyCnt", totalNoApplyCnt);

		return "member/mypage/myQnaList";
	}

	// 단순 상품 문의 작성 폼
	@GetMapping("/qnaInquiry")
	public String qnaInquiry(String prdcode, Model model) {
		log.info("qnaInquiry() 실행");

		// 해당 상품코드 객체 가져오기
		ProductResponse product = productService.getProductResponse(prdcode);
		model.addAttribute("product", product);

		return "member/mypage/qnaInquiry";
	}

	// 상품 문의 post 요청
	@Secured("ROLE_USER")
	@PostMapping("/applyCsInquiry")
	public String applyCsInquiry(CreateInquiryRequest request) {
		log.info("실행");

		memberService.insertQnaInquiry(request);

		return "redirect:/member/myQnaList";
	}

	@Secured("ROLE_USER")
	@RequestMapping("/myGoodsReviewList")
	public String myGoodsReviewList(Model model) {
		// 리뷰 객체 가져오기
		List<ReviewResponse> reviewList = memberService.getReviewList();
		int totalReviewCnt = memberService.getReviewCount();

		model.addAttribute("reviewList", reviewList);
		model.addAttribute("totalReviewCnt", totalReviewCnt);

		return "member/mypage/myGoodsReviewList";
	}

	@Secured("ROLE_USER")
	@RequestMapping("/updateMember")
	public String updateMember(Authentication authentication, Model model) {
		log.info("updateMember() 실행");

		LifillUserDetails userDetails = (LifillUserDetails) authentication.getPrincipal();
		Member member = userDetails.getMember();
		model.addAttribute("member", member);

		return "member/mypage/updateMember";
	}

	@Transactional
	@Secured("ROLE_USER")
	@RequestMapping("/fixNewMemberInfo")
	public String fixNewMemberInfo(Authentication authentication, String mpassword, String mphone) {
		log.info("fixNewMemberInfo() 실행");

		LifillUserDetails userDetails = (LifillUserDetails) authentication.getPrincipal();
		Member member = userDetails.getMember();

		memberService.updateNewMemberInfo(member, mpassword, mphone);

		return "member/mypage/fixNewMemberInfo";
	}

	@RequestMapping("/pwdConfirm")
	public String pwdConfirm() {
		log.info("pwdConfirm() 실행");
		return "member/mypage/pwdConfirm";
	}

	@PostMapping("/passwordMatching")
	public String passwordMatching(String inputPassword, Model model) {
		log.info("passwordMatching() 실행");

		boolean isMatched = memberService.isPasswordMatched(inputPassword);

		log.info("isMatched={}", isMatched);

		if (isMatched) {
			// 로그인한 회원의 비밀번호 얻기
			return "redirect:updateMember";
		} else {
			return "redirect:pwdConfirm";
		}
	}

	// 회원탈퇴를 요청했을 때
	@PostMapping("/removeMember")
	public String pwdConfir(Authentication authentication) {
		log.info("pwdConfirm() 실행");

		LifillUserDetails userDetails = (LifillUserDetails) authentication.getPrincipal();
		String mid = userDetails.getMember().getMid();

		memberService.updateMstatus(mid);

		return "member/mypage/removeMember";
	}

	@Secured("ROLE_USER")
	@RequestMapping("/writeReview")
	public String writeReview(Model model, String prdcode, String ordid) {
		log.info("writeReview() 실행");

		// 해당 상품코드 객체 가져오기
		ProductResponse product = productService.getProductResponse(prdcode);
		model.addAttribute("product", product);
		model.addAttribute("ordid", ordid);

		return "member/mypage/writeReview";
	}
	
	@Transactional
	@PostMapping("/applyMTMInquiry")
	public String applyMTMInquiry(CreateInquiryRequest request) {

		log.info("실행");

		memberService.insertMTMInquiry(request);

		return "redirect:/member/myInquiryList";
	}

	@GetMapping("/userInfo")
	public String userInfo(Authentication authentication) {
		log.info("실행");
		// 사용자 아이디 얻기
		String mid = authentication.getName();

		// 사용자 아이디 및 이메일 얻기
		LifillUserDetails UserDetails = (LifillUserDetails) authentication.getPrincipal();
		Member member = UserDetails.getMember();
		String mname = member.getMname();
		String memail = member.getMemail();

		// 사용자 권한(롤) 이름 얻기
		List<String> authorityList = new ArrayList<>();
		for (GrantedAuthority authority : authentication.getAuthorities()) {
			authorityList.add(authority.getAuthority());
		}

		log.info("mid : " + mid);
		log.info("mname : " + mname);
		log.info("memail : " + memail);
		log.info("mrole : " + authorityList);

		return "redirect:/";
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
}
