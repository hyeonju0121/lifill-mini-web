<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/nav.css">

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="main">LIFILL</a>
		<button class="navbar-toggler" type="button"
			data-bs-toggle="collapse" data-bs-target="#mynavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="mynavbar">
			<ul class="navbar-nav me-auto">
				<li class="nav-item"><a class="nav-link" href="#">LIFILL 스토리</a></li>
				<li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">SHOP</a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" href="/lifill_mini_web/item/category1#">전체상품</a></li>
			            <li><a class="dropdown-item" href="/lifill_mini_web/item/category2#">기능별</a></li>
			            <li><a class="dropdown-item" href="/lifill_mini_web/item/category3#">성분별</a></li>
			            
			          </ul>
				</li>
				<div class="dropdown">
					<button type="button" class="btn text-secondary"
						data-bs-toggle="dropdown">게시판</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/notice">공지사항</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/faq">FAQ</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/myInquiryList">1:1문의</a></li>
					</ul>
				</div>
			</ul>
		</div>
		
		<!-- 장바구니, 사용자 버튼 -->
		<%-- <button class="btn btn-success btn-sm" onclick="location.href='${pageContext.request.contextPath}/member/sign_in'">
			로그인
		</button> --%>
		<!-- 로그인 안된 경우 -->
    	<sec:authorize access="isAnonymous()">
    		<a href="${pageContext.request.contextPath}/member/sign_in">
    			<i class="lni lni-enter"></i>
    		</a>
    	</sec:authorize>
    	<!-- 로그인 된 경우 -> 로그아웃 버튼 활성화 -->
    	<sec:authorize access="isAuthenticated()">
    		<%-- 사이트간 요청 위조 방지 설정이 비활성화되어 있을 경우 GET 방식으로 요청 가능 --%>
    		<b class="text-white me-2">
    			<sec:authentication property="principal.username"/>
    			<span>님, 안녕하세요!</span>
    		</b>
    		<a href="${pageContext.request.contextPath}/logout" class="btn btn-success btn-small">logout</a>
    		
    		<%-- 사이트간 요청 위조 방지 설정이 활성화되어 있을 경우 POST 방식으로만 요청 가능 --%>
    		<%-- <form action="post" action="${pageContext.request.contextPath}/logout">
    			사이트간 요청 위조 방지 설정이 활성화 된 경우에는 hidden 이 코드를 폼 안에 반드시 넣어줘야 한다.
    			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    			<button type="submit" class="btn btn-success btn-sm">로그아웃</button>
    		</form> --%>
    	</sec:authorize>
		
		<button class="btn" onclick="location.href='${pageContext.request.contextPath}/member/cart'">
			<img class="icon-img" 
			src="${pageContext.request.contextPath}/resources/image/icon/cart.png"/>
		</button>
		<button class="btn" onclick="location.href='${pageContext.request.contextPath}/member/mypage'">
			<img class="icon-img" 
			src="${pageContext.request.contextPath}/resources/image/icon/user.png"/>
		</button>
	</div>
</nav>