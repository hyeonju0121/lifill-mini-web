package com.mycompany.lifill_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.Board;
import com.mycompany.lifill_mini_web.dto.Pager;

@Mapper
public interface BoardDao {
	public int bInsert(Board board);
	public int bCount();
	public int bCountNoticeType();
	public int bCountFaqType();
	public List<Board> bSelectByPageForFaq(Pager pager);
	public List<Board> bSelectByPageForNotice(Pager pager);
	public Board bSelectByBno(int bno);
	public Board bSelectByAttachData(int bno);
	public int bUpdate(Board board);
	public int bDeleteByBno(int bno);
	
	
	public List<Board> bAdminSelectByPageForNotice(Pager pager);
	public List<Board> bAdminSelectByPageForFaq(Pager pager);
}
