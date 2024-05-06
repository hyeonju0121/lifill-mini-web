package com.mycompany.lifill_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.Board;
import com.mycompany.lifill_mini_web.dto.Pager;

@Mapper
public interface BoardDao {
	public int insert(Board board);
	public int count();
	public List<Board> selectByPage(Pager pager);
	public Board selectByBno(int bno);
	public Board selectAttachData(int bno);

}
