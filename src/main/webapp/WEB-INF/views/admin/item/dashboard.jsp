<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" >
		<title>관리자 메인페이지 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정-->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- jQuery 외부 라이브러리 설정 -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		<!-- lineicons 외부 라이브러리 설정 -->
		<link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
		
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/item/dashboard.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/sidebar.css">
	</head>
	
	<body>
		<div class="wrapper">
			<!-- sidebar -->
			<jsp:include page="/WEB-INF/views/admin/common/admin_sidebar.jsp"/>

			<!-- contents -->
			<div class="main p-3">
				<div class="item-section mt-2 mb-2" style="font-size: 12px">
				상품 관리 > 대시보드 
				</div>
			
				<div class="headingArea">
					<div class="title">
						<h1 id="itemTitle">상품 대시보드</h1>
					</div>
				</div>
				
				<div class="section_block">
					<div class="sub">
						<div class="col-sm-8 bg-dark">
							<h5 class="subheading ms-4 mt-2">상품 현황</h5>
						</div>
						
					</div>
					<div class="status_block d-flex">
						<div class="col-sm-2 info bg-light">
							<h6 class="tit">전체등록 상품</h6>
							<span class="count">21</span>
						</div>
						<div class="col-sm-2 info bg-light">
							<h6 class="tit">판매중 상품</h6>
							<span class="count">21</span>
						</div>
						<div class="col-sm-2 info bg-light">
							<h6 class="tit">품절 상품</h6>
							<span class="count">0</span>
						</div>
						<div class="col-sm-2 info bg-light">
							<h6 class="tit">삭제 상품</h6>
							<span class="count">2</span>
						</div>
					</div>
				</div>
				
				
				<div class="desc_block mt-4">
					<h5 class="desc">
						- 라이필에 등록된 전체상품, 판매중인 상품, 품절 상품을 확인할 수 있습니다.
					</h5>
					<h5 class="desc">
						- 건수를 클릭하면 해당하는 상품 리스트가 조회됩니다.
					</h5>
				</div>
				
				<div class="section_block mt-5">
					<div class="sub">
						<div class="col-sm-8 bg-dark">
							<h5 class="subheading ms-4 mt-2">카테고리별 상품 현황</h5>
						</div>
						
					</div>
					<div class="status_block d-flex">
						<div class="col-sm-2 info bg-light">
							<h6 class="tit">전체등록 상품</h6>
							<span class="count">21</span>
						</div>
						<div class="col-sm-2 info bg-light">
							<h6 class="tit">판매중 상품</h6>
							<span class="count">21</span>
						</div>
						<div class="col-sm-2 info bg-light">
							<h6 class="tit">품절 상품</h6>
							<span class="count">0</span>
						</div>
						<div class="col-sm-2 info bg-light">
							<h6 class="tit">삭제 상품</h6>
							<span class="count">2</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script src="${pageContext.request.contextPath}/resources/js/admin_sidebar.js"></script>
	</body>
</html>