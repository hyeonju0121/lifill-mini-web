<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>공지사항 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/notice.css">
		
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
						<h2 class="tit_lv2">공지사항</h2>
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
														<span class="prd_num">2</span>
														<ul class="badge_auto_list">
															<li>NEWS</li>
														</ul>
														<div class="prd_subtit">[공지] 라이필 정기구독 서비스 안내</div>              
														<span class="prd_date">2024.04.20</span>
													</button>
												</div>
												
												<div id="flush-collapse2" class="accordion-collapse collapse" data-bs-parent="#notice_List">
											      <div class="accordion-body">
													<div class="acc_cont cart_list order">
														<p><span>안녕하세요. 라이필입니다.<br></span></p>
														<p><span>4월 24일부터 라이필의 영양제 정기구독 서비스를 이용하실 수 있습니다.</span></p>
														<p><span>정기 구독 여부는 상품의 해시태그로 확인 가능합니다.</span></p>
														<p><span>많은 관심 부탁드립니다.</span></p>
														<p><span>감사합니다.</span></p>
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
														<span class="prd_num">1</span>
														<ul class="badge_auto_list">
															<li>NEWS</li>
														</ul>
														<div class="prd_subtit">[공지] 라이필 서비스 시작 안내</div>              
														<span class="prd_date">2024.04.19</span>
													</button>
												</div>
												
												<div id="flush-collapse1" class="accordion-collapse collapse" data-bs-parent="#notice_List">
											      <div class="accordion-body">
													<div class="acc_cont cart_list order">
														<p><span>안녕하세요. 라이필입니다.<br></span></p>
														<p><span>4월 22일 라이필의 영양제 판매 서비스가 시작됩니다.</span></p>
														<p><span>많은 관심 부탁드립니다.</span></p>
														<p><span>감사합니다.</span></p>
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