package com.mycompany.lifill_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.Inquiry;

@Mapper
public interface InquiryDao {

	public int insert(Inquiry inquiry);
}
