<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>마이 페이지 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/csInquiry.css">
		
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
								<li id="update"><a href="updateMember">회원 정보 수정</a></li>
							</ul>
						</li>
					</ul>
					<div class="cs_area">
						<div class="tit_area">
							<a href="tel:1661-8858" class="cs_number">1661-8858</a>
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
							<a onclick="goOneOnOneInquiry()" class="ico_cs03">
								<img src="${pageContext.request.contextPath}/resources/image/icon/1on1.png" 
								alt="Clickable Image"
								style="width: 40px; height: 40px; margin-right: 10px;"/>
								<span>문의하기</span>
							</a>
						</div>
					</div>
				</div>
				
				<div class="content">
					<div class="tit_area line_thick">
						<h2 class="tit_lv2">1:1 문의</h2>
					</div>
					
					<div class="section_block">
						<div class="form_table no_line">
						<form name="gForm" id="gForm" method="post" enctype="multipart/form-data">
							<input type="hidden" name="type" value="insert">
							<input type="hidden" name="srchMtmInqSn" value="">
							<input type="hidden" name="mbrId" value="tjdwns556">
							<input type="hidden" name="mbrNm" value="변성준">
							<input type="hidden" id="statusCd" value="">
							<input type="hidden" id="fileCnt" value="">
							<input type="hidden" id="selOrdGodYn" value="">
							<input type="hidden" id="inqTp" name="csoMtmInq.inqTpCd" value="">
							<input type="hidden" id="inqTpSel" name="sel_name" data-value="select" value="">
							<div class="tr">
								<div class="th">
									<p class="form_label required">문의 유형 </p>
								</div>
								<div class="td">
									<div class="custom_select_wrap lg">
										
										<button type="button" class="option_selected" data-value="" onclick="changeInqTpCd(this);">문의 유형을 선택하세요. (필수)</button><!-- [D] : 활성상태 .is_active 추가 -->
											<ul class="option_list"><!-- [D] : 활성상태 .is_active 추가 -->
												<li><button type="button" class="option" data-value="" onclick="changeInqTpCd(this);">문의 유형을 선택하세요. (필수)</button></li>
											<li><button type="button" class="option" data-value="CSO_RTGOD" onclick="changeInqTpCd(this);">반품</button></li>
											<li><button type="button" class="option" data-value="CSO_EXCHG" onclick="changeInqTpCd(this);">교환</button></li>
											<li><button type="button" class="option" data-value="CSO_UDT_CNCL" onclick="changeInqTpCd(this);">수정/취소</button></li>
											<li><button type="button" class="option" data-value="CSO_DLV" onclick="changeInqTpCd(this);">배송</button></li>
											<li><button type="button" class="option" data-value="CSO_GOD_INQ" onclick="changeInqTpCd(this);">상품문의</button></li>
											<li><button type="button" class="option" data-value="CSO_MBR_BNEF" onclick="changeInqTpCd(this);">회원혜택(이벤트/포인트)</button></li>
											<li><button type="button" class="option" data-value="CSO_MBR_INFO" onclick="changeInqTpCd(this);">회원정보</button></li>
											<li><button type="button" class="option" data-value="CSO_ORD_PAY" onclick="changeInqTpCd(this);">주문/결제</button></li>
											<li><button type="button" class="option" data-value="CSO_AS" onclick="changeInqTpCd(this);">A/S</button></li>
											<li><button type="button" class="option" data-value="CSO_PNT_CPN" onclick="changeInqTpCd(this);">포인트/쿠폰</button></li>
											<li><button type="button" class="option" data-value="CSO_MOBILE_APP" onclick="changeInqTpCd(this);">모바일/App</button></li>
											<li><button type="button" class="option" data-value="CSO_RFD" onclick="changeInqTpCd(this);">환불</button></li>
											<li><button type="button" class="option" data-value="CSO_ETC" onclick="changeInqTpCd(this);">기타</button></li>
											</ul>
									</div>
								</div>
							</div>
							<div class="tr" id="tr_ordGod" style="display: none;">
								<div class="th">
									<p class="form_label required">문의 상품</p>
								</div>
								<div class="td">
									<button type="button" class="btn white" onclick="ordInfoSrch(this);">주문정보 조회</button>
								</div>
							</div>
							<div class="tr" id="noSelOrdDiv" style="display: none;">
								<div class="th">
									<p class="form_label required">문의 상품</p>
								</div>
								<div class="td">
									<div class="form_set">
										<p class="form_result_box">주문상품 선택 안함</p>
										<button type="button" class="btn white" onclick="ordInfoSrch(this);">주문정보 조회</button>
									</div>
								</div>
							</div>
							<div class="tr" id="td_ordGod" style="display: none;">
							</div>
							
							<div class="tr">
								<div class="th">
									<p class="form_label required">문의 제목</p>
								</div>
								<div class="td">
									<div class="textarea_group sm">
										<textarea id="inqSj" name="csoMtmInq.inqSj" title="문의제목 입력" placeholder="문의 제목을 입력해주세요." maxlength="100" onpaste="checkCnt(this)" onchange="checkCnt(this)" onkeydown="checkCnt(this)" onkeyup="checkCnt(this)" cols="" rows=""></textarea>
										<p class="form_bytes"><span class="byte">0</span>/100</p>
									</div>
								</div>
							</div>
							<div class="tr">
								<div class="th">
									<p class="form_label required">문의 내용</p>
								</div>
								<div class="td">
									<div class="textarea_group lg">
										<textarea id="inqCont" name="csoMtmInq.inqCont" placeholder="문의 내용을 입력해주세요." cols="" rows="" title="문의내용 입력" maxlength="1000" onpaste="checkCnt(this)" onchange="checkCnt(this)" onkeydown="checkCnt(this)" onkeyup="checkCnt(this)"></textarea>
										<p class="form_bytes"><span class="byte">0</span>/1,000</p>
									</div>
									<!--파일첨부-->	
									<div class="attach_wrap">
										<div class="attach_top">
											<input type="hidden" name="uploadType" value="inquiry">
											<label class="attach_img" for="inputFile_1">사진 첨부</label>
											<p class="guide_txt">최대 5개 / 개당 10MB까지 첨부 가능합니다. (JPG, JPEG, PNG, GIF만 첨부 가능)</p>
											<input class="input_file" id="inputFile_1" name="file" onchange="checkFileSizeAjax(event,this);" type="file" accept="image/*" multiple="">
										</div>
										<!-- [D] 파일 첨부 버튼 아이디와 data-file attribute 이름 맞춰줌 -->
										<div class="attached" data-file="inputFile_1" id="inputUploadFile"></div>
									</div>
									<!--//파일첨부-->	
								</div>
							</div>
						</form>
						</div>
						
						<ul class="list_type1 type2 mt30">
							<li>정확한 답변 수신을 위해 문의 전에 회원정보를 업데이트해주세요. (My Page &gt; 회원정보 &gt; 회원정보 수정)</li>
							<li>등록하신 문의 답변이 완료된 경우 재문의가 불가 하오니 서비스 
								이용에 참고 부탁드립니다.</li>
						</ul>
					</div>
					
					<div class="btn_big_wrap btn_size_fix">
						<button type="button" class="white" onclick="cancelCsInquiry();">취소</button>
						<button type="button" class="btnInsert" onclick="insertCsInquiry();" disabled="">등록</button>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>