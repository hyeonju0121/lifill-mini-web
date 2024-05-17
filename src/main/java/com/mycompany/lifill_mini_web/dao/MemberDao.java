package com.mycompany.lifill_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.Member;
import com.mycompany.lifill_mini_web.dto.response.MemberResponse;

@Mapper
public interface MemberDao {

	public Member selectByMid(String mid);
	public int mInsert(MemberResponse memberResponse);
	public String selectAddressByMid(String mid);
	public String selectZipcodeByMid(String mid);
	public String getMpasswordbyMid(String mid);
	public int updateMstatusbyMid(String mid);
	public String selectMphoneByMid(Member member);
	public void updateMpassword(Member member);
	public void updateMphone(Member member);
}
