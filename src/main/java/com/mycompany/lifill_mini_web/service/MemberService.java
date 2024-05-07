package com.mycompany.lifill_mini_web.service;

import javax.annotation.Resource;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.lifill_mini_web.dao.InquiryDao;
import com.mycompany.lifill_mini_web.dao.MemberDao;
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
	
	public void applyInquiry(Inquiry inquiry) {
		// 비즈니스 로직 처리 코드...
		
		
		int rowNum = inquiryDao.insert(inquiry);
		
		log.info("inquiry: " + inquiry);
		log.info("rowNum : " + rowNum + ", inqNo : " + inquiry.getInqno());
	}
	
	public void join(Member member) {
		// 입력받은 비밀번호를 암호화하는 과정
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		member.setMpassword(passwordEncoder.encode(member.getMpassword()));
		member.setMrole("ROLE_USER");
		// member.setMenabled(true);
		memberDao.insert(member);
	}
}
