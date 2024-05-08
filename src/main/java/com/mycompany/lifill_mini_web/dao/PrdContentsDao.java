package com.mycompany.lifill_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.PrdContents;

@Mapper
public interface PrdContentsDao {

	public int prdcontentsinsert(PrdContents prdContents);

}
