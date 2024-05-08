package com.mycompany.lifill_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.PrdDetail;

@Mapper
public interface PrdDetailDao {
	public int prddetailinsert(PrdDetail prddetail);

}
