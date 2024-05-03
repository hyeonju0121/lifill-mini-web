<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>상품 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
			
		</script>
		
	</head>
	
	<body>
		<div class="card">
		    <div class="card-header">상품 메인 화면</div>
		    <div class="card-body">
				<ul>
					<li><a href="item/category1">카테고리1 이동</a></li>
					<li><a href="item/category2">카테고리2 이동</a></li>
					<li><a href="item/category3">카테고리3 이동</a></li>
					<li><a href="item/category4">카테고리4 이동</a></li>
					<li><a href="item/category5">카테고리5 이동</a></li>
					<li><a href="item/category6">카테고리6 이동</a></li>
					<li><a href="item/item_view">상품 상세 페이지 이동</a></li>
					<li><a href="item/order">주문 페이지 이동</a></li>
				</ul>
			</div> 
		</div>
	</body>
</html>