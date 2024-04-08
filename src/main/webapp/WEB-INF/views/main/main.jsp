<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>라이필 - LIFILL</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- Bootstrap 5를 위한 외부 라이브러리 설정-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery 외부 라이브러리 설정 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<!--사용자 정의 스크립트 -->
<script type="text/javascript">
</script>

<!-- external css -->
<link rel="stylesheet" href="./resources/css/shop.css">

</head>

<body>
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
			<button class="btn" onclick="location.href='member/my_page'"><img id="cartIcon" src="./resources/image/icon/cart.png" style="height: 25px;"/></button>
			<button class="btn" onclick="location.href='member'"><img id="userIcon" src="./resources/image/icon/user.png" style="height: 25px;"/></button>
		</div>
	</nav>

	<!-- 슬라이드 배너 -->
	<div id="demo" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
	    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
	    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
	  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="./resources/image/story/story3.png" class="d-block banner-img">
		    </div>
		    <div class="carousel-item">
		      <img src="./resources/image/banner/lifill_banner2.png" class="d-block banner-img">
		    </div>
		    <div class="carousel-item">
		      <img src="./resources/image/banner/lifill_banner3.png" class="d-block banner-img"> 
		    </div>
		  </div>
	</div>

	<!-- best item -->
	<div class="container mt-5">
		<p class="h4">베스트 상품</p>
		<p class="h6">라이필의 BEST 추천상품을 만나보세요.</p>
		<div id="carouselExampleControls" class="carousel carousel-dark slide"
			data-bs-ride="carousel">
			<div class="carousel-inner embed-responsive embed-responsive-4by3">
				<div class="carousel-item active w-100">
					<div class="card-wrapper container-sm d-flex  justify-content-around m-5">
						<div class="card  " style="width: 17rem;">
							<img id="bestItemImg1" src="./resources/image/item_rep/intestine/intestine1.png" class="card-img-top embed-responsive-item">
							<div class="card-body">
								<h5 class="card-title">피부면역 유산균 100억 60g(2g*30포)</h5>
							</div>
						</div>
						<div class="card" style="width: 17rem;">
							<img id="bestItemImg2" src="./resources/image/item_rep/intestine/intestine2.png" class="card-img-top embed-responsive-item">
							<div class="card-body">
								<h5 class="card-title">멀티바이오틱스 100억 생유산균 (400mg*30캡슐*2병)</h5>
							</div>
						</div>
						<div class="card" style="width: 17rem;">
							<img id="bestItemImg3" src="./resources/image/item_rep/intestine/intestine3.png" class="card-img-top embed-responsive-item">
							<div class="card-body">
								<h5 class="card-title">락토핏 골드 2g*50포</h5>
							</div>
						</div>
						<div class="card" style="width: 17rem;">
							<img id="bestItemImg4" src="./resources/image/item_rep/intestine/intestine4.png" class="card-img-top">
							<div class="card-body">
								<h5 class="card-title">프로바이오틱스(2g*60포)</h5>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div
						class="card-wrapper container-sm d-flex justify-content-around m-5">
						<div class="card  " style="width: 18rem;">
							<img id="bestItemImg5" src="./resources/image/item_rep/intestine/intestine5_1.png" class="card-img-top embed-responsive-item">
							<div class="card-body">
								<h5 class="card-title">쾌변엔차전자피화이버(6g*30포)</h5>
							</div>
						</div>
						<div class="card" style="width: 18rem;">
							<img id="bestItemImg6" src="./resources/image/item_rep/intestine/intestine6_1.png" class="card-img-top embed-responsive-item">
							<div class="card-body">
								<h5 class="card-title">패밀리 온가족 유산균 1box (30포/1개월분)</h5>
							</div>
						</div>
						<div class="card" style="width: 18rem;">
							<img id="bestItemImg7" src="./resources/image/item_rep/eye/eye1.png" class="card-img-top embed-responsive-item">
							<div class="card-body">
								<h5 class="card-title">아이클리어 루테인지아잔틴 오메가3 600mg*60캡슐</h5>
							</div>
						</div>
						<div class="card" style="width:18rem">
							<img id="bestItemImg8" src="./resources/image/item_rep/eye/eye2.png" class="card-img-top embed-responsive-item">
							<div class="card-body">
								<h5 class="card-title">마인트리 루테인지아잔틴 6박스</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
				
				<!-- carousel button 2 -->
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

		<!-- story -->
		<br>
		<div class="container">
			<img src="./resources/image/story/story1.png" class="img-fluid">
			<img src="./resources/image/story/story4.png" class="img-fluid">
		</div>
		
		<!-- review -->
		<div class="bg-image d-flex justify-content-center align-items-center embed-responsive embed-responsive-4by3"
     		style="background-image: url('./resources/image/background/review_background_img1.png'); height: 70vh;">
			<div class="container mt-2">
				<p class="h4">고객 평점</p>
				<p class="h6">고객님들의 후기로 입증된 라이필 지금 체험하세요. </p>
				<div class="row mt-4">
					<div class="col-md-3 col-sm-6">
						<div class="card card-block">
							<h4 class="card-title text-right">
								<i class="material-icons">유OO님</i>
							</h4>
							<img id="reviewImg1" class="embed-responsive-item"  src="./resources/image/item_rep/intestine/intestine1.png">
							<h5 class="card-title mt-3 mb-3">굉장히 편리해요</h5>
							<p class="card-text">하나씩 꺼내먹으면 돼서 편하고 피부도 깨끗해졌어요!</p>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="card card-block">
							<h4 class="card-title text-right">
								<i class="material-icons">변OO님</i>
							</h4>
							<img id="reviewImg2" class="embed-responsive-item"  src="./resources/image/item_rep/intestine/intestine2.png">
							<h5 class="card-title  mt-3 mb-3">만족하는 제품입니다</h5>
							<p class="card-text">유산균이 100억마리나 돼서 믿고 먹고 있어요</p>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="card card-block">
							<h4 class="card-title text-right">
								<i class="material-icons">곽OO님</i>
							</h4>
							<img id="reviewImg3" class="embed-responsive-item"  src="./resources/image/item_rep/intestine/intestine3.png">
							<h5 class="card-title mt-3 mb-3 ">개좋아용</h5>
							<p class="card-text">제 인생템입니다 없으면 화장실을 못 가요</p>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="card card-block">
							<h4 class="card-title text-right">
								<i class="material-icons">신OO님</i>
							</h4>
							<img id="reviewImg4" class="embed-responsive-item"  src="./resources/image/item_rep/intestine/intestine4.png">
							<h5 class="card-title  mt-3 mb-3">나쁘지않은듯</h5>
							<p class="card-text">야쿠르트 맛이 나서 좋네요</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<!-- footer -->
		<div class="pt-5 footer">
			<div class="container">
				<div class="row">
					<div class="col-lg-5 col-xs-12 about-company" style="flex:1;">
						<h4>내일의 나를 만드는 [건강메이트] 라이필</h4><br/><br/>
						<p class="pr-5 text-white-50"><h5>Contact us</h5>
						<i class="fa fa-envelope-o mr-3" style="font-size:14px;">팀장 유현주, hyeonju__@naver.com <br/></i>
						<i class="fa fa-envelope-o mr-3" style="font-size:14px">팀원 변성준, tjdwns3823@naver.com <br/></i>
						<i class="fa fa-envelope-o mr-3" style="font-size:14px">팀원 곽동현, ggwag@gmail.com <br/></i>
					</div>
		
					<div class="col-lg-4 col-xs-12 location" style="flex:1;">
						<h4 class="mt-lg-0 mt-sm-4">Location</h4>
						<p>서울특별시 송파구 중대로 135 아이티벤처타워, 12층 한국소프트웨어산업협회</p>
						<p class="mb-0">
							<i class="fa fa-phone mr-3"></i> 팀 라이필 1차 미니 웹 프로젝트
						</p>
						<p class="mt-5">
							고객센터 버튼? 공지사항 버튼? 보통 SNS 계정으로 이동하는 아이콘이나, 사업자번호 등이 나오는 부분
						</p>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col copyright">
						<p class="">
							<small class="text-white-50">© 2024. All Rights Reserved.</small>
						</p>
					</div>
				</div>
			</div>
		</div>
</body>
</html>