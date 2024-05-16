<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/nav.css">


	<nav class="navbar navbar-expand-sm">
		<div class="container-fluid">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/main">LIFILL</a>
				<div class="navbar-collapse collapse show" id="mynavbar">
					<ul class="menu">
						<li><a href="#">LIFILL 스토리</a></li>
						<li><a href="#">SHOP</a>
							<ul class="submenu">
								<!-- <li><a href="${pageContext.request.contextPath}/item/category1">전체상품</a>-->
								<li><a href="${pageContext.request.contextPath}/item/categories/function">기능별</a>
									<ul class="submenu2">
										<li><a href="#">간 건강</a></li>
										<li><a href="#">눈 건강</a></li>
										<li><a href="#">장 건강</a></li>
										<li><a href="#">만성 피로</a></li>
										<li><a href="#">수면, 스트레스</a></li>
									</ul>
								</li>
								<li><a href="${pageContext.request.contextPath}/item/categories/ingredient">성분별</a>
									<ul class="submenu2">
										<li><a href="#">비타민/미네랄</a></li>
										<li><a href="#">유산균</a></li>
										<li><a href="#">오메가3</a></li>
										<li><a href="#">영양제</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li><a href="#">게시판</a>
							<ul class="submenu">
								<li><a href="${pageContext.request.contextPath}/board/notice">공지사항</a></li>
								<li><a href="${pageContext.request.contextPath}/board/faq">FAQ</a></li>
								<li><a href="${pageContext.request.contextPath}/member/myInquiryList">1:1문의</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
				<!-- 장바구니, 사용자 버튼 -->
				<%-- <button class="btn btn-success btn-sm" style="font-size: 13px;" onclick="location.href='${pageContext.request.contextPath}/member/sign_in'">
					로그인
				</button> --%>
				<!-- 회원가입 버튼 -->
				<button class="btn" onclick="location.href='${pageContext.request.contextPath}/member/sign_up'">
					<img class="icon-img" 
					src="${pageContext.request.contextPath}/resources/image/icon/sign_up.png"/>
				</button>
				
				<!-- 로그인 안된 경우 -->
		    	<sec:authorize access="isAnonymous()">
		    		<a href="${pageContext.request.contextPath}/member/sign_in">
			    		<button class="btn">
							<img class="icon-img" 
							src="${pageContext.request.contextPath}/resources/image/icon/login.png"/>
					    </button>
		    		</a>
		    	</sec:authorize>
		    	<!-- 로그인 된 경우 -> 로그아웃 버튼 활성화 -->
		    	<sec:authorize access="isAuthenticated()">
		    		<!-- 사이트간 요청 위조 방지 설정이 비활성화되어 있을 경우 GET 방식으로 요청 가능 -->
		    		<b class="text-white me-2">
		    			<sec:authentication property="principal.username"/>
		    			<span>님, 안녕하세요!</span>
		    		</b>
		    		<a href="${pageContext.request.contextPath}/logout" class="btn btn-success btn-small">logout</a>
		    		
		    		<%-- <!-- 사이트간 요청 위조 방지 설정이 활성화되어 있을 경우 POST 방식으로만 요청 가능 -->
		    		<form action="post" action="${pageContext.request.contextPath}/logout">
		    			<!-- 사이트간 요청 위조 방지 설정이 활성화 된 경우에는 hidden 이 코드를 폼 안에 반드시 넣어줘야 한다. -->
		    			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		    			<button type="submit" class="btn btn-success btn-sm">로그아웃</button>
		    		</form> --%>
		    	</sec:authorize>
		    	
				<button class="btn" onclick="location.href='${pageContext.request.contextPath}/member/mypage'">
					<img class="icon-img" 
					src="${pageContext.request.contextPath}/resources/image/icon/mypage.png"/>
				</button>
				
				<button class="btn" onclick="location.href='${pageContext.request.contextPath}/member/cart'">
					<img class="icon-img" 
					src="${pageContext.request.contextPath}/resources/image/icon/cart3.png"/>
				</button>
		</nav>
