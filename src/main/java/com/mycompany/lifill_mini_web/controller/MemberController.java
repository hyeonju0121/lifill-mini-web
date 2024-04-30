package com.mycompany.lifill_mini_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/member")
@Slf4j
@Controller
public class MemberController {
	
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
}
