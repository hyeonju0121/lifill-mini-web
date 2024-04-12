<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" >
		<title>장바구니 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정-->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- jQuery 외부 라이브러리 설정 -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	
		<!--사용자 정의 스크립트 -->
		<script type="text/javascript">
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
				<div class="col-sm-8 border mt-5">
					<div class="cart-table">
						<table class="table p-2">
							<thead>
								<tr>
									<th><input type="checkbox" name="allCheck" id="allCheck"/></th>
									<th class="product-h">Product</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Total</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<!-- 체크박스 -->
									<td><input id="check1" type="checkbox"/>
									</td>
									<!-- 상품 이미지 -->
									<td class="procuct-col">
										<img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye4.png" style="width:180px;height:180px;"/>
										<div class="p-title">
											<h5><a href="#">루테인 지아잔틴 아스타잔틴 x 4박스</a></h5>
										</div>
									</td>
									<!-- 상품 가격 -->
									<td class="price-col">
										<h5>18,000원</h5>
									</td>
									<!-- 상품 수량 -->
									<td>
										<h5>1개</h5>
									</td>
									<!-- 총 가격 -->
									<td>
										<h5>19,000원</h5>
									</td>
									<!-- 상품 삭제 버튼 -->
									<td class="product-close">
										<button type="button" class="btn btn-outline-primary">x</button>
									</td>
								</tr>
								<tr>
									<!-- 체크박스 -->
									<td><input id="check2" type="checkbox"/>
									</td>
									<!-- 상품 이미지 -->
									<td class="procuct-col">
										<img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye5_image1.png" style="width:180px;height:180px;"/>
										<div class="p-title">
											<h5><a href="#">눈에는눈 루테인 눈에좋은 눈건강 영양제</a></h5>
										</div>
									</td>
									<!-- 상품 가격 -->
									<td class="price-col">
										<h5>9,000원</h5>
									</td>
									<!-- 상품 수량 -->
									<td>
										<h5>3개</h5>
									</td>
									<!-- 총 가격 -->
									<td>
										<h5>27,000원</h5>
									</td>
									<!-- 상품 삭제 버튼 -->
									<td class="product-close">
										<button type="button" class="btn btn-outline-primary">x</button>
									</td>
								</tr>
							</tbody>
						</table>				
					</div>
				</div>
				
				<div class="col-sm-4 border mt-5">
					<div class="card w-100 mb-3" style="max-width: 18rem;">
					  <div class="card-body">
					  	<div class="row">
						    <div class="col card-text">
						      	<h5>상품 금액</h5>
						    </div>
						    <div class="col card-text">
						      	<h5>19,000원</h5>
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
						      	<h4> 22,000원</h4>
						    </div>
						 </div>
						 <div class="row mt-3 mb-3">
						    <div class="col card-text">
						      	<h6 style="font-size:15px">OO,OOO원 추가주문 시, <strong id="text-strong">무료배송</strong></h6>
						    </div>
						 </div>
					  </div>
					</div>
					
					<div class="d-grid gap-2 col-8">
					  <button class="pay-btn btn btn-primary btn-lg" type="button" onclick="location.href='#'">결제하기</button>
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