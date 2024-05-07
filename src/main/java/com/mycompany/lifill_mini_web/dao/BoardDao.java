package com.mycompany.lifill_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.Board;
import com.mycompany.lifill_mini_web.dto.Pager;

@Mapper
public interface BoardDao {
	public int binsert(Board board);
	public int bcount();
	public List<Board> bselectByPage(Pager pager);
	public Board bselectByBno(int bno);
	public Board bselectByAttachData(int bno);
	public int bupdate(Board board);
	public int bdeleteByBno(int bno);

}
