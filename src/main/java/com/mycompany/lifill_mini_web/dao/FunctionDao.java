package com.mycompany.lifill_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.Function;

@Mapper
public interface FunctionDao {

	public int fninsert(Function function);

}
