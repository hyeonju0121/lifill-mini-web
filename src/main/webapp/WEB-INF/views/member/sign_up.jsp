<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>회원가입 - 라이필</title>
		
				<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
		
		function handleCheckData() {
				
				event.preventDefault();
				
				//각 입력 양식의 데이터 검사
				var totalResult = true;
								
				//ID검사 아이디는 알파벳소문자,숫자혼용 7~11자
				var uidPattern = /^(?=.*\d)(?=.*[a-z]).{7,10}$/;
				var uidResult = uidPattern.test( $("#uid").val());
				if(uidResult) {
					$("#uidSpan").removeClass("text-danger");
				} else{
					$("#uidSpan").addClass("text-danger");
					totalResult = false;
				}
									
				//Email 검사하기
				var emailPattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
				var emailResult = emailPattern.test($("#email").val());
				if(emailResult) {
					$("#emailSpan").removeClass("text-danger");
				} else {
					$("#emailSpan").addClass("text-danger");
					totalResult = false;
				}
				
				//Password 검사하기
				var passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{10,15}$/;
				var passwordResult = passwordPattern.test($("#password").val());
				if(passwordResult) {
					$("#passwordSpan").removeClass("text-danger");
				} else {
					$("#passwordSpan").addClass("text-danger");
					totalResult = false;
				}
							
				 //Phone 검사 --------------------------------------------------
 		         var phonePattern = /^(010|011)\d{3,4}\d{4}$/;
 		         var phoneResult = phonePattern.test($("#phone").val());
 		         
 		         if(phoneResult) {
 		            $("#phoneSpan").removeClass("text-danger");
 		            $("#phoneSpan").html("");
 		         } else {
 		            $("#phoneSpan").html("전화번호 형식이 아닙니다.");
 		            $("#phoneSpan").addClass("text-danger");
 		            totalResult = false;
 		         }
 		         
				//전체 유효성 검사결과가 true일 경우
				if(totalResult) {
					$("#joinForm")[0].submit();
					alert('가입을 환영합니다!')
				}
										
			}			
		</script>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign_up.css">
	</head>
	
	<body>

	 </head>
			  <body>
			    <div class="container">
			      <div class="member-container">
			        <div class="header">
			          <div>회원 가입을 위해</div>
			          <div>정보를 입력해주세요</div>
				        </div>
					        <form id="joinForm" name="joinForm" 
			            	  action="/lifill_mini_web/main" 
			            	  onsubmit="handleCheckData()"
			            	  novalidate>
	            	  	            	  
						        <div class="user-info">
						          <div class="user-info-email">
							          <div class="user-info-name">
							            <div>* 아이디</div>
							            <input type="text" class="form-control" id="uid" name="uid"/>
							            <span id="uidSpan" class="form-text">알파벳 소문자, 숫자를 혼용해서 7자 이상 11자 이하</span>
							          </div>
							          <div class="user-info-password">
							            <div>* 비밀번호</div>
							            <input type="password" class="form-control" id="password" name="password"/>
							            <span id="passwordSpan" class="form-text">알파벳 대소문자, 숫자를 혼용해서 10자 이상 15자 이하</span>
							          </div>
							            <div>* 이름</div>
							            <input type="text" class="form-control" id="uname" name="uname"/>
							            <span id="nameSpan" class="form-text" >성함을 입력해주세요.</span>
							          <div>* 이메일</div>
							            <input type="email" class="form-control" id="email" name="email"/>
							            <span id="emailSpan" class="form-text">이메일 형식에 맞춰서 작성해주세요.</span>
							          </div>
							          <div>* 휴대폰</div>
							            <input type="tel" class="form-control" id="phone" name="phone"/>
							            <span id="phoneSpan" class="form-text">숫자만 입력해주세요.</span>
						          </div>
					       	 <div class="btn">
					         <button>가입하기</button>
					       	</div>
		       			</form>
		     	 </div>
		   	 </div>
	</body>
</html>
			          <!-- <div class="user-info-pw-check">
			            <div>* 비밀번호 확인</div>
			            <input type="password" />
			          </div> -->
			        <!-- <div class="gender">
			          <input type="radio" name="gender" />
			          <label for="women">여성</label>
			          <input type="radio" name="gender" />
			          <label for="men">남성</label>
			        </div> -->
			        <!-- <div class="agree-check">
			          <input type="checkbox" /> 이용약관 개인정보 수집 및 이용, 마케팅 활용
			         	 선택에 모두 동의합니다.
			        </div> -->