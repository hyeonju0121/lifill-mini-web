<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" >
		<title>관리자 로그인 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정-->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- jQuery 외부 라이브러리 설정 -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	
		<!--사용자 정의 스크립트 -->
		<script type="text/javascript">
		</script>
		
		<!-- external css -->
	 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/login.css">
	</head>
	
	<body>
		<div class="login-wrapper" style="margin-top:50px;">
			<h2>Admin Login</h2>
			<h5 style="text-align: center; margin-bottom:30px;">
				내일의 나를 만드는<br/>
				[건강메이트] 라이필
			</h5>
				<form name="loggin-form" id="login-form"
					action="/lifill_mini_web/admin_main"
					onsubmit="handleCheckData()"
					novalidate>
					 <input type="text" class="form-control" id="uid" name="uid" placeholder="ID"/>
					 <input type="password" class="form-control" id="password" name="password" placeholder="Password"/>
			         <input type="submit" value="Login">
				</form>
			
		   
		</div>
	</body>
</html>