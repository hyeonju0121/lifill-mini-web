<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>자주 묻는 질문(FAQ) - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/faq.css">
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
			
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
							<a href="tel:1661-8858" class="cs_number">1661-8858</a>
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
							<a onclick="goOneOnOneInquiry()" class="ico_cs03">
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
						<h2 class="tit_lv2">자주묻는질문</h2>
					</div>
					
					<div class="done_wrap type4">
						<div class="notice">
							<div class="tab_cont_box">
								<div class="tab_cont" data-id="tab-01">
									<div class="tab_cont_inner faq_accordion">
										<div class="divi_line cs_notice_board">
											<div class="accordion accordion-flush" id="notice_List">
												<div class="acc_header active" name="notice">
													<button class="accordion-button collapsed" 
															type="button" 
															data-bs-toggle="collapse" 
															data-bs-target="#flush-collapse2" 
															aria-expanded="false" 
															aria-controls="flush-collapse2">
														<!-- <span class="prd_num">2</span> -->
														<ul class="badge_auto_list">
															<li>배송</li>
														</ul>
														<div class="prd_subtit">배송 조회는 어떻게 하나요?</div>
														<!-- <span class="prd_date">2024.04.21</span> -->              
													</button>
												</div>
												
												<div id="flush-collapse2" class="accordion-collapse collapse" data-bs-parent="#notice_List">
											      <div class="accordion-body">
													<div class="acc_cont cart_list order">
														<p><span><b>정기구독으로 구매하신 경우</b><br></span></p>
														<p><span>홈페이지 -> MY라이필 -> 결제관리 -> 해당 결제건 클릭 -> 운송장 번호 클릭</span></p>
														<p><span><b>비회원으로 한 번만 구매하기를 하신 경우</b></span></p>
														<p><span>홈페이지 -> 고객센터 -> 비회원 주문 -> 주문번호 또는 연락처 입력, 주문 확인 비밀번호 입력 -> 운송장 번호 클릭</span></p>
													</div>
											      </div>
											    </div>
												
												<div class="acc_header" name="notice">
													<button class="accordion-button collapsed" 
																type="button" 
																data-bs-toggle="collapse" 
																data-bs-target="#flush-collapse1" 
																aria-expanded="false" 
																aria-controls="flush-collapse1">
														<!-- <span class="prd_num">1</span> -->
														<ul class="badge_auto_list">
															<li>회원정보</li>
														</ul>
														<div class="prd_subtit">회원정보 변경은 어떻게 하나요?</div>              
														<!-- <span class="prd_date">2024.04.19</span> -->
													</button>
												</div>
												
												<div id="flush-collapse1" class="accordion-collapse collapse" data-bs-parent="#notice_List">
											      <div class="accordion-body">
													<div class="acc_cont cart_list order">
														<p><span>가입하신 회원정보 변경을 원하시는 경우<br></span></p>
														<p><span>홈페이지 -> MY라이필 -> 회원관리에서 수정하실 수 있어요.</span></p>
													</div>
											      </div>
											    </div>
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
				
			</div>
		</div>
		

	</body>
</html>