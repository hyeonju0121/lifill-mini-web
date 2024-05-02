package com.mycompany.lifill_mini_web.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.mycompany.lifill_mini_web.dao.MemberDao;
import com.mycompany.lifill_mini_web.dto.Member;

import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class LifillUserDetailsService implements UserDetailsService{
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) 
			throws UsernameNotFoundException {
		log.info("실행");
		
		Member member = memberDao.selectByMid(username);
		
		// 아이디가 존재하지 않는 경우, 예외 발생 
		if(member == null) {
			throw new UsernameNotFoundException("아이디가 존재하지 않습니다.");
		}
		
		List<GrantedAuthority> authorties = new ArrayList<>();
		authorties.add(new SimpleGrantedAuthority(member.getMrole()));
		
		UserDetails userDetails = new LifillUserDetails(member, authorties);
		
		return userDetails;
	}
	

}
