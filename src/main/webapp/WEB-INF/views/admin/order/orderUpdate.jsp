<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 메인페이지 - 라이필</title>

<!-- Bootstrap 5를 위한 외부 라이브러리 설정-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery 외부 라이브러리 설정 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<!-- lineicons 외부 라이브러리 설정 -->
<link href="https://cdn.lineicons.com/4.0/lineicons.css"
	rel="stylesheet" />

<!-- external css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/order/orderUpdate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/sidebar.css">
</head>

<body>
	<div class="wrapper">
		<!-- sidebar -->
		<jsp:include page="/WEB-INF/views/admin/common/admin_sidebar.jsp" />

		<!-- contents -->
		<div class="main p-3">
			<div class="item-section mt-2 mb-2" style="font-size: 12px">
			주문 관리 > 전체 주문 조회 > 주문서 수정</div>

			<div class="headingArea">
				<div class="title">
					<h1 id="itemTitle">주문서 수정</h1>
				</div>
			</div>

			<div class="accordion accordion-flush border" id="accordionFlushExample">
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed bg-light" type="button"
							data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
							aria-expanded="true" aria-controls="flush-collapseOne">
							<div class="tit_area">
								<strong>기본 주문서</strong>
							</div>
						</button>
					</h2>
					<div id="flush-collapseOne" class="accordion-collapse collapse"
						data-bs-parent="#accordionFlushExample">
						<div class="accordion-body">
							<div class="contents">
								<form action="#" method="post" id="updateForm">
									<div class="section_block1">
										<div class="form_table">
											<div class="tr">
												<div class="th">
													<p class="form_label">운송장 (등기번호)</p>
												</div>
												<div class="td">
													<div class="form_set">
														<div class="input_clear sm">
															<input type="text" id="masItemName" value="">
														</div>
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">주문번호</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masBrand" value="20240422-0000001">
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="section_block2">
										<div class="tit_area mt-2">
											<strong>상품 정보</strong>
										</div>
										<div class="form_table">
											<div class="tr">
												<div class="th">
													<p class="form_label">상품 이름</p>
												</div>
												<div class="td">
													<div class="form_set">
														<div class="input_clear sm">
															<input type="text" id="masItemName" value="초임계 루테인아스타잔틴 코어">
														</div>
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">수량</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masBrand" value="1">
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="section_block2">
										<div class="tit_area mt-2">
											<strong>배송지 정보</strong>
										</div>
										<div class="form_table">
											<div class="tr">
												<div class="th">
													<p class="form_label">받는 사람</p>
												</div>
												<div class="td">
													<div class="form_set">
														<div class="input_clear sm">
															<input type="text" id="masItemName" value="유현주">
														</div>
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">휴대폰 번호</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masBrand" value="010-8524-9773">
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">배송지 주소</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masBrand" value="서울특별시 송파구 중대로 135">
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">상세주소</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masBrand" value="아이티벤처타워 12층">
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="section_block2">
										<div class="tit_area mt-2">
											<strong>주문자 정보</strong>
										</div>
										<div class="form_table">
											<div class="tr">
												<div class="th">
													<p class="form_label">주문자 성함</p>
												</div>
												<div class="td">
													<div class="form_set">
														<div class="input_clear sm">
															<input type="text" id="masItemName" value="유현주">
														</div>
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">회원 아이디</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masBrand" value="hyeonju0121">
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">휴대폰 번호</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masBrand" value="010-8524-9773">
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">기타 요구사항</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masBrand" value="경비실에 맡겨주세요." style="width: 400px; height: 150px;">
													</div>
												</div>
											</div>
										</div>
									</div>
								</form>
								
								<div class="btn_big_wrap btn_size_fix mt60">
									<button type="button" onclick="goMypage();" class="white btn_cancle">취소</button>
									<button type="button" onclick="formSubmit();" class="btn_submit">완료</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion-item mt-3">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed bg-light" type="button"
							data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
							aria-expanded="false" aria-controls="flush-collapseTwo">
							<div class="tit_area">
								<strong>결제 정보</strong>
							</div>
						</button>
					</h2>
					<div id="flush-collapseTwo" class="accordion-collapse collapse"
						data-bs-parent="#accordionFlushExample">
						<div class="accordion-body">
							<div class="contents">
								<form action="#" method="post" id="updateForm">
									<div class="section_block1">
										<div class="form_table">
											<div class="tr">
												<div class="th">
													<p class="form_label">총 주문금액</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masPerson" value="28,900원">
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">결제방법</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masBrand" value="무통장 입금">
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">입금자명</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masBrand" value="유현주">
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">주문상태</p>
												</div>
												<div class="td">
													<!-- <div class="input_clear sm">
														<input type="text" id="masBrand" value="1일 1회">
													</div> -->
													<div class="dropdown">
													    <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown">
													      	결제완료
													    </button>
													    <ul class="dropdown-menu">
													      <li><a class="dropdown-item">결제전</a></li>
													      <li><a class="dropdown-item active">결제완료</a></li>
													    </ul>
													  </div>
												</div>
											</div>
										</div>
									</div>
								</form>
								<div class="btn_big_wrap btn_size_fix mt60">
									<button type="button" onclick="goMypage();" class="white btn_cancle">취소</button>
									<button type="button" onclick="formSubmit();" class="btn_submit">완료</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion-item mt-3">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed bg-light" type="button"
							data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
							aria-expanded="false" aria-controls="flush-collapseThree">
							<div class="tit_area">
								<strong>배송 정보</strong>
							</div>
						</button>
					</h2>
					<div id="flush-collapseThree" class="accordion-collapse collapse"
						data-bs-parent="#accordionFlushExample">
						<div class="accordion-body">
							<div class="contents">
								<form action="#" method="post" id="updateForm">
									<div class="section_block1">
										<div class="form_table">
											<div class="tr">
												<div class="th">
													<p class="form_label">총 주문금액</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masPerson" value="28,900원">
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">결제방법</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masBrand" value="무통장 입금">
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">입금자명</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masBrand" value="유현주">
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">주문상태</p>
												</div>
												<div class="td">
													<!-- <div class="input_clear sm">
														<input type="text" id="masBrand" value="1일 1회">
													</div> -->
													<div class="dropdown">
													    <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown">
													      	결제완료
													    </button>
													    <ul class="dropdown-menu">
													      <li><a class="dropdown-item">결제전</a></li>
													      <li><a class="dropdown-item active">결제완료</a></li>
													    </ul>
													  </div>
												</div>
											</div>
										</div>
									</div>
								</form>
								<div class="btn_big_wrap btn_size_fix mt60">
									<button type="button" onclick="goMypage();" class="white btn_cancle">취소</button>
									<button type="button" onclick="formSubmit();" class="btn_submit">완료</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
		<script
			src="${pageContext.request.contextPath}/resources/js/admin_sidebar.js"></script>
</body>
</html>