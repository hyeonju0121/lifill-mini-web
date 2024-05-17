<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>마이 페이지 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>
		
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/updateMember.css">
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
			function changeMpassword() {
				// 비밀번호 입력 양식의 데이터 검사
  				var totalResult = true;

  				//Password 검사하기
				var mpasswordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[!@#$%^&*?_])(?=.*[A-Z]).{10,15}$/;
				var mpasswordResult = mpasswordPattern.test($("#pwcheck1").val());
				if(mpasswordResult) {
					$("#mpasswordSpan1").removeClass("text-danger");
					$("#mpasswordSpan1").html("");
				} else {
					$("#mpasswordSpan1").addClass("text-danger");
					$("#mpasswordSpan1").html("알파벳 대소문자, 숫자, 특수문자를 혼용해서 10자 이상 15자 이하로 작성해주세요.");
					totalResult = false;
				}
				
				//Password 확인
				if($('#pwcheck1').val() == $('#pwcheck2').val()) {
				   $("#mpasswordSpan2").removeClass("text-danger");
				   $("#mpasswordSpan2").html("");
				} else {
					$("#mpasswordSpan2").html("비밀번호가 일치하지 않습니다.");
 		            $("#mpasswordSpan2").addClass("text-danger");
 		            totalResult = false;
				}
				
				if (totalResult) {
					var chpw = $("#pwcheck1").val();
					$('#changePasswordModal').modal('hide');
					$("#changedMpassword").val(chpw);
				} 
				 
			}
			
			function changeMphone() {
				// 전화번호 입력 양식의 데이터 검사
  				var totalResult = true;
  				
				var mphonePattern = /^(010|011)\d{3,4}\d{4}$/;
				var mphoneResult = mphonePattern.test($("#phoneCheck").val());
				
				if(mphoneResult) {
				   $("#mphoneSpan").removeClass("text-danger");
				   $("#mphoneSpan").html("");
				} else {
				$("#mphoneSpan").html("전화번호 형식이 아닙니다.");
				   $("#mphoneSpan").addClass("text-danger");
				   totalResult = false;
				}
				
				if (totalResult) {
					$('#changePhoneModal').modal('hide');
					$("#changedMphone").val($("#phoneCheck").val());
					$("#orgMphone").val($("#phoneCheck").val());
				}
				
			}
		</script>
		
	</head>
	
	<body>
		<!-- 네비게이션 바  ------------------------------------------------------------------------>
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>
		
		<div class="container wrap" style="width:100%; height: 100%; padding-top:100px; padding-bottom: 300px;">
			<div class="d-flex">
				<div id="my_box"  style="width:24%; height: 80%; padding: 0px 30px;">
					<h2 style="padding-bottom: 60px; width:15rem;"><a href="mypage" style="text-decoration-line: none; color:black;"><b>마이페이지</b></a></h2>
					
					<ul class="my_menu">
						<li id="menu1" style="height: 20%;">  
							<a class="menu_depth01" href="#">나의 쇼핑 정보</a>
							<ul class="menu_depth02">
								<li id="order"><a href="orderList">주문 내역</a></li>
								<li id="claim"><a href="orderListClaim">교환/반품/취소 내역</a></li>
							</ul>
						</li>
						<li id="menu2" style="height: 20%; ">
							<a class="menu_depth01" href="#">나의 참여 내역</a>
							<ul class="menu_depth02">
								<li id="inquiry"><a href="myInquiryList">1:1 문의</a></li>
								<li id="inquiryItem"><a href="myQnaList">상품 Q&A</a></li>
								<li id="review"><a href="myGoodsReviewList" >상품 리뷰</a></li>
							</ul>
						</li>
						<li id="menu3" style="height: 20%;">
							<a class="menu_depth01" href="#">나의 정보 관리</a>
							<ul class="menu_depth02">
								<li id="update"><a href="pwdConfirm">회원 정보 수정</a></li>
							</ul>
						</li>
					</ul>
					<div class="cs_area">
						<div class="tit_area">
							<a href="tel:010-2232-3823" class="cs_number">010-2232-3823</a>
							<span class="txt_l">(유료)</span>
						</div>
						<p class="txt_time">평일 09:00 ~ 18:00 (토/일/공휴일 휴무)</p>
						<p class="txt_break">(Break time 12:00 ~ 13:00)</p>
						<div class="ico_list">
							<a href="mailto:tjdwns3823@naver.com" class="ico_cs02">
								<img src="${pageContext.request.contextPath}/resources/image/icon/mail.png" 
								alt="Clickable Image"
								style="width: 40px; height: 40px; margin-right: 10px;"/>
								<span>tjdwns3823@naver.com 메일</span>
							</a>
							<a href="csInquiry" class="ico_cs03">
								<img src="${pageContext.request.contextPath}/resources/image/icon/1on1.png" 
								alt="Clickable Image"
								style="width: 40px; height: 40px; margin-right: 10px;"/>
								<span>문의하기</span>
							</a>
						</div>
					</div>
				</div>
				
				<div class="content">
					<form action="fixNewMemberInfo" method="post" id="updateForm">
					    <div class="tit_area line_thick">
							<strong class="tit_lv2">회원정보 수정</strong> 
						</div>
					    
						<div class="section_block1">
							<div class="tit_area">
								<strong>회원 정보</strong>
							</div>
							<div class="form_table">
								<div class="tr">
									<div class="th">
										<p class="form_label">이름</p>
									</div>
									<div class="td">
										<div class="input_clear sm">
											<input type="text" id="masName" placeholder="${member.mname}" readonly>
										</div>
									</div>
								</div>
								<div class="tr">
									<div class="th">
										<p class="form_label">아이디</p>
									</div>
									<div class="td">
										<div class="input_clear sm">
											<input type="text" id="masId" placeholder="${member.mid}" readonly>
										</div>
									</div>
								</div>
								<div class="tr">
									<div class="th">
										<p class="form_label">비밀번호</p>
									</div>
									<div class="td">
										<button id="modalOpenButton1" class="secession_btn btn white" type="button" data-bs-toggle="modal" data-bs-target="#changePasswordModal">비밀번호 변경</button>
										<input type="hidden" id="changedMpassword" name="mpassword" value="${member.mpassword}">
									</div>
								</div>
								<div class="tr">
									<div class="th">
										<p class="form_label">휴대폰 번호</p>
									</div>
									<div class="td">
										<div class="form_set">
											<div class="input_clear sm">
												<input type="text" id="orgMphone"  placeholder="${member.mphone}" readonly>
												<input type="hidden" id="changedMphone" name="mphone" value="${member.mphone}">
											</div>
											<button id="modalOpenButton2" class="secession_btn btn white" type="button" data-bs-toggle="modal" data-bs-target="#changePhoneModal" style="margin-left: 10px;">휴대폰 번호 변경</button>
										</div>
									</div>
								</div>
								<div class="tr">
									<div class="th">
										<p class="form_label">이메일</p>
									</div>
									<div class="td">
										<div class="input_clear">
											<input type="text" 
											readonly="readonly" 
											title="이메일 주소 입력" 
											name="mbr.mbrEmail" 
											id="mbrEmail" 
											value="${member.memail}" 
											placeholder="이메일 주소 입력">
											<button type="button" class="clear_btn"><span class="blind">삭제</span></button>
											<p class="err_txt" id="descMbrEmail"></p>
										</div>
									</div>
								</div>
								<div class="container btncont">
									<button id="modalOpenButton3" class="secession_btn" type="button" data-bs-toggle="modal" data-bs-target="#removeMemberModal">회원탈퇴</button>
								</div>
							</div>
						</div>
						<div class="btn_big_wrap btn_size_fix mt60">
							<button type="button" onclick="location.href='mypage'" class="white btn_cancle">취소</button>
							<button type="submit" class="btn_submit">완료</button>
						</div>
					</form>
					<!-- 회원 탈퇴 모달 -->
					<div class="modal" id="removeMemberModal">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h4 class="modal-title">탈퇴 주의사항</h4>
					        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					      </div>
					      <div class="modal-body">
					        <p>회원 탈퇴는 영구적이며, 탈퇴 후에는 계정이 복구되지 않습니다. <br/> 정말 탈퇴하시겠어요?</p>
					      </div>
					      <div class="modal-footer">
					        <button type="button" id="modalCloseButton" data-bs-dismiss="modal">취소</button>
							<form action="removeMember" method="post">
							    <button type="submit" id="modalSubmitButton">확인</button>
							</form>
					      </div>
					    </div>
					  </div>
					</div>
					<!-- 비밀번호 변경 모달 -->
					<div class="modal" id="changePasswordModal">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h4 class="modal-title">비밀번호 변경</h4>
					        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					      </div>
					      <div class="modal-body">
					        <p>새로운 비밀번호를 입력해주세요.</p>
					      </div>
					      <input id="pwcheck1" value="" type="password" placeholder="알파벳 대소문자, 숫자, 특수문자를 혼용해서 10자 이상 15자 이하"></input>
					      <span id="mpasswordSpan1"></span>
					      <input id="pwcheck2" value="" type="password" placeholder="한 번 더 입력해주세요."></input>
					      <span id="mpasswordSpan2"></span>
					      <div class="modal-footer">
					        <button type="button" id="modalCloseButton" data-bs-dismiss="modal">취소</button>
							<button type="button" id="changePasswordButton" onclick="changeMpassword()">확인</button>
					      </div>
					    </div>
					  </div>
					</div>
					<!-- 전화번호 변경 모달 -->
					<div class="modal" id="changePhoneModal">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h4 class="modal-title">전화번호 변경</h4>
					        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					      </div>
					      <div class="modal-body">
					        <p>새로운 전화번호를 입력해주세요.</p>
					      </div>
					      <input id="phoneCheck" type="text" value="" placeholder="'-' 없이 입력해주세요."></input>
					      <span id="mphoneSpan"></span>	
					      <div class="modal-footer">
					        <button type="button" id="modalCloseButton" data-bs-dismiss="modal">취소</button>
							<button type="button" id="changePhoneButton" onclick="changeMphone()">확인</button>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>