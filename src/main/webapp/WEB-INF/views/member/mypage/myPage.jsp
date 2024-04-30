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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/my_page.css">
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
			
		</script>
		
	</head>
	
	<body>
		<!-- 네비게이션 바  ------------------------------------------------------------------------>
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>
		
		<div class="container wrap" style="width:100%; height: 100%; padding-top:100px; padding-bottom: 300px;">
			<div class="d-flex">
				<div id="my_box"  style="width:24%; height: 80%; padding: 0px 30px;">
					<h2 style="padding-bottom: 60px; width:15rem;"><a href="mypage" style="text-decoration-line: none; color:black;"><b>마이페이지</b></a></h2>
					
					<ul class="my_menu">
						<li id="menu1" style="height: 20%;">  
							<a class="menu_depth01" href="#">나의 쇼핑 정보</a>
							<ul class="menu_depth02">
								<li id="order"><a href="orderList">주문 내역</a></li>
								<li id="claim"><a href="orderListClaim">교환/반품/취소 내역</a></li>
							</ul>
						</li>
						<li id="menu2" style="height: 20%; ">
							<a class="menu_depth01" href="#">나의 참여 내역</a>
							<ul class="menu_depth02">
								<li id="inquiry"><a href="myInquiryList">1:1 문의</a></li>
								<li id="review"><a href="myGoodsReviewList" >상품 리뷰</a></li>
							</ul>
						</li>
						<li id="menu3" style="height: 20%;">
							<a class="menu_depth01" href="#">나의 정보 관리</a>
							<ul class="menu_depth02">
								<li id="update"><a href="pwdConfirm">회원 정보 수정</a></li>
							</ul>
						</li>
					</ul>
					<div class="cs_area">
						<div class="tit_area">
							<a href="tel:010-2232-3823" class="cs_number">010-2232-3823</a>
							<span class="txt_l">(유료)</span>
						</div>
						<p class="txt_time">평일 09:00 ~ 18:00 (토/일/공휴일 휴무)</p>
						<p class="txt_break">(Break time 12:00 ~ 13:00)</p>
						<div class="ico_list">
							<a href="mailto:tjdwns3823@naver.com" class="ico_cs02">
								<img src="${pageContext.request.contextPath}/resources/image/icon/mail.png" 
								alt="Clickable Image"
								style="width: 40px; height: 40px; margin-right: 10px;"/>
								<span>tjdwns3823@naver.com 메일</span>
							</a>
							<a onclick="" class="ico_cs03">
								<img src="${pageContext.request.contextPath}/resources/image/icon/1on1.png" 
								alt="Clickable Image"
								style="width: 40px; height: 40px; margin-right: 10px;"/>
								<span>문의하기</span>
							</a>
						</div>
					</div>
					
				</div>
				
				<div class="content" style="width:80%; padding:0px 30px;">
					<div class="section_block" style="height: 20%;">
						<div class="profile_wrap">
							<div class="profile">
								<a href="#" style="cursor:default; width:100px; height: 100px;" class="img_box">
									<div id="myPageDefaultImg" style="">T</div>
								</a>
								<div class="user_info">
									<span class="name" id="spanNknm">tjd******</span>
									<a href="updateMember" class="btn_edit">
										<span class="blind">프로필 편집하기</span>
									</a>
									<p class="date">가입일 : <sapn>2024.04.18</sapn></p>
								</div>
							</div>
							
						</div>
					</div>
					
					<div class="section_block" style="padding-top: 60px;">
						<div class="tit_area mb-2">
							<div class="flexbox align_c">
								<strong class="s_sub">주문 내역</strong>
								<span class="s_tit">(최근 1개월)</span>
							</div>
							<a href="orderList" class="btn_detail">전체보기</a>
						</div>
						<div class="grayline_box flexbox">
							<ol class="my_order">
								<li class="step">
									<a href="#" class="count">0</a>
									<span class="status">입금대기</span>
								</li>
					            <li class="step">
									<a href="#" class="count">0</a>
									<span class="status">결제완료</span>
								</li>
					            <li class="step">
									<a href="#" class="count" style="color: #37cbe9;">1</a>
									<span class="status">상품준비중</span>
								</li>
					            <li class="step">
									<a href="#" class="count" >0</a>
									<span class="status">배송중</span>
								</li>
					            <li class="step">
									<a href="#" class="count">0</a>
									<span class="status">배송완료</span>
								</li>
							</ol>
							<ul class="my_order_box">
								<li class="step" onclick="">
									<a><span class="status">취소</span></a>
									<a><span class="count">0</span></a>
								</li>
								<li class="step" onclick="">
									<a><span class="status">교환</span></a>
									<a><span class="count">0</span></a>
								</li>
								<li class="step" onclick="">
									<a><span class="status">반품</span></a>
									<a><span class="count">0</span></a>
								</li>
							</ul>
						</div>
						
						<div class="section_block">
							<div class="no_data type4">최근 1개월 내 주문 내역이 없습니다.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>