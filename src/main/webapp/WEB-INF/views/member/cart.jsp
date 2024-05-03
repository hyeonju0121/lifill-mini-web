<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" >
		<title>장바구니 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>
	
		<!--사용자 정의 스크립트 -->
		<script type="text/javascript">
			// [전체선택/전체해제]-------------------------------
			// true일 경우, 전체전택 / false일 경우, 전체해제
			function allselect(bool){
				// chk 로 지정된 모든 체크박스 갖고옴
				var chks = document.getElementsByName("chk");
				
				for(var i = 0; i < chks.length; i++){
					chks[i].checked = bool;
				}
			}
			
			// [수량 버튼] ------------------------------------
			function count1(type)  {
				// 수량 결과를 표시할 element
				const resultElement = document.getElementById('result1');

				// 현재 수량을 화면에 표시
				let number = resultElement.innerText;
				  
				if(type === 'plus') {
				  number = parseInt(number) + 1;
				} else if(type === 'minus')  {
					if(number == 1) {
						number = 1;
					} else {
						number = parseInt(number) - 1;
					}
				}
				resultElement.innerText = number;
			}
			
			function count2(type)  {
				// 수량 결과를 표시할 element
				const resultElement = document.getElementById('result2');

				// 현재 수량을 화면에 표시
				let number = resultElement.innerText;
				  
				if(type === 'plus') {
				  number = parseInt(number) + 1;
				} else if(type === 'minus')  {
					if(number == 1) {
						number = 1;
					} else {
						number = parseInt(number) - 1;
					}
				}
				resultElement.innerText = number;
			}

			
			// [금액에 쉼표 표시를 위한 함수] ----------------------------
			function numberWithCommas(n) {
			    return n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
			
			// 웹 페이지가 로드되면 자동으로 실행될 수 있도록  window.onload() 함수 사용
			window.onload = function() {
				// p-price 상품 가격 클래스를 요소로 가져오기
			    var priceElements = document.getElementsByClassName("p-price");
			    for (var i = 0; i < priceElements.length; i++) {
			    	// 해당 요소의 텍스트를 숫자로 변환하기
			        var price = parseInt(priceElements[i].innerText);
			    	// 쉼표로 추가하여 변환된 내용을 html에 추가 
			        priceElements[i].innerText = numberWithCommas(price); 
			    }
			};
		</script>

		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cart.css">

	</head>
	
	<body>
		<!-- 네비게이션 바  ------------------------------------------------------------------------>
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>
		
		<!-- cart page ------------------ -->
		<div class="container mt-5">
			<h2 style="text-align:center;"> 장바구니</h2>
			<div class="row">
				<div class="col-sm-8 mt-5">
					<div class="cart-table">
						<table class="table p-2">
							<thead>
								<tr>
									<th><input type="checkbox" name="allCheck" id="allCheck" onclick="allselect(this.checked);"/></th>
									<th class="product-h">Product</th>
									<th>Quantity</th>
									<th>Price</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<!-- item1 ------------------------------------------------- -->
									<!-- 체크박스 -->
									<td><input type="checkbox" name="chk" id="check1" onclick="checked();"/>
									</td>
									<!-- 상품 이미지 -->
									<td class="procuct-col">
										<div class="d-flex product-img">
											<img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye3_image1.png" class="rounded-3" style="width:130px;height:130px;"/>
											<div class="p-content mt-4 ms-2">
												<h6 class="p-name">[effekt]</h6>
												<h6><a href="${pageContext.request.contextPath}/item/item_view">초임계 루테인아스타잔틴 코어</a></h6>
											</div>
										</div>
									</td>
									<!-- 상품 수량 -->
									<td width="20%">
										<div class="d-flex justify-content-center count-button mt-4">
												<button type="button" class="minus-button btn me-3" onclick='count1("minus")'>-</button>
												<h6 class="mt-2" id='result1'>1</h6>
												<button type="button" class="plus-button btn ms-3" onclick='count1("plus")'>+</button>
										</div>
									</td>
									<!-- 상품 가격 -->
									<td class="product-price">
										<div class="product-count d-flex justify-content-center">
											<h4 class="p-price mt-4" id='total-price'>29800</h4>
											<h4 class="ms-1 mt-4">원</h4>
										</div>
									</td>
									
									<!-- 상품 삭제 버튼 -->
									<td class="product-close">
										<button class="btn ms-3 mt-2" onclick="productRemove()">
											<img class="remove-img"
												src="${pageContext.request.contextPath}/resources/image/icon/x.png"/>
										</button>
									</td>
								</tr>
								
								<!-- item2 ------------------------------------------------- -->
								<tr>
									<!-- 체크박스 -->
									<td><input type="checkbox" name="chk" id="check2" onclick="checked();"/>
									</td>
									<!-- 상품 이미지 -->
									<td class="procuct-col">
										<div class="d-flex product-img">
											<img src="${pageContext.request.contextPath}/resources/image/item_rep/intestine/intestine3.png" class="rounded-3" style="width:130px;height:130px;"/>
											<div class="p-content mt-4 ms-2">
												<h6 class="p-name">[종근당건강]</h6>
												<h6><a href="${pageContext.request.contextPath}/item/item_view">락토핏 골드 2g*50포</a></h6>
											</div>
										</div>
									</td>
									<!-- 상품 수량 -->
									<td width="20%">
										<div class="d-flex justify-content-center count-button mt-4">
												<button type="button" class="minus-button btn me-3" onclick='count2("minus")'>-</button>
												<h6 class="mt-2" id='result2'>1</h6>
												<button type="button" class="plus-button btn ms-3" onclick='count2("plus")'>+</button>
										</div>
									</td>
									<!-- 상품 가격 -->
									<td class="product-price">
										<div class="product-count d-flex justify-content-center">
											<h4 class="p-price mt-4" id='total-price'>15900</h4>
											<h4 class="ms-1 mt-4">원</h4>
										</div>
									</td>
									<!-- 상품 삭제 버튼 -->
									<td class="product-close">
										<button class="btn ms-3 mt-2" onclick="productRemove()">
											<img class="remove-img"
												src="${pageContext.request.contextPath}/resources/image/icon/x.png"/>
										</button>
									</td>
								</tr>
							</tbody>
						</table>				
					</div>
				</div>
				
				<div class="col-sm-4 mt-5">
					<div class="card bg-light w-100 ms-2 mb-3" style="max-width: 18rem;">
					  <div class="card-body">
					  	<div class="row mt-2">
						    <div class="col card-text">
						      	<h5>상품 금액</h5>
						    </div>
						    <div class="col card-text">
						      	<h5>45,700원</h5>
						    </div>
						 </div>
						 <div class="row mt-3 mb-5">
						    <div class="col card-text">
						      	<h5>배송비</h5>
						    </div>
						    <div class="col card-text">
						      	<h5>+3,000원</h5>
						    </div>
						 </div>
						 <hr>
						 <div class="row mt-3 mb-3">
						    <div class="col card-text">
						      	<h5>결제예정금액</h5>
						    </div>
						    <div class="col card-text">
						      	<h4> 48,700원</h4>
						    </div>
						 </div>
						 <div class="row mt-3 mb-3">
						    <div class="col card-text">
						      	<h6 style="font-size:15px">OO,OOO원 추가주문 시, <strong id="text-strong">무료배송</strong></h6>
						    </div>
						 </div>
					  </div>
					</div>
					
					<div class="d-grid gap-2 col-8 ms-2">
					  <button class="pay-btn btn btn-outline-primary btn-lg" type="button" onclick="location.href='#'">결제하기</button>
					</div>
					
					<div class="row mt-3">
					  <h6 style="font-size:14px">[주문완료] 상태일 경우에만 주문 취소가 가능합니다.</h6>
					  <h6 style="font-size:14px">[마이필 > 주문내역 상세페이지]에서 직접 취소하실 수 있습니다.</h6>
					</div>
				</div>
			</div>
		</div>
		
	</body>
</html>