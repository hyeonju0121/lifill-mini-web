<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>라이필 - 상품 스토어</title>

<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery 외부 라이브러리  설정-->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/item/ingredient.css">


<script>
$(document).ready(function() {
	$(".product-sort").on("click", "li", function() {

		$(".product-sort").children().removeClass("on");

		$(this).addClass("on");
	});
});

$(document).ready(function() {
	// 문서가 준비 되었을 때 실행할 함수를 지정하는 메소드 -> .ready(함수)
	$(".goCategory3").on("click", "li", function() {
		var subCategory = $('#subCategory').val();
		console.log(subCategory);

		var clickedSubCategory = $(this).find('a').attr('data-code');
		console.log(clickedSubCategory);
		// 이전에 클릭된 요소의 CSS 초기화
		//$(".goCategory3").children().removeClass("highlight");

		if (subCategory === clickedSubCategory) {
			$(this).addClass("highlight");
		}

		// 클릭된 요소의 CSS 변경
		/* if (subCategory === clickedSubCategory) {
		    $(this).addClass("highlight");
		} */

		/* var subCategory = $('#subCategory').val()
		
		// 이전에 클릭된 요소의 CSS 초기화
		$(".goCategory3").children().removeClass("highlight");
		
		// 클릭된 요소의 CSS 변경
		$(this).addClass("highlight"); */
	});
});

$(document).ready(function() {
					// 링크를 클릭할 때마다 체크박스 상태 초기화
					$('.goCategory3 a').click(function() {
						// 로컬 스토리지에서 체크박스 상태 제거
						localStorage.removeItem('prdsubscribable_checked');
					});

					// 체크박스의 상태를 가져와서 로컬 스토리지에 저장된 상태로 설정합니다.
					var isChecked = localStorage
							.getItem('prdsubscribable_checked');
					if (isChecked === 'true') {
						$('#prdsubscribable').prop('checked', true);
					} else {
						$('#prdsubscribable').prop('checked', false);
					}

					// 체크박스 상태가 변경될 때마다 로컬 스토리지에 상태를 저장합니다.
					$('#prdsubscribable')
							.change(
									function() {
										var isChecked = $(this).is(
												':checked');
										localStorage.setItem(
												'prdsubscribable_checked',
												isChecked);

										// 만약 filter 값이 0이면 체크박스를 해제합니다.
										var filterValue = $('#filter')
												.val();
										console.log("filterValue:",
												filterValue);
										if (filterValue === '0') {
											$('#prdsubscribable').prop(
													'checked', false);
										}

										// 체크박스가 체크되었을 때만 페이지 이동
										if (isChecked) {
											location.href = "${pageContext.request.contextPath}/item/categories/ingredient?subCategory=${param.subCategory}&sort=0&filter=1&pageNo=1";
										} else {
											location.href = "${pageContext.request.contextPath}/item/categories/ingredient?subCategory=${param.subCategory}&sort=0&filter=0&pageNo=1";
										}
									});
				});
</script>


</head>

