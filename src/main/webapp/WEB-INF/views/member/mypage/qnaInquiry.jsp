<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/qnaInquiry.css">
		
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
								<li id="claim"><a href="orderListClaim">교환/환불 내역</a></li>
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
							<a onclick="" class="ico_cs03">
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
						<h2 class="tit_lv2">상품 문의</h2>
					</div>
					<form name="qnaInquiry" id="qnaInquiry" method="post" action="applyCsInquiry">
					<div class="section_block">
						<div class="form_table no_line">
							<div class="tr">
								<input type="hidden" id="prdcode" name="prdcode" value="${product.prdcode}">
								<div class="th">
									<p class="form_label required">문의 상품 </p>
								</div>
								<div class="img-td">
									<div class="profile_wrap">
										<div class="profile profile_attach">
											<div id="itemImg">
												<img src="attachDownload?prdcode=${product.prdcode}"
													class="rounded-3" style="width: 90px; height: 90px;" />
											</div>
											<div class="profile_edit">
												<p class="tit">[${product.prdbrand}]<span class="sub">${product.prdname}</span></p>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="tr">
								<div class="th">
									<p class="form_label required">문의 유형 </p>
								</div>
								<div class="td">
									<div class="custom_select_wrap lg">
									  <select name="requestInqval" id="requestInqval" style="width:100%; height:50px; border: 1px solid gray;">
									    <option value="product" selected>상품문의</option>
									  </select>
									</div>
								</div>
							</div>
							
							<div class="tr">
								<div class="th">
									<p class="form_label required">문의 제목</p>
								</div>
								<div class="td">
									<div class="textarea_group sm">
										<textarea id="inqtitle" name="inqtitle" title="문의제목 입력" placeholder="문의 제목을 입력해주세요." maxlength="100"></textarea>
										<p class="form_bytes"><span class="byte">0</span>/100</p>
									</div>
								</div>
							</div>
							<div class="tr">
								<div class="th">
									<p class="form_label required">문의 내용</p>
								</div>
								<div class="td">
									<div class="textarea_group lg">
										<textarea id="inqcontent" name="inqcontent" placeholder="문의 내용을 입력해주세요." cols="" rows="" title="문의내용 입력" maxlength="1000" onpaste="checkCnt(this)" onchange="checkCnt(this)" onkeydown="checkCnt(this)" onkeyup="checkCnt(this)"></textarea>
										<p class="form_bytes"><span class="byte">0</span>/1,000</p>
									</div>
								</div>
							</div>
						<ul class="list_type1 type2 mt30">
							<li>배송, 교환/반품/취소에 대한 문의는 My Page &gt; 1:1문의를 통해 접수 부탁드립니다.</li>
							<li>상품과 관련없는 내용, 비방, 광고, 불건전한 내용의 글은 사전 동의없이 삭제될 수 있습니다.</li>
							<li>작성하신 문의는 My Page &gt; 상품 Q&A에서 확인하실 수 있습니다.</li>
						</ul>
						<div class="btn_big_wrap btn_size_fix">
							<button type="button" class="white" onclick="location.href='myInquiryList'">취소</button>
							<button type="submit" class="btnInsert">등록</button>
						</div>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>