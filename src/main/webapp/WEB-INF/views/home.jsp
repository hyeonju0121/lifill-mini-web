<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" >
		<title>라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>
	
		<!--사용자 정의 스크립트 -->
		<script type="text/javascript">
		</script>
	</head>
	
	<body>
		<div class="card">
		   <div class="card-header">라이필 메인 홈페이지 화면</div>
		    <div class="card-body">
		    	<ul>
		    		<li><a href="main">메인 페이지</a><li>
		    		<li><a href="admin">관리자</a><li>
		    		<li><a href="board">게시판</a><li>
		    		<li><a href="item">상품</a><li>
		    		<li><a href="member">회원</a><li>
		    	</ul>
		    </div>
		</div>
	</body>
</html>