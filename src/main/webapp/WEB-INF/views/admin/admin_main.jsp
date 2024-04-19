<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" >
		<title>관리자 메인페이지 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정-->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- jQuery 외부 라이브러리 설정 -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	
		<!--사용자 정의 스크립트 -->
		<script type="text/javascript">
		</script>

		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/main.css">
	</head>
	
	<body>
		<!-- navbar -->
		<nav class="navbar navbar-expand-lg navbar-light bs-side-navbar" style="background-color:#37cbe9;">
		    <a class="navbar-brand" href="#">LIFILL</a>
		    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
		        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		        <span class="navbar-toggler-icon"></span>
		    </button>
		
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		        <ul class="navbar-nav mr-auto">
		            <li class="nav-item dropdown mt-5 ms-2">
		            	<div class="accordion" id="accordionExample">
						  <div class="accordion-item">
						    <h2 class="accordion-header">
						      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						        	주문관리
						      </button>
						    </h2>
						    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						      <ul>
						         <li><a href="#">주문 조회</a></li>
						         <li><a href="#">주문 삭제</a></li>
						         <li><a href="#">주문 정보 수정</a></li>
						      </ul>
						      </div>
						    </div>
						  </div>
						</div>
		            </li>
<!-- 		            <li class="nav-item">
		                <a class="nav-link" href="#">Link</a>
		            </li>
		            <li class="nav-item active">
		                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
		            </li> -->
		        </ul>
		    </div>
		</nav>
		
	</body>
</html>