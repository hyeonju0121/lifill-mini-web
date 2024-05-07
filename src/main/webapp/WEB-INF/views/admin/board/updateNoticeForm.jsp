<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 메인페이지 - 라이필</title>

		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>
		
		<!-- lineicons 외부 라이브러리 설정 -->
		<link href="https://cdn.lineicons.com/4.0/lineicons.css"
			rel="stylesheet" />
		
		<!-- external css -->
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/admin/board/updateNotice.css">
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
				게시판 관리 > 공지사항 수정
			</div>

			<div class="headingArea">
				<div class="title">
					<h1 id="itemTitle">공지사항 수정</h1>
				</div>
			</div>
			<div class="form_table no_line">
				<form name="updateNoticeForm" id="updateNoticeForm" method="post" 
					action="updateNotice" enctype="multipart/form-data">
					<div class="tr">
						<input type="hidden" id="bno" name="bno" value="${board.bno}">
						<input type="hidden" id="btype" name="btype" value="${board.btype}">
						<div class="th">
							<p class="form_label required">분류 </p>
						</div>
						<div class="td">	
							<select name="bsubcategory" id="bsubcategory">
								<option value="general" <c:if test="${board.bsubcategory eq '일반'}">selected</c:if>>일반</option>
								<option value="product" <c:if test="${board.bsubcategory eq '상품'}">selected</c:if>>상품</option>
								<option value="delivery" <c:if test="${board.bsubcategory eq '배송'}">selected</c:if>>배송</option>
							</select>	
						</div>
					</div>
							
					<div class="tr">
						<div class="th">
							<p class="form_label required">게시글 제목</p>
						</div>
						<div class="td">
							<div class="textarea_group_title sm">
								<textarea id="btitle" name="btitle" maxlength="100"> ${board.btitle}</textarea>
								<p class="form_bytes"><span class="byte">0</span>/100</p>
							</div>
						</div>
					</div>
					<div class="tr">
						<div class="th">
							<p class="form_label required">게시글 내용</p>
						</div>
						<div class="td">
							<div class="textarea_group_content lg">
								<textarea id="bcontent" name="bcontent" maxlength="1000">${board.bcontent}</textarea>
								<p class="form_bytes"><span class="byte">0</span>/1,000</p>
							</div>
							 <div class="attach_wrap">
								<div class="attach_top">
									<input type="hidden" name="uploadType" value="notice">
									<label class="attach_img" for="battach">사진 첨부</label>
									<p class="guide_txt">파일 1개당 10MB까지 첨부 가능합니다. (JPG, JPEG, PNG, GIF만 첨부 가능)</p>
									<input class="input_file" id="battach" name="battach" type="file">
									<c:if test="${board.battachoname != null}">
						         		<img src="attachDownload?bno=${board.bno}" width="150px"/>
						         	</c:if>
								</div>
								<div class="attached" data-file="battach" id="inputUploadFile"></div>
							</div> 
							
						</div>
					</div>
					
					<!-- btn  -->
					<div class="btn_big_wrap btn_size_fix mt60">
						<button type="button" onclick="location.href='noticeList'" class="white btn_list">목록</button>
						<button type="submit" class="btn_update">수정</button>
					</div>
				</form>	
			</div>
		</div>
	</div>
		<script src="${pageContext.request.contextPath}/resources/js/admin_sidebar.js"></script>
</body>
</html>