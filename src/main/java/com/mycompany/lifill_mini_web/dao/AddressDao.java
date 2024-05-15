package com.mycompany.lifill_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.response.MemberResponse;

@Mapper
public interface AddressDao {
	public int aInsert(MemberResponse memberResponse);
}
