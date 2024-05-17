<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>로그인 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
		
		</script>
		
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shop.css">
	 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign_in.css">
		
			<script>
	  		
	  		</script>
			
		
	</head>
	
	<body>			
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>			
			
			<form method="post" action="${pageContext.request.contextPath}/member/find_id" id="login-form" novalidate>
    				<div><h5 class="mb-5" style="text-align: center;">회원 아이디 : ${mid}</h5></div>
  
            <input type="submit" value="돌아가기"  style="background-color:white; color:#37cbe9;" onclick="${pageContext.request.contextPath}/sign_in.jsp">
			</form>
	</body>
</html>