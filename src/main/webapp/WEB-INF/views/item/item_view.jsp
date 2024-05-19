<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>상품 상세 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>
		
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/item-view.css">
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
			
			// nav에 있는 li가 클릭됐을 때 하단에 border를 적용하기 위한 함수
			document.addEventListener("DOMContentLoaded", function() {
				// id가 scroll_to인 요소 안에 작성된 a 태그들을 객체로 얻음
			    const items = document.querySelectorAll('#scroll_to a');
				// a 태그에 대해 반복문을 돌면서 클릭 이벤트 발생 시 함수 실행
			    items.forEach(item => {
			        item.addEventListener('click', function() {
			            // 모든 항목의 활성 클래스를 제거
			            items.forEach(item => {
			                item.classList.remove('active');
			            });
			
			            // 클릭된 항목에 활성 클래스 추가
			            this.classList.add('active');
			        });
			    });
			});
			
			// li 클릭시 이동하는 함수
			document.addEventListener("DOMContentLoaded", function() {
			   const items = document.querySelectorAll('#scroll_to a');

			   items.forEach(item => {
			       item.addEventListener('click', function(event) {
			           event.preventDefault();
			            
			           // 이동할 섹션의 id를 얻기
			           const targetId = this.getAttribute('href');
			           const targetSection = document.querySelector(targetId);

			           // 이동할 섹션으로 바로 이동
			           scrollToSection(targetSection);
			       });
				});

				// 클릭된 섹션으로 스크롤을 이동하는 함수
				function scrollToSection(section) {
					const offsetTop = section.offsetTop;
					window.scrollTo({
						top: offsetTop,
						behavior: "instant" // 값을 smooth로 주면 부드럽게 스크롤
					});
				}
			});
			
			// 수량 버튼 함수
			function count(n)  {
	        	// 결과를 표시할 element
	            const element = $('#qtySpinner');
	            const element2 = $('#qtySpinner2');
	              
	            // 현재 화면에 표시된 값
	            var number = element.val();
	            
	            // 더하기/빼기
	            if(n === 1) {
	              number = parseInt(number) + 1;
	            } else {
	              	if (number == 1) {
	           	    number = 1;
	            	} else {
		                number = parseInt(number) - 1;	            		  
	            	  }
	              }
	              
	            // 결과 출력
	            element.val(number);
	            element2.val(number);
	         }
			
			function setQtyAndPrc(type) {
				
				// 수량을 변경하는 함수를 호출
				if ( type === 'p' ) {
					count(1);
				} else if ( type === 'm' ) {
					count(-1);
				}
				
				// 바뀐 수량을 변수에 담고 숫자 타입으로 변환
				var qty = $("#qtySpinner").val();
				qty = parseInt(qty);
				
				// 상품 가격을 변수에 담고 숫자 타입으로 변환
				var prc =  $("#realPrice").val();
		        prc =  parseInt(prc);
		        
				var total = qty * prc;
				
				$("#hiddenTotal").val(total);
				
				var hiddenTotalInput = $("#hiddenTotal");
		        var outputP = $("#tprice");
		        var outputP2 = $("#price-tag");
		        var outputP3 = $("#price-sum");
		       
	            outputP.text(hiddenTotalInput.val() + "원");
	            outputP2.text(hiddenTotalInput.val() + "원");
	            outputP3.text("합계 : " + hiddenTotalInput.val() + "원");
			}
			
			function order() {
				var amount = parseInt($("#qtySpinner").val());
				var totalPrice = parseInt($("#hiddenTotal").val());
				
				var prdcode = "${product.prdcode}";
				
				var urlString = 'buyNow?prdcode=' + prdcode + '&ordamount=' + amount + '&ordprice=' + totalPrice;
				console.log(amount, totalPrice);

			    window.location.href = urlString;
			}
			
			function addCart() {
				var amount = parseInt($("#qtySpinner").val());
				var totalPrice = parseInt($("#hiddenTotal").val());
				
				var prdcode = "${product.prdcode}";
				
				var urlString = '${pageContext.request.contextPath}/member/addCart?prdcode=' + prdcode + '&ordamount=' + amount + '&ordprice=' + totalPrice;
				console.log(amount, totalPrice);

			    window.location.href = urlString;
			}

		</script>
		
	</head>
	
	<body>
	
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>
		
		<div class="container" style="padding:0 30px; margin-bottom: 30px; ">
			<div class="item-section mt-2 mb-2" style="font-size: 12px">
				<a href="#">라이필</a> > <a href="#">${product.igdval}</a> > <a href="#">${product.fnval}</a>
			</div>
			<!-- 상품 사진과 설명, 가격 영역 -->
			<div class="product-section">
				<div class="img_box">
					<!-- 1. 상품 사진 영역 -->
					<div class="rep_img_box">
						<img
						class="rep_img"
						src="attachDownload?prdcode=${product.prdcode}"/>
					</div>
					
					<div class="sub-rep-img mt-5">
						<div class="d-flex">
							<div>
								<img 
								src="${product.prdimgrep2}" 
								style="width:100px; height:100px"/>
								<img 
								src="${product.prdimgrep3}" 
								style="width:100px; height:100px"/>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 2. 가격, 영양 성분 안내, 구매하기/장바구니 버튼 위치 영역 -->
				<div class="item-overview">
					<div class="item-info">
						<div class="company text-start">
							<h2 style="margin:5px;"><b>${product.prdbrand}</b></h2>
							
						</div>
						<hr/>
						<div class="item-name">
							<h4><b>${product.prdname}</b></h4>
						</div>
						
						<div class="item-price mt-3 mb-3">
							<h1><fmt:formatNumber value="${product.prdprice}" pattern="#,###"/>원</h1>
						</div>
						
						
						<div>
							<div class="accordion-item mt-3 item-info">
								<div class="accordion-header">
									<div class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
									aria-expanded="false" aria-controls="flush-collapseThree">
										<div class="tit_area">
											<strong>영양 정보</strong>
										</div>
									</div>
								</div>
								<div id="flush-collapseThree" class="accordion-collapse collapse"
									data-bs-parent="#accordionFlushExample">
									<div class="accordion-body">
										<div class="contents">
												<div class="section_block1">
													<div class="form_table">
														<div class="tr d-flex container">
															<div class="th1">
																<span class="form_label">섭취 대상</span><br/>
																<span class="form_label">효능</span><br/>
																<span class="form_label">제품 형태</span><br/>
																<span class="form_label">섭취 횟수</span><br/>
																<span class="form_label">섭취 유형</span><br/>
																<span class="form_label">대표 구성 성분</span>
															</div>
															<div class="th2">
																<span class="form_label">성인 남녀</span><br/>
																<span class="form_label">눈 건강 개선</span><br/>
																<span class="form_label">알약, 캡슐</span><br/>
																<span class="form_label">1일 1회</span><br/>
																<span class="form_label">물과 함께</span><br/>
																<span class="form_label">마리골드 꽃 추출물, 헤마토코쿠스 추출물 <br/> 
																						  루테인 20mg, 아스타잔틴 12mg
																</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
							</div>
							<div class="accordion-item mt-3 item-info">
								<div class="accordion-header">
									<div class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#flush-collapseFour"
									aria-expanded="false" aria-controls="flush-collapseThree">
										<div class="tit_area">
											<strong>배송 정보</strong>
										</div>
									</div>
								</div>
								<div id="flush-collapseFour" class="accordion-collapse collapse"
									data-bs-parent="#accordionFlushExample">
									<div class="accordion-body">
										<div class="contents">
												<div class="section_block1">
													<div class="form_table">
														<div class="tr d-flex container">
															<div class="th1 delivery-name">
																<span class="form_label">배송비</span><br/>
																<span class="form_label">정기배송</span>
															</div>
															<div class="th2 delivery-value">
																<span class="form_label">무료</span><br/>
																<span class="form_label">신청 가능</span><br/>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
							</div>
						</div>
						
						<hr/>
						
						<div id="optionCntDiv" class="count_wrap">
							<div class="count_item" id="cntId">
								<input type="hidden" id="cntItmNo" value="">
								<div class="count_box">
									<div class="count_tit">
										<span class="option">${product.prdname}</span>
										<!-- <button type="reset" class="btn_del" onclick="resetSelectOption2(4);">
											<span class="blind">지우기</span>
										</button> -->
									</div>
									<div class="count_set">
										<button type="button" name="button" class="info-minus" onclick="setQtyAndPrc('m')">
											<span>-</span>
										</button>
										<input id="qtySpinner" name="quantity" type="text" title="수량 선택" class="count" data-page="productDetail" data-min="1" data-txt="inv" min="1" value="1" readonly>
										<button type="button" name="button" class="info-plus" onclick="setQtyAndPrc('p')">
											<span>+</span>
										</button>
										<input type="hidden" id="realPrice" value="${product.prdprice}">
									</div>
								</div>
							</div>
						</div>
						<div class="total_item prdInfoOptionArea">
							<div class="total_box">
								<p class="tit">총 상품 금액</p>
								<p class="total" id="tprice">${product.prdprice}</p>
								<input type="hidden" id="hiddenTotal" value="${product.prdprice}">
							</div>
						</div>
						<div class="button-area1">
							<button id="cart-button1" type="button" class="btn" onclick="addCart()">장바구니</button>
							<button id="buy-button1" type="button" class="btn" onclick="order()">구매하기</button>
						</div>
					</div>
				</div>
			</div>
			
			<div>
				<div>
					<!-- best item -------------------------------------------------------------------------->
					<div class="container mt-5" style="height: 500px;">
						<p class="h3">이런 상품은 어떠세요?</p>
						
						<!-- 슬라이드 배너 -->
						<div id="carouselExampleControls" class="carousel carousel-dark slide item-carousel"
							data-bs-ride="carousel">
							<div class="carousel-inner embed-responsive embed-responsive-4by3">
								<!-- 첫 번째 슬라이드 -->
								<div class="carousel-item active w-100">
									<div class="card-wrapper container-sm d-flex justify-content-around m-3">
										<div class="card best-item-card">
											<img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye1.png"
											class="card-img-top embed-responsive-item best-item-img">
											<div class="card-body">
												<h5 class="card-title">피부면역 유산균 100억 60g(2g*30포)</h5>
											</div>
										</div>
										<div class="card best-item-card">
											<img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye2.png" 
											class="card-img-top embed-responsive-item best-item-img">
											<div class="card-body">
												<h5 class="card-title">멀티바이오틱스 100억 생유산균 (400mg*30캡슐*2병)</h5>
											</div>
										</div>
										<div class="card best-item-card">
											<img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye4.png" 
											class="card-img-top embed-responsive-item best-item-img">
											<div class="card-body">
												<h5 class="card-title">락토핏 골드 2g*50포</h5>
											</div>
										</div>
										<div class="card best-item-card">
											<img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye5_image1.png" 
											class="card-img-top embed-responsive-item best-item-img">
											<div class="card-body">
												<h5 class="card-title">프로바이오틱스(2g*60포)</h5>
											</div>
										</div>
									</div>
								</div>
								<!-- 두 번째 슬라이드 -->
								<%-- <div class="carousel-item">
									<div class="card-wrapper container-sm d-flex justify-content-around m-5">
										<div class="card best-item-card">
											<img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye6.png" 
											class="card-img-top embed-responsive-item best-item-img">
											<div class="card-body">
												<h5 class="card-title">쾌변엔차전자피화이버(6g*30포)</h5>
											</div>
										</div>
										<div class="card best-item-card">
											<img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye7.png" 
											class="card-img-top embed-responsive-item best-item-img">
											<div class="card-body">
												<h5 class="card-title">패밀리 온가족 유산균 1box (30포/1개월분)</h5>
											</div>
										</div>
										<div class="card best-item-card">
											<img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye8.png" 
											class="card-img-top embed-responsive-item best-item-img">
											<div class="card-body">
												<h5 class="card-title">아이클리어 루테인지아잔틴 오메가3 600mg*60캡슐</h5>
											</div>
										</div>
										<div class="card best-item-card">
											<img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye9.png" 
											class="card-img-top embed-responsive-item best-item-img">
											<div class="card-body">
												<h5 class="card-title">마인트리 루테인지아잔틴 6박스</h5>
											</div>
										</div>
									</div>
								</div> --%>
							</div>
								
							<!-- carousel button -->
							<button class="carousel-control-prev shop-carousel-control" type="button" 
								data-bs-target="#carouselExampleControls" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next shop-carousel-control" type="button" 
								data-bs-target="#carouselExampleControls" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>

				</div>
			</div>
			
			<!-- 상품 상세 이미지, 구매하기 박스 영역 -->
			<div class="detail_sec_box d-flex">
				<div class="d-flex flex-column tab" style="width: 70%;">

					<!-- 1. 선택 바 영역 -->
					<div class="sticky">
						<div class="scroll_to" id="scroll_to">
							<a href="#item_detail_img_sec" class="tab_btn">상품 설명</a>
							<a href="#review-sec" class="tab_btn">리뷰</a>
							<a href="#question-sec" class="tab_btn">문의</a>
							<a href="#delivery-sec" class="tab_btn">배송/반품/교환 안내</a>
						</div>
					</div>
					
					<!-- 2. 상품 설명 영역 -->
					<div id="item_detail_img_sec" style="margin-bottom: 3px;">
						<h2><b>상품 설명</b></h2>
					</div>
					<div style="width:100%;">
						<img 
						src="${pageContext.request.contextPath}/resources/image/item_detail/eye/eye3_detail.png"
						style="width:100%"/>
					</div>
					
					<!-- 고객 리뷰 영역 -->
					<!-- <div id="review-sec">
						<h2 class="mt-3 mb-3"><b>리뷰</b></h2>
						<div class="d-flex">
							<div class="riview-card card card-block">
							   <div class="card-header">유OO님</div>
							    <div class="card-body">
							    	몇 년째 재구매중
							    </div>
							</div>
						</div>
						
					</div> -->
					
					<!-- 고객 리뷰 영역 -->
					
					<!-- 리뷰 영역 -->
					<div class="widget_header_basic" id="review-sec">
						  <div class="widget_header_basic__title_container">
						      <span class="widget_header_basic__title js-translate-text" style="font-family: 'Noto Sans KR', sans-serif;">
						        	리뷰
						      </span>
						      <span class="widget_header_basic__reviews_count js-widget-header-basic-reviews-count" style="font-family: 'Noto Sans KR', sans-serif;">
						        (${reviewCount})
						      </span>
						  </div>
					</div>
					
					<!-- 리뷰 목차 -->
				<c:forEach var="review" items="${review}">
				<li
					class="review_list_v2 review_list_v2--collapsed
					    renewed_review
					    js-review-container">
					<div class="review_list_v2__review_rcontent">

						<div class="review_list_v2__user_name_message">
							<b>${review.mid}</b>
						</div>
					</div>
					<div class="review_list_v2__review_lcontent">
						<div class="review_list_v2__review_container">

							<div class="review_list_v2__score_section">

								<div class="review_list_v2__score_container">
									<div class="review_list_v2__score_star">
											<div class="crema_product_reviews_score_star_wrapper">
												<c:if test="${review.revscore == 1}">★</c:if>
												<c:if test="${review.revscore == 2}">★★</c:if>
												<c:if test="${review.revscore == 3}">★★★</c:if>
												<c:if test="${review.revscore == 4}">★★★★</c:if>
												<c:if test="${review.revscore == 5}">★★★★★</c:if>
											</div>
									</div>
								</div>


								<div class="review_list_v2__edit_container" style="margin-bottom: 3px;">
									<div class="review_list_v2__date">
									<fmt:formatDate value="${review.revcreatedat}" pattern="yyyy-MM-dd" /></div>
								</div>
							</div>

							<div class="review_list_v2__content_section">
								<div
									class="review_list_v2__content_container review_content  js-review-content-container"
									>
									<div class="review_list_v2__content review_content__collapsed"
										>
										<div class="review_list_v2__message_container">
											<div
												class="review_list_v2__expand_link js-renewal-review-message-link js-renewal-link-expand js-see-more-force-show">
												<div
													class="review_list_v2__message js-collapsed-review-content js-translate-text"
													style="max-height: px">
														${review.revcontent}
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<ul class="review_image">
								<li><%-- <img class="rev_img"
									src="${pageContext.request.contextPath}/resources/image/item_rep/intestine/intestine2.png" /> --%>
									<c:if test="${review.revattach != null }">
									<img class="rev_img"
									src="${review.revattach}" />
									</c:if>

								</li>
							</ul>
						</div>
					</div> 
				</li>
			</c:forEach>
				<!-- -------------------------- -->
					
					
					
					<div id="question-sec">
						<div class="accordion-item mt-3">
								<div class="accordion-header">
									<div class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#flush-collapseFive"
									aria-expanded="false" aria-controls="flush-collapseFive">
										<div class="tit_area">
											<strong>문의</strong>
										</div>
									</div>
								</div>
								<div id="flush-collapseFive" class="accordion-collapse collapse"
									data-bs-parent="#accordionFlushExample">
									<div class="accordion-body">
										<div class="contents">
												<div>
													<div>
														<p style="margin-left: 5px;"><b>결제, 정기구독 등 라이필 스토어에 대해 궁금하신 내용은 전화 또는 카카오톡으로 문의하실 수 있습니다.</b></p>							
													</div>
													<div>
														<p style="margin-left: 5px;"><b>라이필 스토어 문의</b></p>
														<ul>
															<li>고객 문의 : 010-2232-3823</li>
															<li>이메일 문의 : tjdwns3823@naver.com</li>
														</ul>
														<p>상품 관련 문의</p>
														<ul>
															<li>홈페이지 1대1 문의를 이용해주세요.</li>
														</ul>
														
														<button onclick="location.href='${pageContext.request.contextPath}/member/qnaInquiry?prdcode=${product.prdcode}'" 
															class="btn btn-sm btn-dark">문의하기</button>
													</div>
												</div>
											</div>
										</div>
									</div>
							</div>
							<div id="delivery-sec">
								<div class="accordion-item mt-3">
									<div class="accordion-header">
										<div class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#flush-collapseSix"
										aria-expanded="false" aria-controls="flush-collapseSix">
											<div class="tit_area">
												<strong>배송/반품/취소 안내</strong>
											</div>
										</div>
									</div>
									<div id="flush-collapseSix" class="accordion-collapse collapse"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											<div class="contents">
													<div class="delivery-notice">
														<p style="margin-left: 5px;"><b>배송 안내</b></p>
														<p style="margin-left: 5px;">배송은 평일 결제 시 오후 12시에 출고가 마감됩니다. 오후 12시 이후 결제 건은 익일 출고가 진행됩니다. <br/>
														(주말 결제 시 다음 영업일 출고)</p>
														<ul>
															<li>배송이 시작된 후에는 배송지 변경 및 취소가 불가능합니다.</li>
															<li>배송기간은 출고일로부터 평균 3~5일 정도 소요됩니다.</li>
															<li>도서·산간 지역 배송 시 추가 배송비가 없으나, <br/>
															배송 기일이 추가적으로 소요될 수 있는 점 양해하여 주시기 바랍니다.</li>
															<li>배송 과정 중 기상 악화 혹은 도로교통 상황에 따라 부득이하게 지연 배송이 발생될 수 있습니다.</li>
														</ul>
													</div>
													<div class="item-exchange-notice">
														<p style="margin-left: 5px;"><b>반품 및 교환 안내</b></p>
														<p style="margin-left: 5px;">교환 및 반품은 상품을 수령한 날부터 7일 이내에 고객센터로 문의해 주시기 바랍니다.</p>
														<ul>
															<li>제품 이상, 오배송 등과 같은 회사에 귀책사유가 있는 경우 맞교환이 진행됩니다.<br/>
															(배송비 회사 부담/부분 반품 가능)</li>
															<li>제품 교환은 단순 고객 변심의 경우에는 교환을 원하는 제품은 <br/>
															반품(배송비 5,000원 고객부담)으로 진행되고, 수령을 원하는 제품은 추가 결제로 배송됩니다.</li>
															<li>반품 후 환불금액은 상품 회수 및 검수 후 결정됩니다. <br/>
															(검수 시 상품의 훼손 및 누락이 있을 경우 변동될 수 있습니다.)</li>
															<li>반품완료 및 교환회수 완료는 택배기사가 고객님께 반품/교환 상품을 <br/>
															인계받은(수거) 날로부터 약 3~5일 소요됩니다. (영업일 기준)</li>
														</ul>
													</div>
													<div class="order-cancle-notice">
														<p style="margin-left: 5px;"><b>주문취소 안내</b></p>
														<p style="margin-left: 5px;">주문취소는 [발송대기] 상태일 경우에만 취소가 가능합니다. 홈페이지에서 직접 취소하실 수 있습니다.</p>
														<ul>
															<li>마이페이지 > 결제관리 > 해당 결제건 선택</li>
															<li>[배송중]부터는 취소가 불가능하니, 고객센터에 문의하여 반품으로 진행해 주시기 바랍니다.</li>
															<li>주문 상품의 부분 취소가 필요하신 경우 전체 주문취소 후 다시 구매해 주시기 바랍니다.</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
								</div>
							</div>
							
					</div>
					<%-- <div id="detail" class="hidden">
						<img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye3_image1.png" alt="상품상세이미지">
					</div>
					<div class="detailMore">
						<a id="btn btnMore" href="javascript:moreDetail();">상품정보 더 보기</a>
					</div>
					
					<script>
					function moreDetail(){
					    $('#detail').removeClass('hidden');
					    $('.detailMore').remove();
					}
					</script> --%>
				</div>
				
				<!-- 2. 구매하기 박스 영역 -->
				<div class="buy_box">
					<div class="buy-box-area">
						<div class="buy-info-area">
							<span class="item-name">${product.prdname}</span>
							<div class="count-button">						
								<button type="button" class="info-minus btn" onclick="setQtyAndPrc('m')">-</button>
								<input id="qtySpinner2" data-min="1" data-txt="inv" min="1" value="1" readonly/>
								<button type="button" class="info-plus btn" onclick="setQtyAndPrc('p')">+</button>
								<h6 id="price-tag" style="margin-top: 4px; margin-bottom: 4px;">${product.prdprice}원</h6>
							</div>
							<hr/>
						</div>
						
							<hr/>
						<div class="total-price">
							<div class="price-sum">
								<h3 id="price-sum">합계 : ${product.prdprice}원</h3>
							</div>
						</div>
						<div class="button-area2 d-flex">
							<span>
								<button id="cart-button2" type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/member/cart'">장바구니</button>
							</span>
							<span>
								<button id="buy-button2" type="button" class="btn" onclick="order()">구매하기</button>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</body>
</html>