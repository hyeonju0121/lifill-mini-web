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
					<form action="#" method="post" id="updateForm">
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
											<input type="text" id="masName" placeholder="변*준" readonly="">
										</div>
									</div>
								</div>
								<div class="tr">
									<div class="th">
										<p class="form_label">아이디</p>
									</div>
									<div class="td">
										<div class="input_clear sm">
											<input type="text" id="masId" placeholder="tjd******" readonly="">
										</div>
									</div>
								</div>
								<div class="tr">
									<div class="th">
										<p class="form_label">비밀번호</p>
									</div>
									<div class="td">
										<button type="button" onclick="" class="btn white">비밀번호 변경</button>
									</div>
								</div>
								<div class="tr">
									<div class="th">
										<p class="form_label">생년월일</p>
									</div>
									<div class="td">
										<div class="input_clear sm">
											<input type="text" id="masBrth" placeholder="199701**" readonly="">
										</div>
									</div>
								</div>
								<div class="tr">
									<div class="th">
										<p class="form_label">성별</p>
									</div>
									<div class="td">
										<div class="input_clear sm">
											<input type="text" value="남자" readonly="">
										</div>
									</div>
								</div>
								<div class="tr">
									<div class="th">
										<p class="form_label">휴대폰 번호</p>
									</div>
									<div class="td">
										<div class="form_set">
											<div class="input_clear sm">
												<input type="text" id="maskingMobilNo" placeholder="010-****-3823" readonly="">
											</div>
											<button type="button" 
											onclick="" 
											class="btn white" 
											style="margin-left: 10px;">휴대폰 번호 변경</button>
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
											value="tjd*******@*****.***" 
											placeholder="이메일 주소 입력">
											<button type="button" class="clear_btn"><span class="blind">삭제</span></button>
											<p class="err_txt" id="descMbrEmail"></p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="section_block2">
							<div class="tit_area">
								<strong>추가 정보</strong>
							</div>
							<div class="form_table">
								<div class="tr">
									<div class="th">
										<p class="form_label">프로필 사진</p>
									</div>
									<div class="td">
										<div class="profile_wrap white">
											<!-- [D] 파일첨부 기능 .profile_attach -->
											<div class="profile profile_attach">
												<input type="hidden" id="prflPhotoUrl" name="mbrPrfl.prflPhotoUrl" value="">
					                            <input type="hidden" id="beforePrflPhotoUrl" name="beforePrflPhotoUrl" value="">
												<a href="#" class="img_box">
				                                    <div id="defaultImg" style="">T</div>
												</a>
												<div class="profile_edit">
													<p class="tit">회원님을 알릴 수 있는 사진을 등록해주세요.<span class="sub">(파일형식 JPG, JPEG, PNG / 파일용량 3MB 이하)</span></p>
													
													<div class="button_set">
														<button type="button" onclick="" class="btn_sub_m gray_line">기본 이미지로 변경</button>
														<!-- [D] 파일첨부 기능 inputFile_1 -->
				                                        <input class="input_file" type="file" id="inputFileImage1-2" name="file" onchange="checkFileSizeAjax(event,this);" title="첨부파일 추가">
				                                        <label for="inputFileImage1-2" class="btn_sub_m gray_line">사진 변경</label>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<div class="tr">
									<div class="th">
										<p class="form_label">닉네임</p>
									</div>
									<div class="td">
										<div class="input_clear">
											<input type="text" placeholder="영문, 숫자, 영문+숫자+특수문자 조합 5자~20자" name="mbrPrfl.nknm" id="nknm" maxlength="20" value="">
											<button type="button" class="clear_btn"><span class="blind">삭제</span></button>
											<p class="err_txt" id="descNknm"></p>
										</div>
									</div>
								</div>
								
								<div class="tr">
									<div class="th">
										<p class="form_label align_top">배송지 관리</p>
									</div>
									<div class="td">
										<div class="has_address">
											<div class="no_data type6">등록된 배송지가 없습니다.</div>
	                                        <button type="button" onclick="" class="btn white mt20">배송지 관리</button>
										</div>
					                </div>
				                </div>
								<a href="#" class="secession_btn">회원탈퇴</a>
							</div>
						</div>
					</form>
					<div class="btn_big_wrap btn_size_fix mt60">
						<button type="button" onclick="location.href='mypage'" class="white btn_cancle">취소</button>
						<button type="button" onclick="location.href='#'" class="btn_submit">완료</button>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>