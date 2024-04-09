<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Insert title here</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
			
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
				<button class="btn" onclick="location.href='#'"><img id="cartIcon" src="./resources/image/icon/cart.png" style="height: 25px;"/></button>
				<button class="btn" onclick="location.href='#'"><img id="userIcon" src="./resources/image/icon/user.png" style="height: 25px;"/></button>
			</div>
		</nav>
		
		<!--  -->
	</body>
</html>