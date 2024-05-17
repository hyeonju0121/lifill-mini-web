package com.mycompany.lifill_mini_web.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.lifill_mini_web.dao.AddressDao;
import com.mycompany.lifill_mini_web.dao.InquiryDao;
import com.mycompany.lifill_mini_web.dao.MemberDao;
import com.mycompany.lifill_mini_web.dao.OrderDao;
import com.mycompany.lifill_mini_web.dto.Address;
import com.mycompany.lifill_mini_web.dto.Inquiry;
import com.mycompany.lifill_mini_web.dto.Member;
import com.mycompany.lifill_mini_web.dto.request.CreateInquiryRequest;
import com.mycompany.lifill_mini_web.dto.response.InquiryResponse;
import com.mycompany.lifill_mini_web.dto.response.MemberResponse;
import com.mycompany.lifill_mini_web.dto.response.OrderResponse;
import com.mycompany.lifill_mini_web.security.LifillUserDetails;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberService {
	
	@Resource
	private InquiryDao inquiryDao;
	@Resource
	private MemberDao memberDao;
	@Resource
	private AddressDao addressDao;
	@Resource
	private OrderDao orderDao;
	
	public void applyInquiry(Inquiry inquiry) {
		int rowNum = inquiryDao.insert(inquiry);
		
		log.info("inquiry: " + inquiry);
		log.info("rowNum : " + rowNum + ", inqNo : " + inquiry.getInqno());
	}
	
	@Transactional
	public void join(MemberResponse memberResponse) {
		// 입력받은 비밀번호를 암호화
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		memberResponse.setMpassword(passwordEncoder.encode(memberResponse.getMpassword()));
		
		/*// address1과 2를 합친 값을 Address DTO의 maddress 필드에 저장
		String fullAddress = member.getMaddress1() + ", " + member.getMaddress2();
		member.getAddress().setMaddress(fullAddress);*/
		//log.info("member.getAddress={}", member.getAddress().toString());
		
		// sign_up 폼에서 입력받는 내용이 아니므로 직접 설정
		memberResponse.setMrole("ROLE_USER");
		memberResponse.setMenable(true);
		
		// Member 객체의 필드 값을 DB에 삽입
		memberDao.mInsert(memberResponse);
		
		String fullAddress = memberResponse.getMaddress1() + ", " + memberResponse.getMaddress2();
		memberResponse.setMaddress(fullAddress);
		
		// Address 객체의 필드 값을 DB에 삽입
		addressDao.aInsert(memberResponse);
	}
	
	public String getMemberAddress(Member member) {
		String maddress = memberDao.selectAddressByMid(member.getMid());
		return maddress;
	}

	public String getMemberZipcode(Member member) {
		String mzipcode = memberDao.selectZipcodeByMid(member.getMid());
		return mzipcode;
	}
	
	// 단순 상품 문의 등록
	@Transactional
	public void insertQnaInquiry(CreateInquiryRequest request) {
		// 사용자 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();

		// 상품 유형 검사
		int inqtype = inqTypeValidation(request.getRequestInqval());

		Inquiry inquiry = new Inquiry();
		inquiry.setMid(mid);
		inquiry.setPrdcode(request.getPrdcode());
		inquiry.setInqtitle(request.getInqtitle());
		inquiry.setInqcontent(request.getInqcontent());
		inquiry.setInqtype(inqtype);
		inquiry.setInqstatus("답변대기중");

		log.info("inquiry={}", inquiry.toString());

		int inqRowNum = inquiryDao.insertCsInquiry(inquiry);
	}

	// 상품 문의 조회
	public List<InquiryResponse> getQnaInquiry() {
		// 사용자 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();

		List<InquiryResponse> inquiryList = inquiryDao.selectCsInquiry(mid);

		return inquiryList;
	}

	// 회원 아이디에 해당하는 단순상품 전체 문의 건수 조회
	public int getQnaCount() {
		// 사용자 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();

		return inquiryDao.getQnaCnt(mid);
	}

	// 회원 아이디에 해당하는 단순상품 답변완료  건수 조회
	public int getQnaApplyCount() {
		// 사용자 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();

		return inquiryDao.getQnaApplyCnt(mid);
	}

	// 회원 아이디에 해당하는 단순상품 답변대기 건수 조회
	public int getQnaNoApplyCount() {
		// 사용자 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();

		return inquiryDao.getQnaNoApplyCnt(mid);
	}

	// 상품 유형 검사 메소드
	public int inqTypeValidation(String requestInqval) {
		int inqtype = 0;

		switch (requestInqval) {
		case "product":
			inqtype = 1;
			break;
		case "return":
			inqtype = 2;
			break;
		case "exchange":
			inqtype = 3;
			break;
		case "delivery":
			inqtype = 4;
			break;
		default:
			throw new RuntimeException("문의 타입 설정이 잘못 되었습니다.");
		}
		return inqtype;
	}
	
	public boolean isPasswordMatched(String inputPassword) {
		
		log.info("실행");
		// 로그인한 회원의 비밀번호 얻기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		LifillUserDetails userDetails = (LifillUserDetails) authentication.getPrincipal();
		String mid = userDetails.getUsername();
		
		// mid를 기준으로 일치하는 유저의 비밀번호 얻기
		String mpassword = memberDao.getMpasswordbyMid(mid);
		
		// 사용자가 입력한 비밀번호와 DB에 저장된 비밀번호가 일치하는지 비교
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		
		boolean isMatched = passwordEncoder.matches(inputPassword, mpassword);
		
		return isMatched;
	}

	public void updateMstatus(String mid) {
		
		log.info("실행");
		memberDao.updateMstatusbyMid(mid);
		SecurityContextHolder.clearContext();
	}

	public void updateNewMemberInfo(Member member, String mpassword, String mphone) {
		
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		if (!passwordEncoder.matches(mpassword, member.getMpassword())) {
			if (!mpassword.equals(member.getMpassword())) {
				member.setMpassword(passwordEncoder.encode(mpassword));
				memberDao.updateMpassword(member);
				SecurityContextHolder.clearContext();
			}
		}
		
		String mPhoneInDB = memberDao.selectMphoneByMid(member);
		if ( ! mPhoneInDB.equals(mphone)) {
			member.setMphone(mphone);
			memberDao.updateMphone(member);
			SecurityContextHolder.clearContext();
		}
	}
	
	public List<OrderResponse> getOrderList() {
		// 사용자 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();

		List<OrderResponse> orderList = orderDao.selectOrderList(mid);

		return orderList;
	}

	public int getWaitDepositStatus() {
		// 사용자 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();
		
		int cnt = orderDao.selectWaitDepositStatusByMid(mid);
		return cnt;
	}

	public int getCompletePaymentStatus() {
		// 사용자 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();
		
		int cnt = orderDao.selectCompletePaymentStatusByMid(mid);
		return cnt;
	}

	public int getPreparingDeliveryStatus() {
		// 사용자 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();
		int cnt = orderDao.selectPreparingDeliveryStatusByMid(mid);
		return cnt;
	}

	public int getShippingStatus() {
		// 사용자 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();
		int cnt = orderDao.selectShippingStatusByMid(mid);
		return cnt;
	}

	public int getDeliveryCompletedStatus() {
		// 사용자 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();
		int cnt = orderDao.selectDeliveryCompletedStatusByMid(mid);
		return cnt;
	}
	
	public String findId(Member member) {
		String mid = memberDao.findId(member);
		return mid;
	}
	
	public String findPw(Member member) {
		String mpassword = memberDao.findPw(member);
		return mpassword;
	}

	public void changePw(Member member) {
		log.info("실행");
	  PasswordEncoder passwordEncoder =
	  PasswordEncoderFactories.createDelegatingPasswordEncoder();
	  member.setMpassword(passwordEncoder.encode(member.getMpassword()));
	  memberDao.changePw(member);
	 /* log.info("Updating password for member ID: " + member.getMid());*/
	}
	
	public OrderResponse getOrderDetail(String ordid) {
		log.info("실행");
		OrderResponse order = orderDao.selectOrderDetailByOrdid(ordid);
		
		return order;
	}

	public List<InquiryResponse> getMToMInquiry() {
		// 사용자 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();

		List<InquiryResponse> inquiryList = inquiryDao.selectMTMInquiry(mid);

		return inquiryList;
	}

	public int getMTMCount() {
		// 사용자 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();

		return inquiryDao.getMTMCnt(mid);
	}

	public int getMTMApplyCount() {
		// 사용자 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();

		return inquiryDao.getMTMApplyCnt(mid);
	}

	public int getMTMNoApplyCount() {
		// 사용자 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();

		return inquiryDao.getMTMNoApplyCnt(mid);
	}

	public void insertMTMInquiry(CreateInquiryRequest request) {
		// 사용자 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();

		// 상품 유형 검사
		int inqtype = inqTypeValidation(request.getRequestInqval());

		Inquiry inquiry = new Inquiry();
		inquiry.setMid(mid);
		inquiry.setPrdcode(request.getPrdcode());
		inquiry.setInqtitle(request.getInqtitle());
		inquiry.setInqcontent(request.getInqcontent());
		inquiry.setInqtype(inqtype);
		inquiry.setInqstatus("답변대기중");

		log.info("inquiry={}", inquiry.toString());

		int inqRowNum = inquiryDao.insertMTMInquiry(inquiry);
	}
}
