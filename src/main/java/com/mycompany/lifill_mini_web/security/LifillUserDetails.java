package com.mycompany.lifill_mini_web.security;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.mycompany.lifill_mini_web.dto.Member;

public class LifillUserDetails extends User  {
	private Member member;
	
	public LifillUserDetails(Member member, List<GrantedAuthority> authorties) {
		super(member.getMid(),
			  member.getMpassword(),
			  true, true, true, true,
			  authorties); 
		this.member = member;
	}

	public Member getMember() {
		return member;
	}


}
