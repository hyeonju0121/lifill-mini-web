<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>마이 페이지 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/my_page.css">
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
			
		</script>
		
	</head>
	
	<body>
		<!-- 네비게이션 바  ------------------------------------------------------------------------>
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>
		
		<div class="container wrap border border-info" style="width:100%; height: 100%; padding-top:100px; padding-bottom: 300px;">
			<div class="d-flex">
				<div id="my_box"  style="width:24%; height: 80%; padding: 0px 30px;">
					<h2 style="padding-bottom: 60px; width:15rem;"><a href="my_page" style="text-decoration-line: none; color:black;"><b>마이페이지</b></a></h2>
					
					<ul class="my_menu">
						<li id="menu1" style="height: 20%;">  
							<a class="menu_depth01" href="">나의 쇼핑 정보</a>
							<ul class="menu_depth02">
								<li><a href="">주문 내역</a></li>
								<li><a href="">교환/반품/취소 내역</a></li>
							</ul>
						</li>
						<li id="menu2" style="height: 20%; ">
							<a class="menu_depth01" href="">나의 참여 내역</a>
							<ul class="menu_depth02">
								<li><a href="">1:1 문의</a></li>
								<li><a href="" >상품 리뷰</a></li>
							</ul>
						</li>
						<li id="menu3" style="height: 20%;">
							<a class="menu_depth01" href="">나의 정보 관리</a>
							<ul class="menu_depth02">
								<li><a href="">회원 정보 수정</a></li>
							</ul>
						</li>
					</ul>
					
					<div class="cs_area" style="margin-top:60px;">
						<a href="#"><b>1661-8858</b></a>
						<span>(유료)</span>
						<p>평일 09:00 ~ 18:00 (토/일/공휴일 휴무)</p>
						<p>(Break time 12:00 ~ 13:00)</p>
						
						<div class="icon_list" style="margin-top:20px;">
							<a href="#"><span>1:1 문의 바로가기</span></a>
						</div>
					</div>
				</div>
				
				<div class="border border-dark" style="width:80%; padding:0px 30px;">
					<div class="border border-warning section_block">
						<div class="profile_wrap">
							<div class="profile">
							
							</div>
						</div>
						유현주님
					</div>
				</div>
			
			</div>
		</div>
	</body>
</html>