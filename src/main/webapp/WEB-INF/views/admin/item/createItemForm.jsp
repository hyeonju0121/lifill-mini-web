<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 메인페이지 - 라이필</title>

		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>
		
		<!-- lineicons 외부 라이브러리 설정 -->
		<link href="https://cdn.lineicons.com/4.0/lineicons.css"
			rel="stylesheet" />
		
		<!-- external css -->
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/admin/item/createItemForm.css">
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/admin/sidebar.css">
			
			
		<script type="text/javascript">
		$(function(){
		    
		    // 기능별 선택
		    chnFnvalType('fneye' , 'lutein');
		});

		function chnFnvalType(type , select) {
		    
		    $('#igdval').empty();
		    
		    if(type == 'fneye') { // 눈 건강
		        $('#igdval').append("<option value='lutein' >루테인</option>'");
		    } else if (type == 'fnintestine') {  // 장 건강
		        $('#igdval').append("<option value='probiotics' >프로바이오틱스</option>'");
		    } else if ( type == 'fnliver') {  // 간 건강
		        $('#igdval').append("<option value='milkthistle' >밀크씨슬</option>'");
		    } else if ( type == 'fnjoint') {  // 뼈/관절 건강
		        $('#igdval').append("<option value='magnesium' >마그네슘</option>'");
		        $('#igdval').append("<option value='glucosamine' >글루코사민</option>'");
		        $('#igdval').append("<option value='calcium' >칼슘</option>'");
		    } else if ( type == 'fnimmunity') {  // 면역력
		        $('#igdval').append("<option value='propolis' >프로폴리스</option>'");
		        $('#igdval').append("<option value='Zinc' >아연</option>'");
		    } else if ( type == 'fnfatigue') {  // 만성피로
		        $('#igdval').append("<option value='vitamin' >비타민</option>'");
		        $('#igdval').append("<option value='theanine' >테아닌</option>'");
		    } else if ( type == 'fnblood') {  // 혈액순환
		        $('#igdval').append("<option value='omega' >오메가3</option>'");
		    } 
		    
		    document.getElementById("igdval").style.display = "";
		    
		    if ($.trim(select) != "") {
		        $('#fnval').val(type);
		        $('#igdval').val(select);
		    }
		} 
		
		</script>
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
			<div>
			<form id="createItemForm" name="createItemForm" action="createItem" method="post" enctype="multipart/form-data">
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
										<div class="section_block1">
											<div class="form_table">
												<div class="tr">
													<div class="th">
														<p class="form_label">기능별</p>
													</div>
													<!-- 눈건강, 장건강, 간건강, 뼈,관절건강, 만성피로, 혈행개선 -->
													<div class="td">	
														<select id="fnval" name="fnval" onChange="chnFnvalType(this.value)" >
														    <option value="fneye">눈건강</option>
														    <option value="fnintestine">장건강</option>
														    <option value="fnliver">간건강</option>
														    <option value="fnjoint">뼈/관절 건강</option>
														    <option value="fnimmunity">면역력</option>
														    <option value="fnfatigue">만성피로</option>
														    <option value="fnblood">혈액순환</option>
														</select>
														
													</div>
												</div>
												<div class="tr">
													<div class="th">
														<p class="form_label">성분별</p>
													</div>
													<div class="td">	
														<select id="igdval" name="igdval" style="width:120px; display:none;" >
														</select>
													</div>
												</div>
												<div class="tr">
													<div class="th">
														<p class="form_label">상품 대표 이미지</p>
													</div>
													<div class="td">
														<div class="item_wrap">
															<div class="item item_attach">
																<div class="img_box d-flex">
																	<div id="defaultImg">item</div>
																</div>
																
																<div class="item_edit">
																	<p class="tit">상품의 대표 이미지를 등록해주세요.</p>
																	
																	<div class="attach_wrap">
																		<div class="attach_top">
																			<label class="attach_img" for="prdimgrep1attach">사진 첨부</label>
																			<p class="guide_txt">파일 1개당 10MB까지 첨부 가능합니다. (JPG, JPEG, PNG, GIF만 첨부 가능)</p>
																			<input class="input_file" id="prdimgrep1attach" name="prdimglist[]" type="file" multiple>
																		</div>
																		<div class="attached" data-file="prdimgrep1attach" id="inputUploadFile"></div>
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
															<div class="item item_attach">
																<div class="img_box d-flex">
																	<div id="defaultImg">detail</div>
																</div>
																
																<div class="item_edit">
																	<p class="tit">상품의  상세 이미지를 등록해주세요.</p>
																	
																	<div class="attach_wrap">
																		<div class="attach_top">
																			<label class="attach_img" for="prdimgdetailattach">사진 첨부</label>
																			<p class="guide_txt">파일 1개당 10MB까지 첨부 가능합니다. (JPG, JPEG, PNG, GIF만 첨부 가능)</p>
																			<input class="input_file" id="prdimgdetailattach"  name="prdimgdetailattach" type="file" multiple>
																		</div>
																		<div class="attached" data-file="prdimgdetailattach" id="inputUploadFile"></div>
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
																<input type="text" id="prdname" name="prdname" placeholder="예시) 락토핏 골드 2g">
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
															<input type="text" id="prdbrand" name="prdbrand" placeholder="예시) 종근당">
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
																<input type="text" id="prdprice" name="prdprice" placeholder="">
															</div>
															<span class="ms-2 mt-3">원</span>
														</div>
													</div>
												</div>
											</div>
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
										<div class="section_block1">
											<div class="form_table">
												<div class="tr">
													<div class="th">
														<p class="form_label">구독 상품 여부</p>
													</div>
													<div class="td">
														<div class="form-check form-check-inline mt-3">
														  <label class="form-check-label" for="prdsubscribable">
														  	<input class="form-check-input" type="radio" name="prdsubscribable" id="prdsubscribable" value="true">예
														  </label>
														</div>
														<div class="form-check form-check-inline mt-3">
														  <label class="form-check-label" for="prdsubscribable">
														  	<input class="form-check-input" type="radio" name="prdsubscribable" id="prdsubscribable" value="false">아니오
														  </label>
														</div>
													</div>
												</div>
												<div class="tr">
													<div class="th">
														<p class="form_label">섭취 대상</p>
													</div>
													<div class="td">
														<div class="input_clear sm">
															<input type="text" id="prdtarget" name="prdtarget" placeholder="예시) 성인용">
														</div>
													</div>
												</div>
												<div class="tr">
													<div class="th">
														<p class="form_label">효능</p>
													</div>
													<div class="td">
														<div class="input_clear sm">
															<input type="text" id="prdeffect" name="prdeffect" placeholder="예시) 눈 건강 개선">
														</div>
													</div>
												</div>
												<div class="tr">
													<div class="th">
														<p class="form_label">제품 형태</p>
													</div>
													<div class="td">
														<div class="input_clear sm">
															<input type="text" id="prdtype" name="prdtype" placeholder="예시) 알약, 캡슐">
														</div>
													</div>
												</div>
												<div class="tr">
													<div class="th">
														<p class="form_label">섭취 횟수</p>
													</div>
													<div class="td">
														<div class="input_clear sm">
															<input type="text" id="prdtimes" name="prdtimes" placeholder="예시) 1일  1회">
														</div>
													</div>
												</div>
												<div class="tr">
													<div class="th">
														<p class="form_label">섭취 방법</p>
													</div>
													<div class="td">
														<div class="input_clear sm">
															<input type="text" id="prdmethod" name="prdmethod" placeholder="예시) 물과 함께 섭취">
														</div>
													</div>
												</div>
												<div class="tr">
													<div class="th">
														<p class="form_label">대표 구성 성분</p>
													</div>
													<div class="td">
														<div class="input_clear sm">
															<input type="text" id="prdingredient" name="prdingredient" placeholder="예시) 루테인 20mg, 아스타잔틴 12mg">
														</div>
													</div>
												</div>
												<div class="tr">
													<div class="th">
														<p class="form_label">해시태그</p>
													</div>
													<div class="td">
														<div class="input_clear sm">
															<input type="text" id="tagval" name="tagval" placeholder="예시) 눈 노화 방지, 식물성 캡슐">
														</div>
													</div>
												</div>
											</div>
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
										<div class="section_block1">
											<div class="form_table">
												<div class="tr">
													<div class="th">
														<p class="form_label">판매 상태</p>
													</div>
													<div class="td">
														<div class="form-check form-check-inline mt-3">
														  <label class="form-check-label" for="prdsalesstatus">
														  	<input class="form-check-input" type="radio" name="prdsalesstatus" id="prdsalesstatus" value="true">판매함
														  </label>
														</div>
														<div class="form-check form-check-inline mt-3">
														  <label class="form-check-label" for="prdsalesstatus">
														  	<input class="form-check-input" type="radio" name="prdsalesstatus" id="prdsalesstatus" value="false">판매안함
														  </label>
														</div>
													</div>
												</div>
												<div class="tr">
													<div class="th">
														<p class="form_label">재고</p>
													</div>
													<div class="td">
														<div class="input_clear sm">
															<input type="text" id="prdstock" name="prdstock" placeholder="예시) 100">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						</div>
						<div class="btn_big_wrap btn_size_fix mt60">
							<button type="button" onclick="goMypage();" class="white btn_cancle">취소</button>
							<button type="submit" class="btn_submit">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<script
			src="${pageContext.request.contextPath}/resources/js/admin_sidebar.js"></script>
</body>
</html>