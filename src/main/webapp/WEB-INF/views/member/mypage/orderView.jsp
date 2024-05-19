<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이 페이지 - 라이필</title>

<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>

<!-- jQuery 외부 라이브러리  설정-->
<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>

<!-- external css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/orderView.css">

<!-- 사용자 정의 자바스크립트 -->
<script>
	
</script>

</head>

	<body>
		<!-- 네비게이션 바  ------------------------------------------------------------------------>
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	
		<div class="container wrap"
			style="width: 100%; height: 100%; padding-top: 100px; padding-bottom: 300px;">
			<div class="d-flex">
				<div id="my_box" style="width: 24%; height: 80%; padding: 0px 30px;">
					<h2 style="padding-bottom: 60px; width: 15rem;">
						<a href="mypage" style="text-decoration-line: none; color: black;"><b>마이페이지</b></a>
					</h2>
	
					<ul class="my_menu">
						<li id="menu1" style="height: 20%;"><a class="menu_depth01"
							href="#">나의 쇼핑 정보</a>
							<ul class="menu_depth02">
								<li id="order"><a href="orderList">주문 내역</a></li>
								<li id="claim"><a href="orderListClaim">교환/환불 내역</a></li>
							</ul></li>
						<li id="menu2" style="height: 20%;"><a class="menu_depth01"
							href="#">나의 참여 내역</a>
							<ul class="menu_depth02">
								<li id="inquiry"><a href="myInquiryList">1:1 문의</a></li>
								<li id="inquiryItem"><a href="myQnaList">상품 Q&A</a></li>
								<li id="review"><a href="myGoodsReviewList">상품 리뷰</a></li>
							</ul></li>
						<li id="menu3" style="height: 20%;"><a class="menu_depth01"
							href="#">나의 정보 관리</a>
							<ul class="menu_depth02">
								<li id="update"><a href="pwdConfirm">회원 정보 수정</a></li>
							</ul></li>
					</ul>
					<div class="cs_area">
						<div class="tit_area">
							<a href="tel:010-2232-3823" class="cs_number">010-2232-3823</a> <span
								class="txt_l">(유료)</span>
						</div>
						<p class="txt_time">평일 09:00 ~ 18:00 (토/일/공휴일 휴무)</p>
						<p class="txt_break">(Break time 12:00 ~ 13:00)</p>
						<div class="ico_list">
							<a href="mailto:tjdwns3823@naver.com" class="ico_cs02"> <img
								src="${pageContext.request.contextPath}/resources/image/icon/mail.png"
								alt="Clickable Image"
								style="width: 40px; height: 40px; margin-right: 10px;" /> <span>tjdwns3823@naver.com
									메일</span>
							</a> <a href="csInquiry" class="ico_cs03"> <img
								src="${pageContext.request.contextPath}/resources/image/icon/1on1.png"
								alt="Clickable Image"
								style="width: 40px; height: 40px; margin-right: 10px;" /> <span>문의하기</span>
							</a>
						</div>
					</div>
				</div>
	
				<div class="content">
						<div class="no_data type4">
						<section class="mypage-cont">
							<header class="n-section-title">
								<div class="tit_area line_thick">
									<strong class="tit_lv2">주문 상세 내역</strong>
								</div>
								<dl class="order">
									<dt>주문번호</dt>
									<dd>${orders[0].ordid}</dd>
									<dt>주문일자</dt>
									<dd><fmt:formatDate value="${orders[0].ordcreatedat}" pattern="yyyy-MM-dd"/></dd>
								</dl>
							</header>

							<table class="n-table table-col n-order-view">
								<colgroup>
									<col style="width: *">
									<col style="width: 13%">
									<col style="width: 13%">
									<col style="width: 13%">
									<col style="width: 15%">
									<col style="width: 10%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">상품정보</th>
										<th scope="col">주문금액</th>
										<th scope="col">주문수량</th>
										<th scope="col">합계</th>
										<th scope="col" colspan="2">주문 상태</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="order" items="${orders}">
									<tr>
										<td>
											<div class="n-prd-row">
												<a href="/app/goods/1985223/0" class="img-block"> <img
													src="attachDownload?prdcode=${order.prdcode}"
													alt="${order.prdname}">
												</a>
												<ul class="info">
													<li class="brand">${order.prdbrand}</li>
													<li class="name"><a href="${pageContext.request.contextPath}/item/item_view?prdcode=${order.prdcode}">${order.prdname}</a></li>
												</ul>
											</div>
										</td>
										<td>${order.prdprice}</td>
										<td>
											<span class="txt-default">${order.odtamount}개</span>
										</td>
										<td>${order.prdprice}원</td>
										<td>${order.ordstatus}</td>
											<c:if test="${order.ordstatus eq '입금대기'}">
												<td>
													<div class="btn-set btn-parents">
														<button type="button" class="n-btn btn-sm btn-accent"
															onclick="">주문취소</button>
														<button type="button" class="n-btn btn-sm btn-accent"
															onclick="location.href='${pageContext.request.contextPath}/member/csInquiry?prdcode=${order.prdcode}'">문의하기</button>
													</div>
												</td>
											</c:if>
											<c:if test="${order.ordstatus eq '결제완료'}">
												<td>
													<div class="btn-set btn-parents">
														<button type="button" class="n-btn btn-sm btn-accent"
															onclick="">주문취소</button>
														<button type="button" class="n-btn btn-sm btn-accent"
															onclick="location.href='${pageContext.request.contextPath}/member/csInquiry?prdcode=${order.prdcode}'">문의하기</button>
													</div>
												</td>
											</c:if>
											<c:if test="${order.ordstatus eq '상품준비중'}">
												<td>
													<div class="btn-set btn-parents">
			
														<button type="button" class="n-btn btn-sm btn-accent"
															onclick="location.href='${pageContext.request.contextPath}/member/csInquiry?prdcode=${order.prdcode}'">문의하기</button>
													</div>
												</td>
											</c:if>
											<c:if test="${order.ordstatus eq '배송중'}">
												<td>
													<div class="btn-set btn-parents">
														<button type="button" class="n-btn btn-sm btn-accent"
															onclick="location.href='${pageContext.request.contextPath}/member/csInquiry?prdcode=${order.prdcode}'">문의하기</button>
													</div>
												</td>
											</c:if>
											<c:if test="${order.ordstatus eq '배송완료'}">
												<td>
													<div class="btn-set btn-parents">
														<button type="button" class="n-btn btn-sm btn-accent"
															onclick="location.href='${pageContext.request.contextPath}/member/csInquiry?prdcode=${order.prdcode}'">문의하기</button>
													</div>
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<div class="n-section-wrap wrap-detail">

								<!-- 배송지 정보 -->
								<section class="n-section-block">
									<header class="n-table-title">
										<h2>배송지 정보</h2>
									</header>

									<table class="n-table table-row">
										<colgroup>
											<col style="width: 190px">
											<col style="width: *">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">이름</th>
												<td>${orders[0].ordreceivername}</td>
											</tr>
											<tr>
												<th scope="row">연락처</th>
												<td>${orders[0].ordreceiverphone}</td>
											</tr>
											<tr>
												<th scope="row">배송지 주소</th>
												<td>(${orders[0].ordreceiverzipcode}) ${orders[0].ordreceiveraddress}</td>
											</tr>
											<tr>
												<th scope="row">배송 메시지</th>
												<td>${orders[0].ordrequest}</td>
											</tr>
										</tbody>
									</table>
								</section>

								<!-- 최종 결제 정보 -->
								<section class="n-section-block n-total-payment">
									<header class="n-table-title">
										<h2>최종 결제 정보</h2>
									</header>

									<div class="order__list order__list--information">
										<dl class="order__item">
											<dt class="order__item__definition">상품 합계</dt>
											<dd class="order__item__description">
												<span id="total_pay_amt">${orders[0].ordtotalprice}</span>원
											</dd>
										</dl>
										<dl class="order__item">
											<dt class="order__item__definition">배송비 합계</dt>
											<dd class="order__item__description txt-info">배송비 무료</dd>
										</dl>
										
										<dl class="order__item order__item--total-payment">
											<dt class="order__item__definition">
												<strong>최종 결제 금액</strong>
											</dt>
											<dd class="order__item__description">
												<div class="total-wrap">
													<span class="total">${orders[0].ordtotalprice}원</span>
												</div>
											</dd>
										</dl>
										<dl class="order__item">
											<dt class="order__item__definition">결제 수단</dt>
											<dd class="order__item__description">미구현</dd>
										</dl>
									</div>
								</section>
								<!-- //최종 결제 정보 -->

							</div>
						</section>
							<button class="btn" id="goToOrderList" onclick="location.href='orderList'">목록으로</button>
					</div>
				</div>
			</div>
		</div>
	
		<!-- footer  ------------------------------------------------------------------------>
		<!-- 현재 footer.css와 충돌하는 게 있는건지 css가 깨짐 -->
	</body>
</html>