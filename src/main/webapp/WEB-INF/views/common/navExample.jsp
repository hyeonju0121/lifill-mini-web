<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/nav.css">

<header>
	<nav>
		<h1 class="logo">Blog</h1>
			<ul class="menu">
				<li><a href="#">About</a></li>
				<li><a href="#">Projects</a></li>
				<li><a href="#">Articles</a>
					<ul class="submenu">
						<li><a href="#">Frontend</a>
							<ul class="submenu2">
								<li><a href="#">HTML</a></li>
								<li><a href="#">CSS</a></li>
								<li><a href="#">Javascript</a></li>
							</ul>
						</li>
						<li><a href="#">BackEnd</a>
							<ul class="submenu2">
								<li><a href="#">백엔드</a></li>
								<li><a href="#">백엔드</a></li>
								<li><a href="#">백</a></li>
								<li><a href="#">백</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li><a href="#">Services</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
			<!-- 장바구니, 사용자 버튼 -->
			<button class="btn btn-success btn-sm" onclick="location.href='${pageContext.request.contextPath}/member/sign_in'">
				로그인
			</button>
			<!-- 로그인 안된 경우 -->
	    	<sec:authorize access="isAnonymous()">
	    		<a href="${pageContext.request.contextPath}/member/sign_in">
	    			<i class="lni lni-enter"></i>
	    		</a>
	    	</sec:authorize>
	    	<!-- 로그인 된 경우 -> 로그아웃 버튼 활성화 -->
	    	<sec:authorize access="isAuthenticated()">
	    		사이트간 요청 위조 방지 설정이 비활성화되어 있을 경우 GET 방식으로 요청 가능
	    		<b class="text-white me-2">
	    			<sec:authentication property="principal.username"/>
	    			<span>님, 안녕하세요!</span>
	    		</b>
	    		<a href="${pageContext.request.contextPath}/logout" class="btn btn-success btn-small">logout</a>
	    		
	    		사이트간 요청 위조 방지 설정이 활성화되어 있을 경우 POST 방식으로만 요청 가능
	    		<form action="post" action="${pageContext.request.contextPath}/logout">
	    			사이트간 요청 위조 방지 설정이 활성화 된 경우에는 hidden 이 코드를 폼 안에 반드시 넣어줘야 한다.
	    			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	    			<button type="submit" class="btn btn-success btn-sm">로그아웃</button>
	    		</form>
	    	</sec:authorize>
			
			<button class="btn" onclick="location.href='${pageContext.request.contextPath}/member/cart'">
				<img class="icon-img" 
				src="${pageContext.request.contextPath}/resources/image/icon/cart.png"/>
			</button>
			<button class="btn" onclick="location.href='${pageContext.request.contextPath}/member/mypage'">
				<img class="icon-img" 
				src="${pageContext.request.contextPath}/resources/image/icon/user.png"/>
			</button>
		</nav>
</header>