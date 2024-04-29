<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>로그인 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
		
		</script>
		
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shop.css">
	 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign_in.css">
		
			<script>
	  			function handleCheckData() {
	  				
	  				event.preventDefault();
	  				
	  				//각 입력 양식의 데이터 검사
	  				var totalResult = true;
	  				
	  				var uidPattern = /^(?=.*\d)(?=.*[a-z]).{7,11}$/;
	  				var uidResult = uidPattern.test( $("#uid").val());	  				
	  				if(uidResult) {
						$("#uidSpan").removeClass("text-danger");
						$("#uidSpan").html("");
					} else{
						$("#uidSpan").html("아이디를 입력해주세요.");
						$("#uidSpan").addClass("text-danger");
						totalResult = false;
					}
	  				
	  					
	  				//Password검사하기
	  				var passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[!@#$%^&*?_])(?=.*[A-Z]).{10,15}$/;
	  				var passwordResult = passwordPattern.test($("#password").val());
	  				if(passwordResult) {
	  					$("#passwordSpan").removeClass("text-danger");
	  				} else{
	  					totalResult = false;
	  					$("#passwordSpan").html("아이디또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.");
	  					$("#passwordSpan").addClass("text-danger");
	  				}
	  					
	  				
	  				//전체 유효성 검사결과가 true일 경우
	  				if(totalResult) {
	  					$("#login-form")[0].submit();
	  					
	  				}	  									
	  			}
	  		</script>
			
		
	</head>
	
	<body>			
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>			
			<div class="login-wrapper" style = "margin-top:50px;">
				<h2>Login</h2>
				<h5 style="text-align: center; margin-bottom:30px;">내일의 나를 만드는 <br/> 
				[건강메이트] 라이필</h5>
			        <form name="login-form" id="login-form"
			        action="/lifill_mini_web/main"
			        onsubmit="handleCheckData()" 	          	  
			        novalidate>
			            <input type="text" class="form-control" id="uid" name="uid" placeholder="ID"/>
			            <span id="uidSpan" class="form-text"></span>
			            <input type="password" class="form-control" id="password" name="password" placeholder="Password"/>
			            <span id="passwordSpan" class="form-text"></span>
			            <!-- <label for="remember-check">
			            <input type="checkbox" id="remember-check">아이디 저장
			            </label> -->
			            <input type="submit" value="Login">
			          	<input type="button" value="회원가입" onclick="location.href='/lifill_mini_web/member/sign_up'">			            
			        </form>
		 	</div>	 	
	</body>
</html>