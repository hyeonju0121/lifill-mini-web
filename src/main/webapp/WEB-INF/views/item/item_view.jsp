<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>상품 상세 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/item-view.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shop.css">
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
			/* var acc = document.getElementsByClassName("accordion");
			var i;
	
			for (i = 0; i < acc.length; i++) {
			  acc[i].addEventListener("click", function() {
			    this.classList.toggle("active");
			    var panel = this.nextElementSibling;
			    if (panel.style.display === "block") {
			      panel.style.display = "none";
			    } else {
			      panel.style.display = "block";
			    }
			  });
			} */
			
			// nav에 있는 li가 클릭됐을 때 하단에 border를 적용하기 위한 함수 선언
			document.addEventListener("DOMContentLoaded", function() {
			    const items = document.querySelectorAll('#menu-nav li');
			    let previousItem = null;

			    items.forEach(item => {
			        item.addEventListener('click', function() {
			            // Remove border from previously clicked item
			            if (previousItem !== null) {
			                previousItem.style.borderBottom = 'none';
			            }

			            // Add border to clicked item
			            this.style.borderBottom = '5px solid #37cbe9';

			            // Set the current item as the previous item
			            previousItem = this;
			        });
			    });
			});


		</script>
		
	</head>
	
	<body>
	
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>
		
		<div class="container" style="padding:0 30px">
			<!-- 상품 사진과 설명, 가격 영역 -->
			<div class="border border-warning d-flex">
				<div class="border border-dark w-50 d-flex flex-column">
					<!-- 1. 상품 사진 영역 -->
					<div class="border border-dark mt-3 rep_img_box">
						<img 
						src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye3_image1.png"
						style="width:550px; height:550px"/>
					</div>
					
					<div class="border border-danger sub-rep-img" style="height:200px">
						<div class="d-flex">
							<div>
								<img 
								src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye3_image1.png" 
								style="width:100px; height:100px"/>
								<img 
								src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye3_image2.png" 
								style="width:100px; height:100px"/>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 2. 가격, 영양 성분 안내, 구매하기/장바구니 버튼 위치 영역 -->
				<div class="item-overview">
					<div class="item-info">
						<div class="company text-start">
							<h2 style="margin:5px;"><b>effekt</b></h2>
							
						</div>
						<hr/>
						<div class="item-name">
							<h4><b>초임계 루테인아스타잔틴 코어</b></h4>
						</div>
						
						<div class="item-price mt-3 mb-3">
							<h1>29800원</h1>
							
						</div>
						1일1회1캡슐
						루테인 20mg 아스타잔틴 12mg
						<button class="accordion">Section 1</button>
						<div class="panel">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="border border-primary">
				<div class="border border-info">
					<!-- best item -------------------------------------------------------------------------->
					<div class="container mt-5">
						<p class="h3">이런 상품은 어떠세요?</p>
						
						<!-- 슬라이드 배너 -->
						<div id="carouselExampleControls" class="carousel carousel-dark slide item-carousel"
							data-bs-ride="carousel">
							<div class="carousel-inner embed-responsive embed-responsive-4by3">
								<!-- 첫 번째 슬라이드 -->
								<div class="carousel-item active w-100">
									<div class="card-wrapper container-sm d-flex justify-content-around m-5">
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
								<div class="carousel-item">
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
								</div>
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
			<div class="detail_sec_box border border-info d-flex">
				<div class="d-flex flex-column tab" style="width: 850px;">

					<!-- 1. 선택 바 영역 -->
					<div class="list-bar tabnav d-flex">
						<nav id="menu-nav">
							<ul>
								<li id="nav-item1">
									<a href="#item_detail_img_sec">
									상품상세정보
									</a>
								</li>
								<li id="nav-item2">
									<a href="#review-sec">
									고객리뷰
									</a>
								</li>
								<li id="nav-item3">
									<a href="#question-sec">
									문의
									</a>
								</li>
								<li id="nav-item4">
									<a href="#delivery-sec">
									배송/반품/교환 안내
									</a>
								</li>
							</ul>
						</nav>
					</div>
					
					<!-- 2. 상품 상세 이미지 영역 -->
					<!-- 상세이미지로 바꾸기 -->
					<div id="item_detail_img_sec" class="border border-dark" style="width:850px;">
						<img 
						src="${pageContext.request.contextPath}/resources/image/item_detail/eye/eye3_detail.png"
						style="width:850px"/>
					</div>
					
					<!-- 고객 리뷰 영역 -->
					<div id="review-sec d-flex">
						<h2 class="mt-3 mb-3"><b>리뷰</b></h2>
						<div class="d-flex container">
							<div class="riview-card card card-block">
							   <div class="card-header">유OO님</div>
							    <div class="card-body">
							    	몇 년째 재구매중
							    </div>
							</div>
							
							<div class="riview-card card card-block">
							   <div class="card-header">변OO님</div>
							    <div class="card-body">
							    	짱 좋습니다
							    </div>
							</div>

							<div class="riview-card card card-block" style="width:200px; margin-right:10px">
							   <div class="card-header">곽OO님</div>
							    <div class="card-body">
							    	선물용으로 좋은듯
							    </div>
							</div>
							
							<div class="riview-card card card-block" style="width:200px; margin-right:10px">
							   <div class="card-header">김OO님</div>
							    <div class="card-body">
							    	저는 별로였어요
							    </div>
							</div>
						</div>
						
					</div>
					
					<div id="question-sec">
						<h2 class="mt-3 mb-3"><b>문의</b></h2>
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
							</div>
							
						</div>

					</div>
					
					<div id="delivery-sec" class="d-flex flex-column">
						<h2 class="mt-3 mb-3"><b>배송/반품/취소 안내</b></h2>
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
				
				<!-- 2. 구매하기 박스 영역 -->
				<div class="buy_box border border-success">
					<div class="buy-box-area">
						<div class="buy-info-area">
							<span class="item-name">초임계 루테인아스타잔틴 코어</span>
							<div class="count-button">						
								<button type="button" class="minus-button btn btn-info btn-outline-secondary" onclick="minus()"> - </button>
								수량
								<button type="button" class="plus-button btn btn-info btn-outline-secondary" onclick="plus()"> + </button>
								<h6>29800원</h6>
							</div>
							<hr/>
						</div>
						
							<hr/>
						<div class="total-price">
							<div class="price-sum">
								<h3 id="price-sum">합계 : 29800원</h3>
							</div>
						</div>
						<div class="button-area d-flex">
							<span>
								<button id="cart-button" type="button">장바구니</button>
							</span>
							<span>
								<button id="buy-button" type="button">구매하기</button>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</body>
</html>