<body>
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>

				<section class="category">
					<div class="wrapper" style="width:1150px; margin-bottom:15px;">
						<input type="hidden" id="subCategory" name="subCategory"
							value="${param.subCategory}"> <input type="hidden"
							id="subCategory" name="subCategory" value="${param.subCategory}">
						<input type="hidden" id="subCategory" name="subCategory"
							value="${param.sort}"> <input type="hidden"
							id="sort" name="sort" value="${param.sort}">
						<input type="hidden" id="subCategory" name="subCategory"
							value="${param.filter}"> <input type="hidden"
							id="filter" name="filter" value="${param.filter}">
						<ul class="category2">
							<li class="" data-code="ingredient"><a
								href="${pageContext.request.contextPath}/item/categories/function?subCategory=all&filter=0&sort=0&pageNo=1">기능</a></li>
							<li class="on" data-code="function"><a
								href="${pageContext.request.contextPath}/item/categories/ingredient?subCategory=all&filter=0&sort=0&pageNo=1">성분</a></li>
						</ul>
						<div class="category3" id="goCategory3">
							<ul class="goCategory3" data-code="ingredient" >
								<li class="highlight">
									<a href="${pageContext.request.contextPath}/item/categories/ingredient?subCategory=all&filter=0&sort=0&pageNo=1" 
									   data-code="all">전체</a>
								</li>
								<li class="">
									<a href="${pageContext.request.contextPath}/item/categories/ingredient?subCategory=001&filter=0&sort=0&pageNo=1"
									   data-code="001">루테인</a>
								</li>
								<li class="">
									<a href="${pageContext.request.contextPath}/item/categories/ingredient?subCategory=002&filter=0&sort=0&pageNo=1" 
									   data-code="002">프로바이오틱스</a>
								</li>
								<li class="">
									<a href="${pageContext.request.contextPath}/item/categories/ingredient?subCategory=003&filter=0&sort=0&pageNo=1" 
									   data-code="003">밀크씨슬</a>
								</li>
								<li class="">
									<a href="${pageContext.request.contextPath}/item/categories/ingredient?subCategory=004&filter=0&sort=0&pageNo=1" 
									   data-code="004">마그네슘</a>
								</li>
								<li class="">
									<a href="${pageContext.request.contextPath}/item/categories/ingredient?subCategory=005&filter=0&sort=0&pageNo=1" 
									   data-code="005">글루코사민</a>
								</li>
								<li class="">
									<a href="${pageContext.request.contextPath}/item/categories/ingredient?subCategory=006&filter=0&sort=0&pageNo=1" 
									   data-code="006">칼슘</a>
								</li>
								<li class="">
									<a href="${pageContext.request.contextPath}/item/categories/ingredient?subCategory=007&filter=0&sort=0&pageNo=1" 
									   data-code="007">프로폴리스</a>
								</li>
								<li class="">
									<a href="${pageContext.request.contextPath}/item/categories/ingredient?subCategory=008&filter=0&sort=0&pageNo=1" 
									   data-code="008">아연</a>
								</li>
								<li class="">
									<a href="${pageContext.request.contextPath}/item/categories/ingredient?subCategory=009&filter=0&sort=0&pageNo=1" 
									   data-code="009">비타민</a>
								</li>
								<li class="">
									<a href="${pageContext.request.contextPath}/item/categories/ingredient?subCategory=010&filter=0&sort=0&pageNo=1" 
									   data-code="010">테아닌</a>
								</li>
								<li class="">
									<a href="${pageContext.request.contextPath}/item/categories/ingredient?subCategory=011&filter=0&sort=0&pageNo=1" 
									   data-code="011">오메가3</a>
								</li>
							</ul>
							
						</div>
					</div>
				</section>

						<section class="list">
							<div class="wrapper" style="width:1150px; margin-bottom:15px; ">
								<h2 class="mb-3">
									총 <em id="items-total">${totalCnt}</em>개
								</h2>
								<br>
									<input type='checkbox' id='prdsubscribable' style="" />구독 가능 상품
								
								<div class="sort-nav">
									<ul class="product-sort">
										<li class="on" data-sort="0">
											<a href="${pageContext.request.contextPath}/item/categories/ingredient?subCategory=${param.subCategory}&sort=0&filter=${param.filter}&pageNo=1">최신순</a></li>
										<li class="on" data-sort="0">
											<a href="${pageContext.request.contextPath}/item/categories/ingredient?subCategory=${param.subCategory}&sort=1&filter=${param.filter}&pageNo=1">높은가격순</a></li>
										<li class="on" data-sort="0">
											<a href="${pageContext.request.contextPath}/item/categories/ingredient?subCategory=${param.subCategory}&sort=2&filter=${param.filter}&pageNo=1">낮은가격순</a></li>
									</ul>
								</div>
								
								<ul id="items">
									<c:forEach var="productResponse" items="${productResponseList}">
										<li class="store-product-wrapper"
										><a href="${pageContext.request.contextPath}/item/item_view?prdcode=${productResponse.prdcode}"
											onclick="selectStoreProduct(this, '');">
												<figure class="">
													<img
														src="${pageContext.request.contextPath}/item/attachDownload?prdcode=${productResponse.prdcode}"/>
												</figure>
												<div class="store-product-content">
													<span class="health_functional_food">건강기능식품</span>
													<h5>
														<em class="prd-product-brand">[${productResponse.prdbrand}]</em>
															 ${productResponse.prdname}
													</h5>
													<p style="font-weight: 500;">
														${productResponse.prdprice} 원
													</p>
													<div>
														<div>
															<span><img class="icon-rating"
																  src="${pageContext.request.contextPath}/resources/image/icon/star1.png"/></span> 4.9
														<div style="margin-bottom: 7px; margin-top: 7px; font-size: 14px;">(후기 626)</div>
														</div>
													</div>
													<div>
														<div class="hashtag"># ${productResponse.tagval}</div>
													</div>
												</div>
										</a></li>
									</c:forEach>
									
								</ul>
							</div>
							
							<div class="pager">
								<a class="btn btn-sm first-page" href="ingredient?subCategory=${param.subCategory}&sort=${param.sort}&filter=${param.filter}&pageNo=1">처음</a>
								<c:if test="${pager.groupNo>1}">
									<a class="btn btn-sm prev-group"
										href="ingredient?subCategory=${param.subCategory}&sort=${param.sort}&filter=${param.filter}&pageNo=${pager.startPageNo-1}">이전</a>
								</c:if>
					
								<c:forEach var="i" begin="${pager.startPageNo}"
									end="${pager.endPageNo}">
									<c:if test="${pager.pageNo != i}">
										<a class="btn btn-sm current-group-pages"
											href="ingredient?subCategory=${param.subCategory}&sort=${param.sort}&filter=${param.filter}&pageNo=${i}">${i}</a>
									</c:if>
									<c:if test="${pager.pageNo == i}">
										<a class="btn btn-sm current-page" href="ingredient?subCategory=${param.subCategory}&sort=${param.sort}&filter=${param.filter}&pageNo=${i}">${i}</a>
									</c:if>
								</c:forEach>
					
								<c:if test="${pager.groupNo<pager.totalGroupNo}">
									<a class="btn btn-sm next-group"
										href="ingredient?subCategory=${param.subCategory}&sort=${param.sort}&filter=${param.filter}&pageNo=${pager.endPageNo+1}">다음</a>
								</c:if>
								<a class="btn btn-sm last-page"
									href="ingredient?subCategory=${param.subCategory}&sort=${param.sort}&filter=${param.filter}&pageNo=${pager.totalPageNo}">맨끝</a>
							</div>
						</section>

	<!--------------- footer ---------------->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>