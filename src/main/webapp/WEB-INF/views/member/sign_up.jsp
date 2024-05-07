<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>회원가입 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
		
		function handleCheckData() {
				
				event.preventDefault();
				
				//각 입력 양식의 데이터 검사
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
									
				//Email 검사하기
				var memailPattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
				var memailResult = memailPattern.test($("#memail").val());
				if(memailResult) {
					$("#memailSpan").removeClass("text-danger");
				} else {
					$("#memailSpan").addClass("text-danger");
					totalResult = false;
				}
				
				//Password 검사하기
				var mpasswordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[!@#$%^&*?_])(?=.*[A-Z]).{10,15}$/;
				var mpasswordResult = mpasswordPattern.test($("#mpassword").val());
				if(mpasswordResult) {
					$("#mpasswordSpan1").removeClass("text-danger");
				} else {
					$("#mpasswordSpan1").addClass("text-danger");
					totalResult = false;
				}
				
				//Password 확인
				if($('#mpassword').val() == $('#mpassword2').val()) {
				   $("#mpasswordSpan2").removeClass("text-danger");
				   $("#mpasswordSpan2").html("");
				} else {
					$("#mpasswordSpan2").html("비밀번호가 일치하지 않습니다.");
 		            $("#mpasswordSpan2").addClass("text-danger");
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
 		         
 		         //이름 검사하기
 		         var mnamePattern = /^[가-힣]{2,5}$/;
 		         var mnameResult = mnamePattern.test($("#mname").val());
 		         
 		         if(mnameResult) {
 		        	$("#mnameSpan").removeClass("text-danger");
 		        	$("#mnameSpan").html("");
 		         } else {
 		        	$("#mnameSpan").html("이름 형식에 맞게 입력해주세요.");
 		        	$("#mnameSpan").addClass("text-danger");
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
			            	  action="join" 
			            	  onsubmit="handleCheckData()"
			            	  novalidate>
	            	  	            	  
						        <div class="user-info">
							            <div>* 아이디</div>
							            <input type="text" class="form-control" id="mid" name="mid"/>
							            <span id="midSpan" class="form-text">알파벳 소문자, 숫자를 혼용해서 7자 이상 11자 이하</span>
							            <div>* 비밀번호</div>
							            <input type="password" class="form-control" id="mpassword" name="mpassword"/>
							            <span id="mpasswordSpan1" class="form-text">알파벳 대소문자, 숫자, 특수문자를 혼용해서 10자 이상 15자 이하</span>
							            <div>* 비밀번호 재확인</div>
							            <input type="password" class="form-control" id="mpassword2" name="mpassword2"/>
							            <span id="mpasswordSpan2" class="form-text">비밀번호 확인</span>
							            <div>* 이름</div>
							            <input type="text" class="form-control" id="mname" name="mname"/>
							            <span id="mnameSpan" class="form-text" >성함을 입력해주세요.</span>
							            <div>* 이메일</div>
							            <input type="email" class="form-control" id="memail" name="memail"/>
							            <span id="memailSpan" class="form-text">이메일 형식에 맞춰서 작성해주세요.</span>
							            <div>* 휴대폰</div>
							            <input type="tel" class="form-control" id="mphone" name="mphone"/>
							            <span id="mphoneSpan" class="form-text">숫자만 입력해주세요.</span>							            							            
										<!-- <div>* 주소</div> onclick은 무조건 javascript와 연결. 굳이 javascript 안 적어줘도 됨
										<input type="text" id="sample6_postcode" placeholder="우편번호">
										<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" id="sample6_address" placeholder="주소"><br>
										<input type="text" id="sample6_detailAddress" placeholder="상세주소">
										<input type="text" id="sample6_extraAddress" placeholder="참고항목"> -->									
						          </div>
					       	 <div class="btn">
					         <button type="submit">가입하기</button>
					       	</div>
		       			</form>
		       			<%-- <script defer src="${pageContext.request.contextPath}/js/sign_up.js"> </script>
		       			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> --%>
			<script>
			    function sample6_execDaumPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var addr = ''; // 주소 변수
			                var extraAddr = ''; // 참고항목 변수
			
			                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    addr = data.roadAddress;
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    addr = data.jibunAddress;
			                }
			
			                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			                if(data.userSelectedType === 'R'){
			                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있고, 공동주택일 경우 추가한다.
			                    if(data.buildingName !== '' && data.apartment === 'Y'){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                    if(extraAddr !== ''){
			                        extraAddr = ' (' + extraAddr + ')';
			                    }
			                    // 조합된 참고항목을 해당 필드에 넣는다.
			                    document.getElementById("sample6_extraAddress").value = extraAddr;
			                
			                } else {
			                    document.getElementById("sample6_extraAddress").value = '';
			                }
			
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('sample6_postcode').value = data.zonecode;
			                document.getElementById("sample6_address").value = addr;
			                // 커서를 상세주소 필드로 이동한다.
			                document.getElementById("sample6_detailAddress").focus();
			            }
			        }).open();
			    }
			</script>
						
		     	 </div>
		   	 </div>
	</body>
</html>
			          

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