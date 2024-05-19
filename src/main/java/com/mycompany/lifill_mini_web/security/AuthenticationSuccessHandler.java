package com.mycompany.lifill_mini_web.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthenticationSuccessHandler

	// 로그인 성공 후에 무조건 defaultTargetUrl로 이동
	extends SimpleUrlAuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(
			HttpServletRequest request, 
			HttpServletResponse response,
			Authentication authentication) 
					throws ServletException, IOException {
		// 인증 성공시 자동으로 실행
		log.info("실행");
		
		// 로그인 성공 후에 이동할 Url 지정 
		setDefaultTargetUrl("/"); // extends SimpleUrlAuthenticationSuccessHandler 사용시에만 ! 
		// 기타 기본 설정을 적용하기 위해 부모 메소드 호출
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
}
