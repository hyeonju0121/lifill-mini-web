package com.mycompany.lifill_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.PrdHashtag;

@Mapper
public interface PrdHashtagDao {

	public int prdhashtaginsert(PrdHashtag prdHashtag);

}
