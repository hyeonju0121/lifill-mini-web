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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/board/inquiryList.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/sidebar.css">
	</head>
	
	<body>
		<div class="wrapper">
			<!-- sidebar -->
			<jsp:include page="/WEB-INF/views/admin/common/admin_sidebar.jsp"/>

			<!-- contents -->
			<div class="main p-3">
				<div class="item-section mt-2 mb-2" style="font-size: 12px">
				고객센터 관리 > 1:1 문의
				</div>
			
				<div class="headingArea">
					<div class="title">
						<h1 id="itemTitle">전체 1:1 문의 목록</h1>
					</div>
				</div>
				
				<div class="section_block">
					<div class="sub bg-light">
						<div class="sub2 col-sm-8 mt-2">
							<ul>
								<li class="sub-li">전체 <span class="itemTotalCount">6</span>건 |</li>
								<li class="sub-li">답변 대기 <span class="itemTotalCount">2</span>건 |</li>
								<li class="sub-li">답변 완료<span class="itemTotalCount">4</span>건 |</li>
							</ul>
						</div>
					</div>
					
					<div class="container mt-3">
					  <!-- <h2>전체 상품 목록</h2> -->
					  <table class="table">
					    <thead class="table-dark">
					      <tr>
					        <th>No</th>
					        <th>분류</th>
					        <th>상품코드</th>
					        <th>문의 제목</th>
					        <th>작성자</th>
					        <th>작성일</th>
					        <th>문의상태</th>
					        <th>문의관리</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr>
					        <td>1</td>
					        <td>섭취방법</td>
					        <td>
					        	<div class="img_box d-flex">
									<div id="itemImg">
										<img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye3_image1.png" 
											class="rounded-3" style="width:60px;height:60px;"/>
									</div>
									<div>
										<h6 class="ms-2">P00001</h6>
										<h6 class="ms-2">[effekt] 초임계 루테인아스타잔틴 코어</h6>
									</div>
								</div>
					        </td>
					        <td>
					        	<a href="${pageContext.request.contextPath}/admin/board/noticeList/1">
					        		루테인을 다른 영양제를 함께 먹어도 될까요?
					        	</a>
					        </td>
					        <td>hyeonju0121</td>
					        <td>2024-04-22 09:28</td>
					        <td>답변완료</td>
					        <td>
					        	<div class="btn_big_wrap">
									<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/member/memberUpdate'" class="btn btn-outline-dark">답변등록</button>
									<button type="button" onclick="location.href='#'" class="btn btn-outline-dark">삭제</button>
								</div>
					        </td>
					      </tr>
					      <tr>
					        <td>2</td>
					        <td>교환/반품</td>
					        <td>
					        	<div class="img_box d-flex">
									<div id="itemImg">
										<img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye3_image1.png" 
											class="rounded-3" style="width:60px;height:60px;"/>
									</div>
									<div>
										<h6 class="ms-2">P00001</h6>
										<h6 class="ms-2">[effekt] 초임계 루테인아스타잔틴 코어</h6>
									</div>
								</div>
					        </td>
					        <td>
					        	<a href="${pageContext.request.contextPath}/admin/board/noticeList/1">
					        		제품을 교환/반품하고 싶어요.
					        	</a>
					        </td>
					        <td>testuser1</td>
					        <td>2024-04-22 09:28</td>
					        <td>답변대기중</td>
					        <td>
					        	<div class="btn_big_wrap">
									<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/member/memberUpdate'" class="btn btn-outline-dark">답변등록</button>
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