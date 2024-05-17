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
		
		function logCheck() {
			
			event.preventDefault();
			
			var totalResult = true;
			
			//ID검사 아이디는 알파벳소문자,숫자혼용 7~11자
			var midPattern = /^(?=.*\d)(?=.*[a-z]).{7,11}$/;
			var midResult = midPattern.test( $("#mid").val());
			if(midResult) {
				$("#midSpan").removeClass("text-danger");
			} else{
				$("#midSpan").addClass("text-danger");
				totalResult = false;
			}
		
			//Phone 검사하기
	         var mphonePattern = /^(010|011)\d{3,4}\d{4}$/;
	         var mphoneResult = mphonePattern.test($("#mphone").val());
	         
	         if(mphoneResult) {
	            $("#mphoneSpan").removeClass("text-danger");
	            $("#mphoneSpan").html("");
	         } else {
	        	$("#mphoneSpan").html("전화번호 형식이 아닙니다.");
	            $("#mphoneSpan").addClass("text-danger");
	            totalResult = false;
	         }
	         
	         if(totalResult) {
				$("#login-form")[0].submit();
					
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
				<h2>비밀번호 찾기</h2>
			        <form name="login-form" id="login-form" method="post"
			        	  onsubmit="logCheck()"
			        	  action="${pageContext.request.contextPath}/member/find_pw"
			              novalidate>
			            <span id="midSpan" class="form-text">아이디</span>
			            <input type="text" class="form-control" id="mid" name="mid" placeholder="아이디 입력"/>
			            <span id="mphoneSpan" class="form-text">전화번호</span>
			            <input type="tel" class="form-control" id="mphone" name="mphone" placeholder="전화번호 입력"/>
			            <input type="submit" value="비밀번호 찾기" onclick="${pageContext.request.contextPath}/member/sign_in">
			        </form>
		 	</div>
	</body>
</html>