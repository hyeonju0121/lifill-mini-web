<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" >
		<title>관리자 메인페이지 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>
		
		<!-- lineicons 외부 라이브러리 설정 -->
		<link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
		
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/board/detailNotice.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/sidebar.css">
	</head>
	
	<body>
		<div class="wrapper">
			<!-- sidebar -->
			<jsp:include page="/WEB-INF/views/admin/common/admin_sidebar.jsp"/>

			<!-- contents -->
			<div class="main p-3">
				<div class="item-section mt-2 mb-2" style="font-size: 12px">
				 게시판 관리 > 공지사항 관리
				</div>
				
				<div class="headingArea">
					<div class="title">
						<h1 id="itemTitle">공지사항 조회</h1>
					</div>
				</div>
				
				<div class="content_block">
					<div class="news">
						<table class="view">
						    <colgroup>
						        <col>
						        <col style="width: 270px">
						    </colgroup>
						    <thead>
						      <tr>
						         <th><span>[${board.btype}]</span> ${board.btitle}</th>
						         <th>${board.bcreatedat}</th>
						      </tr>
						      <tr>
						         <th>
						         	<div class="th-sub">
						         		<span>작성자:</span>${board.mid} (ADMIN)
						         	</div>
						         </th>
						         <th></th>
						      </tr>
						    </thead>
						    <tbody>
						      <tr>
						         <td colspan="2">
						         	<p>내용: ${board.bcontent}</p>
						         	
						         	<c:if test="${board.battachoname != null}">
							      		<div class="mb-2">
								      		<p>첨부파일: <a href="attachDownload?bno=${board.bno}">${board.battachoname}</a></p>
								      		<img src="attachDownload?bno=${board.bno}" width="300"/>
							      		</div>
						      		</c:if>
						         
						            <!-- <p><span>안녕하세요.&nbsp;</span></p>
						            <p><span>라이필을 이용해주시는 고객님께 깊이 감사드립니다.&nbsp;&nbsp;</span></p>
						            <p><span>&nbsp;</span></p>
						            <p><span>라이필의 안정적인 서비스를 제공하기 위하여 시스템 점검을 진행합니다.</span></p>
						            <p><span>&nbsp;</span></p>
						            <p><span>- 점검일시 : 2024-3-23(토) 03:00 ~ 06:00</span></p>
						            <p><span>- 점검내용 : 서비스 점검&nbsp;&nbsp;</span></p>
						            <p><span>- 중단서비스 : 사이트 (PC/Mobile) 접속 불가&nbsp; &nbsp;</span></p>
						            <p><span>&nbsp;</span></p>
						            <p><span>점검 시간에는 사이트 접속이 중단되오니, W컨셉을 이용하는 고객님의 많은 양해를 부탁 드립니다.</span></p>
						            <p><span>&nbsp;</span></p>
						            <p><span>감사합니다.</span></p> -->
						         </td>
						      </tr>
						    </tbody>
						</table>
					    <!-- btn  -->
					    <div class="btn_big_wrap btn_size_fix mt60">
							<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/board/noticeList'"
								 class="white btn_list">목록</button>
							<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/board/updateNoticeForm?bno=${board.bno}'"
								 class="btn_update">수정</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script src="${pageContext.request.contextPath}/resources/js/admin_sidebar.js"></script>
	</body>
</html>