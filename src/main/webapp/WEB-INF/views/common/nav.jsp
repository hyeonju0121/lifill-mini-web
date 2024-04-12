<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
		
		<!-- 장바구니, 사용자 버튼 -->
		<button class="btn" onclick="location.href='member/cart'">
			<img class="icon-img" 
			src="${pageContext.request.contextPath}/resources/image/icon/cart.png"/>
		</button>
		<button class="btn" onclick="location.href='member'">
			<img class="icon-img" 
			src="${pageContext.request.contextPath}/resources/image/icon/user.png"/>
		</button>
	</div>
</nav>