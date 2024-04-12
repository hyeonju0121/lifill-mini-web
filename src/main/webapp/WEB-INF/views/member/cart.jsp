<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" >
		<title>Insert title here</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정-->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- jQuery 외부 라이브러리 설정 -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	
		<!--사용자 정의 스크립트 -->
		<script type="text/javascript">
		</script>

	</head>
	
	<body>
		<!-- 네비게이션 바  ------------------------------------------------------------------------>
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="main">LIFILL</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#mynavbar">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="mynavbar">
					<ul class="navbar-nav me-auto">
						<li class="nav-item"><a class="nav-link" href="#">LIFILL 스토리</a></li>
						<li class="nav-item"><a class="nav-link" href="item">SHOP</a></li>
						<div class="dropdown">
							<button type="button" class="btn text-secondary"
								data-bs-toggle="dropdown">게시판</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="board/notice">공지사항</a></li>
								<li><a class="dropdown-item" href="board/faq">FAQ</a></li>
								<li><a class="dropdown-item" href="board/qna">1:1문의</a></li>
							</ul>
						</div>
					</ul>
				</div>
				<button class="btn" onclick="location.href='#'"><img id="cartIcon" src="${pageContext.request.contextPath}/resources/image/icon/cart.png" style="height: 25px;"/></button>
				<button class="btn" onclick="location.href='#'"><img id="userIcon" src="${pageContext.request.contextPath}/resources/image/icon/user.png" style="height: 25px;"/></button>
			</div>
		</nav>
		
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
					<div class="card">
						<div class="card-header">주문하는 부분</div>
						<div class="card-body">
							선택 상품 확인, 주문하기 버튼 
						</div>
					</div>
				</div>
			</div>
		</div>

	</body>
</html>