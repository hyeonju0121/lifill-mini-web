<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" >
		<title>관리자 로그인 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>
	
		<!--사용자 정의 스크립트 -->
		<script type="text/javascript">
			function handleCheckData() {
  				
  				event.preventDefault();
  				
  				//각 입력 양식의 데이터 검사
  				var totalResult = true;
  				
  				var uidPattern = /^(?=.*\d)(?=.*[a-z]).{7,11}$/;
  				var uidResult = uidPattern.test( $("#uid").val());
  				if(!uidResult) {
  					totalResult = false;
  					alert('아이디를 다시 한 번 확인해주세요!')
  				}
  				
  				//Password검사하기
  				var passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[!@#$%^&*?_])(?=.*[A-Z]).{10,15}$/;
  				var passwordResult = passwordPattern.test($("#password").val());
  				if(!passwordResult) {
  					totalResult = false;
  					alert('비밀번호를 다시 한 번 확인해주세요!')
  				}
  				
  				//전체 유효성 검사결과가 true일 경우
  				if(totalResult) {
  					$("#login-form")[0].submit();
  				}	  									
  			}
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
					action="/lifill_mini_web/admin/admin_main"
					onsubmit="handleCheckData()"
					novalidate>
					 <input type="text" class="form-control" id="uid" name="uid" placeholder="ID"/>
					 <input type="password" class="form-control" id="password" name="password" placeholder="Password"/>
			         <input type="submit" value="Login">
				</form>
		</div>
	</body>
</html>