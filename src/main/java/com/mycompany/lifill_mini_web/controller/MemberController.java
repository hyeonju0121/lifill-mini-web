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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.lifill_mini_web.dto.Inquiry;
import com.mycompany.lifill_mini_web.dto.Member;
import com.mycompany.lifill_mini_web.dto.request.CreateInquiryRequest;
import com.mycompany.lifill_mini_web.dto.response.InquiryResponse;
import com.mycompany.lifill_mini_web.dto.response.MemberResponse;
import com.mycompany.lifill_mini_web.dto.response.ProductResponse;
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
	
	@RequestMapping("/join")
	public String join(MemberResponse memberResponse) {
		log.info("실행");
		log.info("memberResponse={}",memberResponse.toString());
		
		memberService.join(memberResponse);
		return "redirect:/member/sign_in";
	}
	
	@RequestMapping("/cart")
	public String cart() {
		log.info("cart() 실행");
		return "member/cart";
	}
	
	@RequestMapping("/mypage")
	public String myPage() {
		log.info("mypage() 실행");
		return "member/mypage/myPage";
	}
	
	@RequestMapping("/orderList")
	public String orderList() {
		log.info("orderList() 실행");
		return "member/mypage/orderList";
	}
	
	@RequestMapping("/orderListClaim")
	public String orderListClaim() {
		log.info("orderListClaim() 실행");
		return "member/mypage/orderList_claim";
	}

	@RequestMapping("/myInquiryList")
	public String myInquiryList() {
		log.info("myInquiryList() 실행");
		return "member/mypage/myInquiryList";
	}
	
	@RequestMapping("/csInquiry")
	public String csInquiry() {
		log.info("csInquiry() 실행");
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
	
	@RequestMapping("/myGoodsReviewList")
	public String myGoodsReviewList() {
		log.info("myGoodsReviewList() 실행");
		return "member/mypage/myGoodsReviewList";
	}
	
	@RequestMapping("/updateMember")
	public String updateMember() {
		log.info("updateMember() 실행");
		return "member/mypage/updateMember";
	}
	
	@RequestMapping("/pwdConfirm")
	public String pwdConfirm() {
		log.info("pwdConfirm() 실행");
		return "member/mypage/pwdConfirm";
	}
	
	/*
	@PostMapping("/writeBoard")
	public String writeBoard(Inquiry inquiry) {
		
		// 요청 데이터의 유효성 검사
		log.info("original filename : " + inquiry.getInqAttach().getOriginalFilename());
		log.info("file type : " + inquiry.getInqAttach().getContentType());
		
		// 첨부 파일이 있는지 조사
		if (inquiry.getInqAttach() != null && !inquiry.getInqAttach().isEmpty()) {
			// DTO에 추가 설정
			inquiry.setInqAttachOName(inquiry.getInqAttach().getOriginalFilename());
			inquiry.setInqAttachType(inquiry.getInqAttach().getContentType());
			try {
				inquiry.setInqAttachData(inquiry.getInqAttach().getBytes());
			} catch (Exception e) {}
		}
		
		inquiry.setPrdcode("EYE001");
		inquiry.setInqtype("PRODUCT");
		inquiry.setInqstatus("답변대기중");
		
		// 로그인된 사용자 아이디 설정
		inquiry.setMid("tjdwns3823");

		// 비즈니스 로직 처리를 서비스로 위임
		memberService.applyInquiry(inquiry);
		
		return "redirect:/member/myInquiryList";	
	}*/
	
	@GetMapping("/userInfo")
	public String userInfo(Authentication authentication) {
		log.info("실행");
		//사용자 아이디 얻기
		String mid = authentication.getName();
		
		//사용자 아이디 및 이메일 얻기
		LifillUserDetails UserDetails = (LifillUserDetails) authentication.getPrincipal();
		Member member = UserDetails.getMember();
		String mname = member.getMname();
		String memail = member.getMemail();
		  
		//사용자 권한(롤) 이름 얻기
		List<String> authorityList = new ArrayList<>();
		for(GrantedAuthority authority : authentication.getAuthorities()) {
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
