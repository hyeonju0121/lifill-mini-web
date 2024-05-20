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
		
		 	function pwModify() {
		        const pwModal = new bootstrap.Modal("#pwModifyModal");
		        pwModal.show();		
			}
			
			
			 	function handleCheckData() {
				
				event.preventDefault();
				
				//각 입력 양식의 데이터 검사
				var totalResult = true;
				
				//Password 검사하기
				var mpasswordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[!@#$%^&*?_])(?=.*[A-Z]).{10,15}$/;
				var mpasswordResult = mpasswordPattern.test($("#mpassword").val());
				if(mpasswordResult) {
					$("#mpasswordSpan1").removeClass("text-danger");
					$("#mpasswordSpan1").html("");
				} else {
					$("#mpasswordSpan1").addClass("text-danger");
					$("#mpasswordSpan1").html("올바르지않은 비밀번호입니다.");
					totalResult = false;
				}
				
				//Password 확인
				if($('#mpassword').val() == $('#passwordCheck').val()) {
				   $("#mpasswordSpan2").removeClass("text-danger");
				   $("#mpasswordSpan2").html("");
				} else {
					$("#mpasswordSpan2").html("비밀번호가 일치하지 않습니다.");
		            $("#mpasswordSpan2").addClass("text-danger");
		            totalResult = false;
				}
				//전체 유효성 검사결과가 true일 경우
				if(totalResult) {
					console.log("totalResult");
					$("#pwCheck")[0].submit();
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
		
			
				<form method="post" action="${pageContext.request.contextPath}/member/find_pw" id="login-form" novalidate>
		    			<%-- <div style="height:100px"> 비밀번호 값만 넘겨주고 싶으면 사용가능= 비밀번호 : ${mpassword} --%>
		    			<%-- <div><h5 class="mb-5" style="text-align: center;">비밀번호 : ${mpassword} </h5></div> --%>
		    				 <button  style="height:70px; width:100px;" type="button" onclick="pwModify()"class="btn btn-outline-dark btn-lg">
							 			 변경하기</button>			
		    			 
		            		<input type="submit" value="돌아가기"  style="background-color: #37cbe9; color:white;">
		        </form>
 				
	  		 	<!-- modal(pw) -->
				<div class="modal" tabindex="-1" id="pwModifyModal">
					<div class="modal-dialog">
						<div class="modal-content">
						
						<!-- modal header -->
						<div class="modal-header">
							<h5 class="modal-title">비밀번호  변경</h5>
							
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						
						<!-- modal body -->
						<div class="modal-body">
							<form id="pwCheck"
								  method="post"
								  action="${pageContext.request.contextPath}/member/ChangePw"
								  onsubmit="handleCheckData()">
									<input type="hidden" name="mid" value="${mid}">
									<div class="div_form row">
										<div style="margin-top: 5px;">비밀번호 재설정</div>
										
										<input
											class="col-7 mb-2" type="password" id="mpassword" name="mpassword"
											/>
										<span id="mpasswordSpan1" class="form-text">알파벳 대소문자, 숫자, 특수문자를 혼용해서 10자 이상 15자 이하</span>
									
									</div>
									<div class="div_form row">
										<!-- <label for="pwcheck" class="col-3"><strong>비밀번호
												확인</strong></label><hr> -->
										<div style="margin-top: 5px;">비밀번호 확인</div>
										<input class="col-7 mb-2" type="password" id="passwordCheck"
											   name="passwordCheck" />
										<span id="mpasswordSpan2" class="form-text">비밀번호 확인</span>
									</div>
								<!-- modal footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
									<button type="submit" class="btn"
										style="background-color: #37cbe9; color: white;">비밀번호 수정</button>
								</div>
						</form>
				</div>
						
					</div>
				</div>
			</div>		
	</body>
</html>