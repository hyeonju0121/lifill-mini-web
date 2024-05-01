<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 메인페이지 - 라이필</title>

<!-- Bootstrap 5를 위한 외부 라이브러리 설정-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery 외부 라이브러리 설정 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<!-- lineicons 외부 라이브러리 설정 -->
<link href="https://cdn.lineicons.com/4.0/lineicons.css"
	rel="stylesheet" />

<!-- external css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/board/writeNotice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/sidebar.css">
</head>

<body>
	<div class="wrapper">
		<!-- sidebar -->
		<jsp:include page="/WEB-INF/views/admin/common/admin_sidebar.jsp" />

		<!-- contents -->
		<div class="main p-3">
			<div class="item-section mt-2 mb-2" style="font-size: 12px">
				게시판 관리 > 자주묻는질문 등록
			</div>

			<div class="headingArea">
				<div class="title">
					<h1 id="itemTitle">자주묻는질문 등록</h1>
				</div>
			</div>
			<div class="form_table no_line">
				<form name="gForm" id="gForm" method="post" enctype="multipart/form-data">
					<div class="tr">
						<div class="th">
							<p class="form_label required">분류 </p>
						</div>
						<div class="td">				
							<div class="dropdown">
								<button type="button" class="btn btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown">
									일반
								</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item active">일반</a></li>
									<li><a class="dropdown-item">상품</a></li>
									<li><a class="dropdown-item">배송</a></li>
								</ul>
							</div>
						</div>
					</div>
							
					<div class="tr">
						<div class="th">
							<p class="form_label required">게시글 제목</p>
						</div>
						<div class="td">
							<div class="textarea_group sm">
								<textarea id="inqSj" name="csoMtmInq.inqSj" title="게시글 제목 입력" placeholder="게시글 제목을 입력해주세요." maxlength="100" onpaste="checkCnt(this)" onchange="checkCnt(this)" onkeydown="checkCnt(this)" onkeyup="checkCnt(this)" cols="" rows=""></textarea>
								<p class="form_bytes"><span class="byte">0</span>/100</p>
							</div>
						</div>
					</div>
					<div class="tr">
						<div class="th">
							<p class="form_label required">게시글 내용</p>
						</div>
						<div class="td">
							<div class="textarea_group lg">
								<textarea id="inqCont" name="csoMtmInq.inqCont" placeholder="게시글 내용을 입력해주세요." cols="" rows="" title="게시글 내용 입력" maxlength="1000" onpaste="checkCnt(this)" onchange="checkCnt(this)" onkeydown="checkCnt(this)" onkeyup="checkCnt(this)"></textarea>
								<p class="form_bytes"><span class="byte">0</span>/1,000</p>
							</div>
							<!--파일첨부-->	
							<div class="attach_wrap">
								<div class="attach_top">
									<input type="hidden" name="uploadType" value="inquiry">
									<label class="attach_img" for="inputFile_1">사진 첨부</label>
									<p class="guide_txt">최대 2개 / 개당 10MB까지 첨부 가능합니다. (JPG, JPEG, PNG, GIF만 첨부 가능)</p>
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
			<div class="btn_big_wrap btn_size_fix">
				<button type="button" class="white" onclick="location.href='noticeList'">취소</button>
				<button type="button" class="btnInsert" onclick="location.href='noticeList'">등록</button>
			</div>
		</div>
	</div>
		<script src="${pageContext.request.contextPath}/resources/js/admin_sidebar.js"></script>
</body>
</html>