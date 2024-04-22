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
	href="${pageContext.request.contextPath}/resources/css/admin/item/create.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/sidebar.css">
</head>

<body>
	<div class="wrapper">
		<!-- sidebar -->
		<jsp:include page="/WEB-INF/views/admin/common/admin_sidebar.jsp" />

		<!-- contents -->
		<div class="main p-3">
			<div class="item-section mt-2 mb-2" style="font-size: 12px">상품
				관리 > 상품 등록</div>

			<div class="headingArea">
				<div class="title">
					<h1 id="itemTitle">상품 등록</h1>
				</div>
			</div>

			<div class="accordion accordion-flush border" id="accordionFlushExample">
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed bg-light" type="button"
							data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
							aria-expanded="true" aria-controls="flush-collapseOne">
							<div class="tit_area">
								<strong>상품 기본 정보</strong>
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
													<p class="form_label">상품 대표 이미지</p>
												</div>
												<div class="td">
													<div class="item_wrap">
														<!-- [D] 파일첨부 기능 .profile_attach -->
														<div class="item item_attach">
															<input type="hidden" id="prflPhotoUrl" name="mbrPrfl.prflPhotoUrl" value="">
								                            <input type="hidden" id="beforePrflPhotoUrl" name="beforePrflPhotoUrl" value="">
															
															<div class="img_box d-flex">
																<div id="defaultImg">item</div>
															</div>
															
															<div class="item_edit">
																<p class="tit">상품의 대표 이미지를 등록해주세요.<span class="sub">(파일형식 JPG, JPEG, PNG / 파일용량 3MB 이하)</span></p>
																
																<div class="button_set">
																	<button type="button" onclick="" class="btn_sub_m gray_line">사진 추가</button>
																	<!-- 파일첨부 기능 -->
							                                        <input class="input_file" type="file" id="inputFileImage1-2" name="file" onchange="checkFileSizeAjax(event,this);" title="첨부파일 추가">
							                                        <label for="inputFileImage1-2" class="btn_sub_m gray_line">사진 변경</label>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">상품 상세 이미지</p>
												</div>
												<div class="td">
													<div class="item_wrap">
														<!-- [D] 파일첨부 기능 .profile_attach -->
														<div class="itemDetail itemDetail_attach">
															<input type="hidden" id="prflPhotoUrl" name="mbrPrfl.prflPhotoUrl" value="">
								                            <input type="hidden" id="beforePrflPhotoUrl" name="beforePrflPhotoUrl" value="">
															
															<div class="img_box d-flex">
																<div id="defaultImg">detail</div>
															</div>
															
															<div class="itemDetail_edit">
																<p class="tit">상품의 대표 이미지를 등록해주세요.<span class="sub">(파일형식 JPG, JPEG, PNG / 파일용량 3MB 이하)</span></p>
																
																<div class="button_set">
																	<button type="button" onclick="" class="btn_sub_m gray_line">사진 추가</button>
																	<!-- 파일첨부 기능 -->
							                                        <input class="input_file" type="file" id="inputFileImage1-2" name="file" onchange="checkFileSizeAjax(event,this);" title="첨부파일 추가">
							                                        <label for="inputFileImage1-2" class="btn_sub_m gray_line">사진 변경</label>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">상품명 (필수)</p>
												</div>
												<div class="td">
													<div class="form_set">
														<div class="input_clear sm">
															<input type="text" id="masItemName"
																placeholder="예시) 락토핏 골드 2g">
														</div>
														<span class="ms-2 mt-3">[0 / 250]</span>
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">브랜드 (필수)</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masBrand" placeholder="예시) 종근당">
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">판매가 (필수)</p>
												</div>
												<div class="td">
													<div class="form_set">
														<div class="input_clear sm">
															<input type="text" id="masItemPrice" placeholder="">
														</div>
														<span class="ms-2 mt-3">원</span>
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
								<strong>상품 상세 정보</strong>
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
													<p class="form_label">구독 상품 여부</p>
												</div>
												<div class="td">
													<div class="form-check form-check-inline mt-3">
													  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
													  <label class="form-check-label" for="inlineRadio1">예</label>
													</div>
													<div class="form-check form-check-inline mt-3">
													  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
													  <label class="form-check-label" for="inlineRadio2">아니오</label>
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">섭취 대상</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masPerson" placeholder="예시) 성인용">
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">효능</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masBrand" placeholder="예시) 눈 건강 개선">
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">제품 형태</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masBrand" placeholder="예시) 알약, 캡슐">
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">섭취 횟수</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masBrand" placeholder="예시) 1일  1회">
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">섭취 횟수</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masBrand"
															placeholder="예시) 물과 함께 섭취">
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">대표 구성 성분</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masBrand"
															placeholder="예시) 루테인 20mg, 아스타잔틴 12mg">
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
								<strong>쇼핑몰 진열 설정</strong>
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
													<p class="form_label">판매 상태</p>
												</div>
												<div class="td">
													<div class="form-check form-check-inline mt-3">
													  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
													  <label class="form-check-label" for="inlineRadio1">판매함</label>
													</div>
													<div class="form-check form-check-inline mt-3">
													  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
													  <label class="form-check-label" for="inlineRadio2">판매안함</label>
													</div>
												</div>
											</div>
											<div class="tr">
												<div class="th">
													<p class="form_label">상품 분류</p>
												</div>
												<div class="td">
													<div class="input_clear sm">
														<input type="text" id="masBrand" placeholder="예시) 눈 건강 개선">
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