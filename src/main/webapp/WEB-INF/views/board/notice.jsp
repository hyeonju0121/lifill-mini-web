<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>공지사항 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>
		
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/notice.css">
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
			function adjustPagerPosition() {
			    // 열린 아코디언의 높이를 계산
			    var accordionHeight = $('.accordion.show').outerHeight();
			    // 현재 pager의 위치
			    var currentPagerTop = $('.pager').offset().top;
			    // 아코디언이 열렸을 때 pager가 원래 위치해 있던 곳보다 height 값만큼 아래로 내려가게 함
			    $('.pager').css('top', currentPagerTop + accordionHeight);
			}
			
	        $(document).ready(function() {
	            // 아코디언이 열렸을 때 발생하는 이벤트
	            $('.accordion-button').on('click', function() {
	                // 아코디언이 완전히 확장된 후에 발생하는 이벤트
	                $(this).closest('.accordion').one('shown.bs.collapse', function() {
	                    // pager 위치 조정 함수 호출
	                    adjustPagerPosition();
	                });
	            });
	        });

		</script>
		
	</head>
	
	<body>
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>
		
		<div class="container wrap" style="width:100%; height: 100%; padding-top:100px; padding-bottom: 300px;">
			<div class="d-flex">
				<div id="my_box"  style="width:24%; height: 80%; padding: 0px 30px;">
					<h2 style="padding-bottom: 60px; width:15rem;"><a href="mypage" style="text-decoration-line: none; color:black;"><b>고객센터</b></a></h2>
					
					<ul class="my_menu">
						<li>
							<a href="notice" class="menu_depth01">공지사항</a>
						</li>
						<li>
							<a href="faq" class="menu_depth01">FAQ</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/member/myInquiryList" class="menu_depth01">1:1 문의</a>
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
						<h2 class="tit_lv2">공지사항</h2>
					</div>
					<table>
						<div class="done_wrap type4">
								<div class="notice">
									<div class="tab_cont_box">
										<div class="tab_cont" data-id="tab-01">
											<div class="tab_cont_inner faq_accordion">
												<div class="divi_line cs_notice_board">
													<div class="accordion accordion-flush" id="notice_List">
														<c:forEach var="board" items="${noticeList}">
															<div class="acc_header" name="notice">
																<button class="accordion-button collapsed" 
																			type="button" 
																			data-bs-toggle="collapse" 
																			data-bs-target="#flush-collapse${board.bno}" 
																			aria-expanded="false" 
																			aria-controls="flush-collapse${board.bno}">
																	<span class="prd_num">${board.bno}</span>
																	<ul class="badge_auto_list">
																		<li>${board.bsubcategory}</li>
																	</ul>
																	<div class="prd_subtit">${board.btitle}</div>              
																	<span class="prd_date"><fmt:formatDate value="${board.bcreatedat}" pattern="yyyy-MM-dd"/></span>
																</button>
															</div>
															
															<div id="flush-collapse${board.bno}" class="accordion-collapse collapse" data-bs-parent="#notice_List">
														      <div class="accordion-body">
																<div class="acc_cont cart_list order">
																	${board.bcontent}
																</div>
														      </div>
														    </div>
														</c:forEach>
														<!-- 더보기 버튼 -->
														<!-- <div class="more_wrap" style="">
															<div class="btn_sub_l white">
																<button type="button" onclick="morePage()">더 보기</button>
															</div>
														</div> -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					    
					    <tr>
				            <td colspan="4" class="text-center">
				               <div class="pager">
				                  <a class="btn btn-sm first-page" href="notice?pageNo=1">처음</a>
				                  <c:if test="${pager.groupNo>1}">
				                     <a class="btn btn-sm prev-group" href="notice?pageNo=${pager.startPageNo-1}">이전</a>
				                  </c:if>
				                  
				                  <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
				                     <c:if test="${pager.pageNo != i}">
				                        <a class="btn btn-sm current-group-pages" href="notice?pageNo=${i}">${i}</a>
				                     </c:if>
				                     <c:if test="${pager.pageNo == i}">
				                        <a class="btn btn-sm current-page" href="notice?pageNo=${i}">${i}</a>
				                     </c:if>
				                  </c:forEach>
				                  
				                  <c:if test="${pager.groupNo<pager.totalGroupNo}">
				                     <a class="btn btn-sm next-group" href="notice?pageNo=${pager.endPageNo+1}">다음</a>
				                  </c:if>
				                  <a class="btn btn-sm last-page" href="notice?pageNo=${pager.totalPageNo}">맨끝</a>
				               </div>
				            </td>
					     </tr>
					</table>
			</div>
		</div>
		</div>
	</body>
</html>