<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>마이 페이지 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>
		
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/orderList_claim.css">
		
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
								<li id="inquiryItem"><a href="myQnaList">상품 Q&A</a></li>
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
							<a href="csInquiry" class="ico_cs03">
								<img src="${pageContext.request.contextPath}/resources/image/icon/1on1.png" 
								alt="Clickable Image"
								style="width: 40px; height: 40px; margin-right: 10px;"/>
								<span>문의하기</span>
							</a>
						</div>
					</div>
				</div>
				
				<div class="content">
					<div class="tit_area line_thick">
						<strong class="tit_lv2">교환/반품/취소 내역</strong>
					</div>
					
					<div class="tab_style3">
						<button type="button" class="tab_btn is_active" onclick="" data-tab="tab-01"><span class="txt_s">교환</span></button>
						<button type="button" class="tab_btn " onclick="" data-tab="tab-02"><span class="txt_s">반품</span></button>
						<button type="button" class="tab_btn " onclick="" data-tab="tab-03"><span class="txt_s">취소</span></button>
					</div>
					<div class="section_block">
						<div class="form_period_group">
							<!-- 날짜 탭 -->
							<ul class="form_period">
								<li class="option">
									<input type="radio" id="chkSize1" name="chkSize1" 
									onclick="" data-date="0" checked="checked">
									<label for="chkSize1">1개월</label>
								</li>
								<li class="option">
									<input type="radio" id="chkSize2" name="chkSize2" 
									onclick="" data-date="1">
									<label for="chkSize2">3개월</label>
								</li>
								<li class="option">
									<input type="radio" id="chkSize3" name="chkSize3" 
									onclick="" data-date="2">
									<label for="chkSize3">6개월</label>
								</li>
								<li class="option">
									<input type="radio" id="chkSize4" name="chkSize4" 
									onclick="" data-date="3">
									<label for="chkSize4">1년</label>
								</li>
							</ul>
				
							<!-- 시작일, 종료일 -->
							<div class="form_set period">
								<div class="date">
									<input type="text" 
									class="datepicker hasDatepicker" 
									readonly="readonly" 
									id="dateStart"/>
									<button type="button" class="ui-datepicker-trigger">
										<img src="${pageContext.request.contextPath}/resources/image/icon/calendar.png" 
										alt="Select date" title="Select date">
									</button>
								</div>
								
								<span class="bar">~</span>
								
								<div class="date">
									<input type="text" 
									class="datepicker hasDatepicker" 
									readonly="readonly" 
									id="dateEnd">
									<button type="button" class="ui-datepicker-trigger">
										<img src="${pageContext.request.contextPath}/resources/image/icon/calendar.png" 
										alt="Select date" title="Select date">
									</button>
								</div>
							</div>
							<button id="checkDate" type="button" class="btn" onclick="">조회</button>
						</div>
				
						<!-- 주문상태 카운트 -->
						<ol class="my_order my_benefit">
							<li class="step ">
								<a href="#" class="count" style="display: none">0</a>
								<span class="value disabled count" style="display: ">0</span>
								<span class="status">입금대기</span>
							</li>
							<li class="step ">
								<a href="#" class="count" style="display: none">0</a>
								<span class="value disabled count" style="display: ">0</span>
								<span class="status">결제완료</span>
							</li>
							<li class="step ">
								<a href="#" class="count" style="display: none">0</a>
								<span class="value disabled count" style="display: ">1</span>
								<span class="status">상품준비중</span>
							</li>
							<li class="step ">
								<a href="#" class="count" style="display: none">0</a>
								<span class="value disabled count" style="display: ">0</span>
								<span class="status">배송중</span>
							</li>
							<li class="step ">
								<a href="#" class="count" style="display: none">0</a>
								<span class="value disabled count" style="display: ">0</span>
								<span class="status">배송완료</span>
							</li>
						</ol>
					</div>
				
					<div id="order_list_div" class="section_block">
						<div class="no_data type4">
							기간 내 교환 내역이 없습니다.
						</div>
					</div>
						<!-- 주문/배송 단계 안내 -->
					<div class="section_block order_ship_info">
						<div class="grayline_box">
							<div class="title_area">
								교환 단계 안내
							</div>
							<ol class="step_guide_box">
								<li class="box">
									<strong class="tit"><em>STEP 1 </em>교환신청</strong>
									<ul class="list_type1 type2">
										<li class="type2_other_li">교환은 배송완료 후 7일 이내 신청 가능합니다.</li>
									</ul>
								</li>
								<li class="box">
									<strong class="tit"><em>STEP 2 </em>교환처리중</strong>
									<ul class="list_type1 type2">
										<li class="type2_other_li">교환접수가 확인되어 교환이 진행됩니다.</li>
									</ul>
								</li>
								<li class="box">
									<strong class="tit"><em>STEP 3 </em>교환품배송</strong>
									<ul class="list_type1 type2">
										<li class="type2_other_li">교환할 새로운 상품을 발송하였습니다.</li>
									</ul>
								</li>
								<li class="box">
									<strong class="tit"><em>STEP 4 </em>교환완료</strong>
									<ul class="list_type1 type2">
										<li class="type2_other_li">교환 상품이 고객님께 배송완료 되었습니다.</li>
									</ul>
								</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- footer  ------------------------------------------------------------------------>
		<!-- 현재 footer.css와 충돌하는 게 있는건지 css가 깨짐 -->
		
	</body>
</html>