<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 메인페이지 - 라이필</title>

<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>

<!-- jQuery 외부 라이브러리  설정-->
<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>

<!-- lineicons 외부 라이브러리 설정 -->
<link href="https://cdn.lineicons.com/4.0/lineicons.css"
	rel="stylesheet" />

<!-- external css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/item/itemList.css">
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
			상품 관리 > 전체 상품 목록</div>

			<div class="headingArea">
				<div class="title">
					<h1 id="itemTitle">전체 상품 목록</h1>
				</div>
			</div>

			<div class="section_block">
				<div class="sub bg-light">
					<div class="sub2 col-sm-8 mt-2">
						<ul>
							<li class="sub-li">전체 <span class="itemTotalCount">21</span>건
								|
							</li>
							<li class="sub-li">판매함 <span class="itemTotalCount">20</span>건
								|
							</li>
							<li class="sub-li">판매안함 <span class="itemTotalCount">1</span>건
							</li>
						</ul>
					</div>
					<button type="button"
						class="btn btn-outline-dark createItem-btn mt-3 me-2"
						onclick="location.href='${pageContext.request.contextPath}/admin/item/createItemForm'">상품등록</button>
				</div>

				<div class="container mt-3">
					<!-- <h2>전체 상품 목록</h2> -->
					<table class="table">
						<thead class="table-dark">
							<tr>
								<th>No</th>
								<th>기능별</th>
								<th>성분별</th>
								<th>상품코드</th>
								<th>브랜드</th>
								<th>상품명</th>
								<th>판매가</th>
								<th>재고</th>
								<th>등록일시</th>
								<th>수정/삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="product" items="${productList}">
								<tr>
									<td></td>
									<td>${product.fnval}</td>
									<td>${product.igdval}</td>
									<td>${product.prdcode}</td>
									<td>${product.prdbrand}</td>
									<td>
										<div class="img_box d-flex">
											<div id="itemImg">
												<img src="attachDownload?prdcode=${product.prdcode}"
													class="rounded-3" style="width: 90px; height: 90px;" />
											</div>
											<span class="ms-2">${product.prdname}</span>
										</div>
									</td>
									<td>${product.prdprice}</td>
									<td>${product.prdstock}</td>
									<td><fmt:formatDate value="${product.prdcreatedat}"
											pattern="yyyy-MM-dd" /></td>
									<td>
										<div class="btn_big_wrap">
											<button type="button"
												onclick="location.href='${pageContext.request.contextPath}/admin/item/itemUpdate'"
												class="btn btn-outline-dark">수정</button>
											<button type="button" onclick="location.href='#'"
												class="btn btn-outline-dark">삭제</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="itemList?pageNo=1">처음</a></li>
				<c:if test="${pager.groupNo>1}">
					<li class="page-item"><a class="page-link"
						href="itemList?pageNo=${pager.startPageNo-1}">이전</a></li>
				</c:if>

				<c:forEach var="i" begin="${pager.startPageNo}"
					end="${pager.endPageNo}">
					<c:if test="${pager.pageNo != i}">
						<li class="page-item"><a class="page-link"
							href="itemList?pageNo=${i}">${i}</a></li>
					</c:if>
					<!-- 현재 페이지가 i 쪽이면, 강조된 모양 (danger)으로 다르게 표시  -->
					<c:if test="${pager.pageNo == i}">
						<li class="page-item"><a class="page-link"
							href="itemList?pageNo=${i}">${i}</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${pager.groupNo<pager.totalGroupNo}">
					<li class="page-item"><a class="page-link"
						href="itemList?pageNo=${pager.endPageNo+1}">다음</a></li>
				</c:if>
				<li class="page-item"><a class="page-link"
					href="itemList?pageNo=${pager.totalPageNo}">맨끝</a></li>
			</ul>

		</div>

	</div>

	<script
		src="${pageContext.request.contextPath}/resources/js/admin_sidebar.js"></script>
</body>
</html>