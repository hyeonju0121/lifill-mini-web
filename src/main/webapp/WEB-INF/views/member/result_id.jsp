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
		
		function nameCheck(){
				// name이 빈문자면 아무것도 출력하지 않는다.
			if($("#mname").val() === ""){
				$("#mnameSpan").removeClass("text-danger");
			}else{
				// 빈문자가 아니면 유효성 검사 실행
				var mnamePattern = /^\d{13}$/;
				   var mnameResult = mssnPattern.test($("#mssn").val());
				   if(mnameResult) {
					   $("#mnameSpan").removeClass("text-danger");
					   $("#mnameSpan").html("");
				   } else {   
				      $("#mnameSpan").addClass("text-danger");
					  $("#mnameSpan").html("이름 형식에 맞게 입력해주세요.");
				      
				   }
			}
			
			
		}
		function emailCheck(){
			// email이 빈문자면 아무것도 출력하지 않는다.
			if($("#memail").val() === ""){
				$("#memail").removeClass("text-danger");
			}else{
				// 빈문자가 아니면 유효성 검사 실행
				var memailPattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
				var memailResult = memailPattern.test($("#memail").val());
				if(memailResult) {
					$("#memailSpan").removeClass("text-danger");
				} else {
					$("#memailSpan").addClass("text-danger");
				}
				      
			}
			
		}
		
		
		</script>
		
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shop.css">
	 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign_in.css">
		
			<script>
	  		
	  		</script>
			
		
	</head>
	
	<body>			
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>			
			<div class="login-wrapper" style = "margin-top:50px;">
				<h2>아이디 찾기</h2>
				<h5 style="text-align: center; margin-bottom:30px;">내일의 나를 만드는 <br/> 
				[건강메이트] 라이필</h5>
			        <form name="login-form" id="login-form" method="post"
			        	  action="${pageContext.request.contextPath}/member/find_id"
			              novalidate>
			            <input type="text" class="form-control" id="mname" name="mname" placeholder="이름 입력"/>
			            <span id="mnameSpan" class="form-text"></span>
			            <input type="email" class="form-control" id="memail" name="memail" placeholder="이메일 입력"/>
			            <span id="memailSpan" class="form-text"></span>
			            <input type="submit" value="아이디 찾기" onclick="${pageContext.request.contextPath}/member/sign_in">
			            <%-- <input type="button" value="아이디 찾기" onclick="${pageContext.request.contextPath}/member/result_id"> --%>
			        </form>
			        
		 	</div>	 	
	</body>
</html>