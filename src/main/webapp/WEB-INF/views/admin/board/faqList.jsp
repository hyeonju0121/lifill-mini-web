<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/board/faqList.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/sidebar.css">
	</head>
	
	<body>
		<div class="wrapper">
			<!-- sidebar -->
			<jsp:include page="/WEB-INF/views/admin/common/admin_sidebar.jsp"/>

			<!-- contents -->
			<div class="main p-3">
				<div class="item-section mt-2 mb-2" style="font-size: 12px">
				 게시판 관리 > 자주묻는질문 관리
				</div>
			
				<div class="headingArea">
					<div class="title">
						<h1 id="itemTitle">전체 자주묻는질문 목록</h1>
					</div>
				</div>
				
				<div class="section_block">
					<div class="sub bg-light">
						<button type="button" class="btn btn-outline-dark createNotice-btn mt-3 me-2" onclick="location.href='${pageContext.request.contextPath}/admin/board/writeFaq'">자주묻는질문 등록</button>
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
					      <tr>
					        <td>1</td>
					        <td>배송</td>
					        <td>
					        	<a href="${pageContext.request.contextPath}/admin/board/noticeList/1">
					        		배송 조회는 어떻게 하나요?
					        	</a>
					        </td>
					        <td>(관리자) hyeonju0121</td>
					        <td>2024-04-22 09:28</td>
					        <td>
					        	<div class="btn_big_wrap">
									<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/member/memberUpdate'" class="btn btn-outline-dark">수정</button>
									<button type="button" onclick="location.href='#'" class="btn btn-outline-dark">삭제</button>
								</div>
					        </td>
					      </tr>
					      <tr>
					        <td>2</td>
					        <td>회원정보</td>
					        <td>
					        	<a href="${pageContext.request.contextPath}/admin/board/noticeList/1">
					        		회원정보 변경은 어떻게 하나요?
					        	</a>
					        </td>
					        <td>(관리자) hyeonju0121</td>
					        <td>2024-04-22 13:15</td>
					        <td>
					        	<div class="btn_big_wrap">
									<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/member/memberUpdate'" class="btn btn-outline-dark">수정</button>
									<button type="button" onclick="location.href='#'" class="btn btn-outline-dark">삭제</button>
								</div>
					        </td>
					      </tr>
					      
					      <tr>
					        <td>3</td>
					        <td>교환/반품</td>
					        <td>
					        	<a href="${pageContext.request.contextPath}/admin/board/noticeList/1">
					        		결제 취소는 어떻게 하나요?
					        	</a>
					        </td>
					        <td>(관리자) hyeonju0121</td>
					        <td>2024-04-22 13:18</td>
					        <td>
					        	<div class="btn_big_wrap">
									<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/member/memberUpdate'" class="btn btn-outline-dark">수정</button>
									<button type="button" onclick="location.href='#'" class="btn btn-outline-dark">삭제</button>
								</div>
					        </td>
					      </tr>
					      
					      <tr>
					        <td>4</td>
					        <td>회원정보</td>
					        <td>
					        	<a href="${pageContext.request.contextPath}/admin/board/noticeList/1">
					        		비밀번호가 생각나지 않아요?
					        	</a>
					        </td>
					        <td>(관리자) hyeonju0121</td>
					        <td>2024-04-30 15:06</td>
					        <td>
					        	<div class="btn_big_wrap">
									<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/member/memberUpdate'" class="btn btn-outline-dark">수정</button>
									<button type="button" onclick="location.href='#'" class="btn btn-outline-dark">삭제</button>
								</div>
					        </td>
					      </tr>
					      
					      
					    </tbody>
					  </table>
					</div>
				</div>
				
				<ul class="pagination justify-content-center">
				    <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
				    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
				    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
				    <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
				    <li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>
				    <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
				  </ul>

			</div>
			
		</div>
		
		<script src="${pageContext.request.contextPath}/resources/js/admin_sidebar.js"></script>
	</body>
</html>