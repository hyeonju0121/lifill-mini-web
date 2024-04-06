<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

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

<style type="text/css">

/* Style the footer ------------------------ */
.footer {
	background-color: #696969;
	padding: 10px;
	height: 200px;
}

/* best item ------------------------------- */
.card {padding =0;
	
}

.card-wrapper {
	
}

/* review ---------------------------------- */
/* img{
  height:150px;
  width:100%;
  height:400px;
}
 */
div [class^="col-"]{
  padding-left:5px;
  padding-right:5px;
}
.card{
  transition:0.5s;
  cursor:pointer;
}
.card-title{  
  font-size:15px;
  transition:1s;
  cursor:pointer;
}
.card-title i{  
  font-size:15px;
  transition:1s;
  cursor:pointer;
  color:#ffa710
}
.card-title i:hover{
  transform: scale(1.25) rotate(100deg); 
  color:#18d4ca;
  
}
.card:hover{
  transform: scale(1.05);
  box-shadow: 10px 10px 15px rgba(0,0,0,0.3);
}
.card-text{
  height:80px;  
}

.card::before, .card::after {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  transform: scale3d(0, 0, 1);
  transition: transform .3s ease-out 0s;
  background: rgba(255, 255, 255, 0.1);
  content: '';
  pointer-events: none;
}
.card::before {
  transform-origin: left top;
}
.card::after {
  transform-origin: right bottom;
}
.card:hover::before, .card:hover::after, .card:focus::before, .card:focus::after {
  transform: scale3d(1, 1, 1);
}


</style>

</head>

<body>
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="javascript:void(0)">LIFILL</a>
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
			<button class="btn" onclick="location.href='member/mypage'"><img src="./resources/image/icon/cart.png" width="20px" height="20px"/></button>
			<button class="btn" onclick="location.href='member'"><img src="./resources/image/icon/user.png" width="20px" height="20px"/></button>
		</div>
	</nav>

	<!-- 슬라이드 배너 -->
	<div id="carouselExampleControls" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="./resources/image/banner/lifill_banner1.png" class="d-block w-100"/>
			</div>
			<div class="carousel-item">
				<img src="./resources/image/banner/lifill_banner2.png" class="d-block w-100"/>
			</div>
			<div class="carousel-item">
				<img src="/htmlcssjs/resources/image/photos/photo3.jpg" class="d-block w-100"/>
			</div>
		</div>
		<!-- carousel button 1 -->
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

	<!-- best item -->
	<div class="container mt-5">
		<p class="h4">베스트 상품</p>
		<p class="h6">라이필의 BEST 추천상품을 만나보세요.</p>
		<div id="carouselExampleControls" class="carousel carousel-dark slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="card-wrapper container-sm d-flex  justify-content-around">
						<div class="card  " style="width: 18rem;">
							<img src="./resources/image/item_rep/intestine/intestine1.png" class="card-img-top">
							<div class="card-body">
								<h5 class="card-title">피부면역 유산균 100억 60g(2g*30포)</h5>
							</div>
						</div>
						<div class="card" style="width: 18rem;">
							<img src="./resources/image/item_rep/intestine/intestine2.png" class="card-img-top">
							<div class="card-body">
								<h5 class="card-title">멀티바이오틱스 100억 생유산균 (400mg*30캡슐*2병)</h5>
							</div>
						</div>
						<div class="card" style="width: 18rem;">
							<img src="./resources/image/item_rep/intestine/intestine3.png" class="card-img-top">
							<div class="card-body">
								<h5 class="card-title">락토핏 골드 2g*50포</h5>
							</div>
						</div>
						<div class="card" style="width: 18rem;">
							<img src="./resources/image/item_rep/intestine/intestine4.png" class="card-img-top">
							<div class="card-body">
								<h5 class="card-title">프로바이오틱스(2g*60포)</h5>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div
						class="card-wrapper container-sm d-flex   justify-content-around">
						<div class="card  " style="width: 18rem;">
							<img src="./resources/image/item_rep/intestine/intestine5_1.png" class="card-img-top">
							<div class="card-body">
								<h5 class="card-title">쾌변엔차전자피화이버(6g*30포)</h5>
							</div>
						</div>
						<div class="card" style="width: 18rem;">
							<img src="./resources/image/item_rep/intestine/intestine6_1.png" class="card-img-top">
							<div class="card-body">
								<h5 class="card-title">패밀리 온가족 유산균 1box (30포/1개월분)</h5>
							</div>
						</div>
						<div class="card" style="width: 18rem;">
							<img src="./resources/image/item_rep/eye/eye1.png"
								class="card-img-top">
							<div class="card-body">
								<h5 class="card-title">eye1 상품 이름이 들어갈 곳</h5>
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

		<br>

		<div class="container-fluid p-5 bg-primary text-white text-center">
			<h1>스토리 1</h1>
			<p>Resize this responsive page to see the effect!</p>
		</div>

		<br>

		<div class="container-fluid p-5 bg-primary text-white text-center">
			<h1>스토리 2</h1>
			<p>Resize this responsive page to see the effect!</p>
		</div>

		<br>
		
		<!-- review -->
		<div class="container mt-2">
			<p class="h4">고객 평점</p>
			<p class="h6">고객님들의 후기로 입증된 라이필 지금 체험하세요. </p>
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons">유OO님</i>
						</h4>
						<img src="./resources/image/item_rep/intestine/intestine1.png">
						<h5 class="card-title mt-3 mb-3">굉장히 편리해요</h5>
						<p class="card-text">review content1</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons">변OO님</i>
						</h4>
						<img src="./resources/image/item_rep/intestine/intestine2.png">
						<h5 class="card-title  mt-3 mb-3">만족</h5>
						<p class="card-text">review content2</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons">곽OO님</i>
						</h4>
						<img src="./resources/image/item_rep/intestine/intestine3.png">
						<h5 class="card-title  mt-3 mb-3">개좋아용</h5>
						<p class="card-text">review content3</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons">신OO님</i>
						</h4>
						<img src="./resources/image/item_rep/intestine/intestine4.png">
						<h5 class="card-title  mt-3 mb-3">나쁘지않은듯</h5>
						<p class="card-text">review content4</p>
					</div>
				</div>
			</div>
		</div>
	
	<!-- <div class="footer">
		<h2>Footer</h2>
	</div> --> 
</body>
</html>