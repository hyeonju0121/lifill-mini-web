package com.mycompany.lifill_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.Board;

@Mapper
public interface BoardDao {
	public int insert(Board board);

}
