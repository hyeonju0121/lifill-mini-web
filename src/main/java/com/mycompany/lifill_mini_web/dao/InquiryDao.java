package com.mycompany.lifill_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.Inquiry;
import com.mycompany.lifill_mini_web.dto.response.InquiryResponse;

@Mapper
public interface InquiryDao {

	public int insert(Inquiry inquiry);
	
	public int insertCsInquiry(Inquiry inquiry);

	public List<InquiryResponse> selectCsInquiry(String mid);

	public int getQnaCnt(String mid);
	
	public int getQnaApplyCnt(String mid);
	
	public int getQnaNoApplyCnt(String mid);
	
	public List<InquiryResponse> selectMTMInquiry(String mid);

	public int getMTMCnt(String mid);

	public int getMTMApplyCnt(String mid);

	public int getMTMNoApplyCnt(String mid);

	public int insertMTMInquiry(Inquiry inquiry);
}
