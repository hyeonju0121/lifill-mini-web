<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>라이필 - LIFILL</title>
		
		<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정-->
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
			rel="stylesheet">
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- lineicons 외부 라이브러리 설정 -->
		<link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
		<!-- jQuery 외부 라이브러리 설정 -->
		<script
			src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		
		<!--사용자 정의 스크립트 -->
		<script type="text/javascript">
		</script>
	
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shop.css">
	
	</head>
	
	<body>
		<!-- 네비게이션 바  ------------------------------------------------------------------------>
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	
		<!-- 슬라이드 배너 -------------------------------------------------------------------------->
		<div id="demo" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
			  <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
			  <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
			  <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
			</div>
		  
		  <!-- 슬라이드 내용 -->
			<div class="carousel-inner">
			 	<div class="carousel-item active">
			 		<img src="${pageContext.request.contextPath}/resources/image/story/story3.png" 
			 		class="d-block banner-img">
				</div>
				
				<div class="carousel-item">
				    <img src="${pageContext.request.contextPath}/resources/image/banner/lifill_banner2.png" 
				    class="d-block banner-img">
				</div>
				
				<div class="carousel-item">
				    <img src="${pageContext.request.contextPath}/resources/image/banner/lifill_banner3.png" 
				    class="d-block banner-img">
				</div>
			</div>
		</div>
	
		<!-- best item -------------------------------------------------------------------------->
		<div class="container mt-5">
			<p class="h4">베스트 상품</p>
			<p class="h6">라이필의 BEST 추천상품을 만나보세요.</p>
			
			<!-- 슬라이드 배너 -->
			<div id="carouselExampleControls" class="carousel carousel-dark slide"
				data-bs-ride="carousel">
				<div class="carousel-inner embed-responsive embed-responsive-4by3">
					<!-- 첫 번째 슬라이드 -->
					<div class="carousel-item active w-100">
						<div class="card-wrapper container-sm d-flex justify-content-around m-5">
							<div class="card best-item-card">
								<img src="${pageContext.request.contextPath}/resources/image/item_rep/intestine/intestine1.png"
								class="card-img-top embed-responsive-item best-item-img">
								<div class="card-body">
									<h5 class="card-title">피부면역 유산균 100억 60g(2g*30포)</h5>
								</div>
							</div>
							<div class="card best-item-card">
								<img src="${pageContext.request.contextPath}/resources/image/item_rep/intestine/intestine2.png" 
								class="card-img-top embed-responsive-item best-item-img">
								<div class="card-body">
									<h5 class="card-title">멀티바이오틱스 100억 생유산균 (400mg*30캡슐*2병)</h5>
								</div>
							</div>
							<div class="card best-item-card">
								<img src="${pageContext.request.contextPath}/resources/image/item_rep/intestine/intestine3.png" 
								class="card-img-top embed-responsive-item best-item-img">
								<div class="card-body">
									<h5 class="card-title">락토핏 골드 2g*50포</h5>
								</div>
							</div>
							<div class="card best-item-card">
								<img src="${pageContext.request.contextPath}/resources/image/item_rep/intestine/intestine4.png" 
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
								<img src="${pageContext.request.contextPath}/resources/image/item_rep/intestine/intestine5_1.png" 
								class="card-img-top embed-responsive-item best-item-img">
								<div class="card-body">
									<h5 class="card-title">쾌변엔차전자피화이버(6g*30포)</h5>
								</div>
							</div>
							<div class="card best-item-card">
								<img src="${pageContext.request.contextPath}/resources/image/item_rep/intestine/intestine6_1.png" 
								class="card-img-top embed-responsive-item best-item-img">
								<div class="card-body">
									<h5 class="card-title">패밀리 온가족 유산균 1box (30포/1개월분)</h5>
								</div>
							</div>
							<div class="card best-item-card">
								<img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye1.png" 
								class="card-img-top embed-responsive-item best-item-img">
								<div class="card-body">
									<h5 class="card-title">아이클리어 루테인지아잔틴 오메가3 600mg*60캡슐</h5>
								</div>
							</div>
							<div class="card best-item-card">
								<img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye2.png" 
								class="card-img-top embed-responsive-item best-item-img">
								<div class="card-body">
									<h5 class="card-title">마인트리 루테인지아잔틴 6박스</h5>
								</div>
							</div>
						</div>
					</div>
				</div>
					
				<!-- carousel button -->
				<button class="carousel-control-prev" type="button" 
					data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" 
					data-bs-target="#carouselExampleControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	
		<!-- story --------------------------------------------------------------------->
		<br>
		<div class="container">
			<img src="${pageContext.request.contextPath}/resources/image/story/story1.png" class="img-fluid">
			<img src="${pageContext.request.contextPath}/resources/image/story/story4.png" class="img-fluid">
		</div>
			
		<!-- review ------------------------------------------------------------------->
		<div class="bg-image d-flex justify-content-center align-items-center embed-responsive embed-responsive-4by3"
	    		style="background-image: url('${pageContext.request.contextPath}/resources/image/background/review_background_img1.png'); height: 70vh;">
			<div class="container mt-2">
				<p class="h4">고객 평점</p>
				<p class="h6">고객님들의 후기로 입증된 라이필 지금 체험하세요. </p>
				<div class="row mt-4">
					<!-- 첫 번째 리뷰 카드 -->
					<div class="col-md-3 col-sm-6">
						<div class="card card-block">
							<h4 class="card-title text-right">
								<i class="material-icons">유OO님</i>
							</h4>
							<img class="embed-responsive-item review-img" 
							src="${pageContext.request.contextPath}/resources/image/item_rep/intestine/intestine1.png">
							<h5 class="card-title mt-3 mb-3">굉장히 편리해요</h5>
							<p class="card-text">하나씩 꺼내먹으면 돼서 편하고 피부도 깨끗해졌어요!</p>
						</div>
					</div>
					<!-- 두 번재 리뷰 카드 -->
					<div class="col-md-3 col-sm-6">
						<div class="card card-block">
							<h4 class="card-title text-right">
								<i class="material-icons">변OO님</i>
							</h4>
							<img class="embed-responsive-item review-img"
							src="${pageContext.request.contextPath}/resources/image/item_rep/intestine/intestine2.png">
							<h5 class="card-title mt-3 mb-3">만족하는 제품입니다</h5>
							<p class="card-text">유산균이 100억마리나 돼서 믿고 먹고 있어요</p>
						</div>
					</div>
					<!-- 세 번재 리뷰 카드 -->
					<div class="col-md-3 col-sm-6">
						<div class="card card-block">
							<h4 class="card-title text-right">
								<i class="material-icons">곽OO님</i>
							</h4>
							<img class="embed-responsive-item review-img" 
							src="${pageContext.request.contextPath}/resources/image/item_rep/intestine/intestine3.png">
							<h5 class="card-title mt-3 mb-3 ">개좋아용</h5>
							<p class="card-text">제 인생템입니다 없으면 화장실을 못 가요</p>
						</div>
					</div>
					<!-- 네 번재 리뷰 카드 -->
					<div class="col-md-3 col-sm-6">
						<div class="card card-block">
							<h4 class="card-title text-right">
								<i class="material-icons">신OO님</i>
							</h4>
							<img class="embed-responsive-item review-img" 
							src="${pageContext.request.contextPath}/resources/image/item_rep/intestine/intestine4.png">
							<h5 class="card-title mt-3 mb-3">나쁘지않은듯</h5>
							<p class="card-text">야쿠르트 맛이 나서 좋네요</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- footer --------------------------------------------------------------------------->
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</body>
</html>