<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>라이필 > 주문</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>
		
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/item/orderComplete.css">
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
	        
		</script>
		
	</head>
	
	<body>
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>
		
		<div class="container">
			<div class="order_center">
				<div class="order_condition">
					<span>01. CART</span>
					<span>02. ORDER</span>
					<span id="here"><b>03. ORDER COMPLETED</b></span>
				</div>
			</div>
			<div class="main-div">
				<p class="order-success">주문이 완료되었습니다!</p>
			
				<div class="order-info">
					<span>주문번호 확인, 배송 조회 등은 마이페이지 > 주문 내역 조회 탭에서 확인 가능합니다.</span><br/>
					<span>최대한 신속하고 안전하게 상품을 배송해드리겠습니다.</span>
				</div>
			
			</div>
		</div>
		<!--------------- footer ---------------->
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</body>
</html>