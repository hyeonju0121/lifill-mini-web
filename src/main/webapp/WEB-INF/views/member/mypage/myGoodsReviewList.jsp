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
		<link href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>
		
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/myGoodsReviewList.css">
		
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
					<div class="tit_area line_thick mb0">
						<strong class="tit_lv2">상품 리뷰</strong>
					</div>
					<div class="widget_managing_reviews js-pagination-list">
					    <div class="widget_managing_reviews__head">
							<div class="managing_reviews_header">
								<ul class="managing_reviews_header__tab_list">
							    	<li id="written_review" class="managing_reviews_header__tab ">
										내가 작성한 리뷰 (${totalReviewCnt}개)
								    </li>
							  	</ul>
							  	<c:if test="${totalReviewCnt < 1}">
								    <div class="managing_reviews_header__message managing_reviews_header__message--pending_reviews">
								        작성한 리뷰가 없습니다.
								        상품을 구매하고 리뷰를 작성해보세요!
								    </div>
							  	</c:if>
							  	<c:if test="${totalReviewCnt >= 1}">
									<table>
										<div class="done_wrap type4">
												<div class="notice">
													<div class="tab_cont_box">
														<div class="tab_cont" data-id="tab-01">
															<div class="tab_cont_inner faq_accordion">
																<div class="divi_line qna_inquiry_board">
																	<div class="accordion accordion-flush" id="qna_List">
																		<c:forEach var="review" items="${reviewList}">
																			<div class="acc_header" name="qna">
																				<button class="accordion-button collapsed" 
																							type="button" 
																							data-bs-toggle="collapse" 
																							data-bs-target="#flush-collapse${review.seq}" 
																							aria-expanded="false" 
																							aria-controls="flush-collapse${review.seq}">
																					<span class="prd_num">${review.seq}</span>
																					<ul class="badge_auto_list1">
																						<li>${review.prdbrand}</li>
																					</ul>
																					<ul class="badge_auto_list2">
																						<li>${review.revscore}점</li>
																					</ul>
																					<div class="prd_subtit">작성한 리뷰 펼쳐보기</div>              
																					<span class="prd_date"><fmt:formatDate value="${review.revcreatedat}" pattern="yyyy-MM-dd"/></span>
																				</button>
																			</div>
																		
																			<div id="flush-collapse${review.seq}" class="accordion-collapse collapse" data-bs-parent="#qna_List">
																		      <div class="accordion-body">
																				<div class="acc_cont cart_list order">
																					<div class="img-td">
																						<div class="profile_wrap">
																							<div class="profile profile_attach">
																								<div id="itemImg">
																									<img src="attachDownload?prdcode=${review.prdcode}"
																										class="rounded-3" style="width: 90px; height: 90px;" />
																								</div>
																								<div class="profile_edit">
																									<p class="tit">[${review.prdbrand}]<span class="sub">${review.prdname}</span></p>
																								</div>
																								</div>
																							</div>
																						</div>
																						<hr>
																					  <div class="contents">
																					  	<div id="review-date">
																					  		작성일 : <fmt:formatDate value="${review.revcreatedat}" pattern="yyyy-MM-dd"/>
																					  	</div>
																					  	${review.revcontent}
																					  </div>
																				</div>
																		      </div>
																		    </div>
																	   </c:forEach>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</table>
							  	</c:if>
							</div>
					    </div>
					    <div class="widget_managing_reviews__list">
					      <ul>
					      
					      </ul>
					    </div>
				  	</div>
				</div>
			</div>
		</div>
	</body>
</html>