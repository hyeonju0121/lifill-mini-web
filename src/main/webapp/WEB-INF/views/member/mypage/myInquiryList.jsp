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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/myInquiryList.css">
		
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
						<h2 class="tit_lv2">1:1 문의</h2>
					</div>
					<div class="section_block">
						<ul class="my_order has_border">
							<!-- 해당 탭 선택 시 ,is_active 추가 -->
							<li class="step is_active" onclick="">
								<!-- 갯수가 1개 이상일 경우 ,is_active 추가 -->
								<a href="#" class="count ">${totalMTMCnt}</a>
								<span class="status">전체문의</span>
							</li>
							<li class="step" onclick="">
									<a href="#" class="count ">${totalApplyCnt}</a>
									<span class="status">답변 완료</span>
								</li>
							<li class="step" onclick="">
									<a href="#" class="count ">${totalNoApplyCnt}</a>
									<span class="status">답변대기</span>
								</li>
							</ul>
						<div class="info_between mt30">
							<ul class="list_type1 type2">
								<li>상담시간 : 월~금 09:00 ~ 18:00 (점심시간 12:00 ~ 13:00, 토/일/공휴일 휴무)</li>
								<li>접수된 문의 내용은 수정이 불가능하오니 서비스 이용에 참고 부탁드립니다.</li>
							</ul>
						</div>
					</div>
				
					<div class="section_block data_detail">
						
						<c:if test="${totalMTMCnt < 1}">
							<div class="no_data type4" id="noDataDiv" style="">1:1 문의 내역이 없습니다.</div>
						</c:if>
						
						<c:if test="${totalMTMCnt >= 1}">
							<table>
								<div class="done_wrap type4">
										<div class="notice">
											<div class="tab_cont_box">
												<div class="tab_cont" data-id="tab-01">
													<div class="tab_cont_inner faq_accordion">
														<div class="divi_line qna_inquiry_board">
															<div class="accordion accordion-flush" id="qna_List">
																<c:forEach var="inq" items="${inquiryList}">
																<div class="acc_header" name="qna">
																	<button class="accordion-button collapsed" 
																				type="button" 
																				data-bs-toggle="collapse" 
																				data-bs-target="#flush-collapse${inq.seq}" 
																				aria-expanded="false" 
																				aria-controls="flush-collapse${inq.seq}">
																		<span class="prd_num">${inq.seq}</span>
																		<ul class="badge_auto_list1">
																			<li>상품</li>
																		</ul>
																		<ul class="badge_auto_list2">
																			<li>${inq.inqstatus}</li>
																		</ul>
																		<div class="prd_subtit">${inq.inqtitle}</div>              
																		<span class="prd_date"><fmt:formatDate value="${inq.inqcreatedat}" pattern="yyyy-MM-dd"/></span>
																	</button>
																</div>
																
																<div id="flush-collapse${inq.seq}" class="accordion-collapse collapse" data-bs-parent="#qna_List">
															      <div class="accordion-body">
																	<div class="acc_cont cart_list order">
																		<div class="img-td">
																			<div class="profile_wrap">
																				<div class="profile profile_attach">
																					<div id="itemImg">
																						<img src="attachDownload?prdcode=${inq.prdcode}"
																							class="rounded-3" style="width: 90px; height: 90px;" />
																					</div>
																					<div class="profile_edit">
																						<p class="tit">[${inq.prdbrand}]<span class="sub">${inq.prdname}</span></p>
																					</div>
																					</div>
																				</div>
																			</div>
																			<hr>
																		  <div class="contents">${inq.inqcontent}</div>
																		  <c:if test="${inq.inqstatus} eq '답변완료'">
																			  <hr>
																			  <div class="comment">
																			  	<p class="tit">[라이필 관리자]</p>
																			  	<div class="text">${inq.inqreply}</div>
																			  	<span class="prd_date"><fmt:formatDate value="${inq.inqupdatedat}" pattern="yyyy-MM-dd"/></span>
																			  </div>
																		  </c:if>
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
		</div>
	</body>
</html>