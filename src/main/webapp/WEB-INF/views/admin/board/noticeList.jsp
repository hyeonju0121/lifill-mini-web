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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/board/noticeList.css">
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
						<h1 id="itemTitle">전체 공지사항 목록</h1>
					</div>
				</div>
				
				<div class="section_block">
					<div class="sub bg-light">
						<button type="button" class="btn btn-outline-dark createNotice-btn mt-3 me-2" onclick="location.href='${pageContext.request.contextPath}/admin/board/writeNoticeForm'">공지사항 등록</button>
					</div>
				
					<div class="container mt-3">
					  <!-- <h2>전체 상품 목록</h2> -->
					  <table class="table">
					    <thead class="table-dark">
					      <tr>
					        <th>No</th>
					        <th>분류</th>
					        <th>게시판 제목</th>
					        <th>작성자</th>
					        <th>작성일</th>
					        <th>게시물관리</th>
					      </tr>
					    </thead>
					    <tbody>
					     <c:forEach var="board" items="${noticeList}">
					     	<tr>
						      <td>${board.bno}</td>
						      <td>${board.btype}</td>
						      <td><a href="${pageContext.request.contextPath}/admin/board/detailNotice?bno=${board.bno}">${board.btitle}</a></td>
						      <td>${board.mid}</td>
						      <td><fmt:formatDate value="${board.bcreatedat}" pattern="yyyy-MM-dd"/></td>
						      <td>
						      	<div class="btn_big_wrap">
									<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/member/memberUpdate'" class="btn btn-outline-dark">수정</button>
									<button type="button" onclick="location.href='#'" class="btn btn-outline-dark">삭제</button>
								</div>
						      </td>
						    </tr>
					     </c:forEach>
					    </tbody>
					    
					  <tr>
					  	<td colspan="9" class="text-center">
					  		<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link" href="noticeList?pageNo=1">처음</a></li>
								<c:if test="${pager.groupNo>1}">
				                     <li class="page-item"><a class="page-link" href="noticeList?pageNo=${pager.startPageNo-1}">이전</a></li>
				                </c:if>
				                
				                <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
				                     <c:if test="${pager.pageNo != i}">
				                        <li class="page-item"><a class="page-link" href="noticeList?pageNo=${i}">${i}</a></li>
				                     </c:if>
				                     <!-- 현재 페이지가 i 쪽이면, 강조된 모양 (danger)으로 다르게 표시  -->
				                     <c:if test="${pager.pageNo == i}">
				                        <li class="page-item"><a class="page-link" href="noticeList?pageNo=${i}">${i}</a></li>
				                     </c:if>
				                </c:forEach>
				                
				                <c:if test="${pager.groupNo<pager.totalGroupNo}">
				                     <li class="page-item"><a class="page-link" href="noticeList?pageNo=${pager.endPageNo+1}">다음</a></li>
				                  </c:if>
				                 <li class="page-item"><a class="page-link" href="noticeList?pageNo=${pager.totalPageNo}">맨끝</a></li>
						    </ul>
					  	  </td>
				       </tr>  
					  </table>
					</div>
				</div>
				<!-- 
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="javascript:void(0);">처음</a></li>
				    <li class="page-item"><a class="page-link" href="javascript:void(0);">이전</a></li>
				    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
				    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
				    <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
				    <li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>
				    <li class="page-item"><a class="page-link" href="javascript:void(0);">다음</a></li>
				  	<li class="page-item"><a class="page-link" href="javascript:void(0);">맨끝</a></li>
				  </ul> -->
			</div>
		</div>
		
		<script src="${pageContext.request.contextPath}/resources/js/admin_sidebar.js"></script>
	</body>
</html>