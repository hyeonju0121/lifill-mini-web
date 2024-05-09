package com.mycompany.lifill_mini_web.service;

import javax.annotation.Resource;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.lifill_mini_web.dao.AddressDao;
import com.mycompany.lifill_mini_web.dao.InquiryDao;
import com.mycompany.lifill_mini_web.dao.MemberDao;
import com.mycompany.lifill_mini_web.dto.Address;
import com.mycompany.lifill_mini_web.dto.Inquiry;
import com.mycompany.lifill_mini_web.dto.Member;

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
	
	public void applyInquiry(Inquiry inquiry) {
		// 비즈니스 로직 처리 코드...
		
		
		int rowNum = inquiryDao.insert(inquiry);
		
		log.info("inquiry: " + inquiry);
		log.info("rowNum : " + rowNum + ", inqNo : " + inquiry.getInqno());
	}
	
	@Transactional
	public void join(Member member, Address address) {
		// 입력받은 비밀번호를 암호화
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		member.setMpassword(passwordEncoder.encode(member.getMpassword()));
		
		/*// address1과 2를 합친 값을 Address DTO의 maddress 필드에 저장
		String fullAddress = member.getMaddress1() + ", " + member.getMaddress2();
		member.getAddress().setMaddress(fullAddress);*/
		//log.info("member.getAddress={}", member.getAddress().toString());
		
		// sign_up 폼에서 입력받는 내용이 아니므로 직접 설정
		member.setMrole("ROLE_USER");
		
		// Member 객체의 필드 값을 DB에 삽입
		memberDao.mInsert(member);
		
		String fullAddress = address.getMaddress1() + ", " + address.getMaddress2();
		address.setMaddress(fullAddress);
		
		// Address 객체의 필드 값을 DB에 삽입
		addressDao.aInsert(address);
	}
}
