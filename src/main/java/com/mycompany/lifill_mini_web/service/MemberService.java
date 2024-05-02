package com.mycompany.lifill_mini_web.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.lifill_mini_web.dao.InquiryDao;
import com.mycompany.lifill_mini_web.dto.Inquiry;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberService {
	
	@Resource
	private InquiryDao inquiryDao; 
	
	public void applyInquiry(Inquiry inquiry) {
		// 비즈니스 로직 처리 코드...
		
		
		int rowNum = inquiryDao.insert(inquiry);
		
		log.info("inquiry: " + inquiry);
		log.info("rowNum : " + rowNum + ", inqNo : " + inquiry.getInqno());
		
	}
}
