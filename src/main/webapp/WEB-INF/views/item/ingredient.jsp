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

	    // 이전에 클릭된 요소의 CSS 초기화
	    $(".goCategory3").children().removeClass("highlight");
	    
	    // 클릭된 요소의 CSS 변경
	    $(this).addClass("highlight");
	  });
	});
</script>


</head>

<body>
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>

				<section class="category">
					<div class="wrapper" style="width:1150px; margin-bottom:15px;">
						<ul class="category2">
							<li class="" data-code="ingredient"><a
								href="${pageContext.request.contextPath}/item/categories/function">기능</a></li>
							<li class="on" data-code="function"><a
								href="${pageContext.request.contextPath}/item/categories/ingredient">성분</a></li>
						</ul>
						<div class="category3" id="goCategory3">
							<ul class="goCategory3" data-code="ingredient" >
								<li class="highlight"><a href="#" data-code="ingredient">전체</a></li>
								<li class=""><a href="#" data-code="nutrient">루테인</a></li>
								<li class=""><a href="#" data-code="lactobacillus">프로바이오틱스</a></li>
								<li class=""><a href="#" data-code="omega3">밀크씨슬</a></li>
								<li class=""><a href="#" data-code="supplements">마그네슘</a></li>
								<li class=""><a href="#" data-code="supplements">글루코사민</a></li>
								<li class=""><a href="#" data-code="supplements">칼슘</a></li>
								<li class=""><a href="#" data-code="supplements">프로폴리스</a></li>
								<li class=""><a href="#" data-code="supplements">아연</a></li>
								<li class=""><a href="#" data-code="supplements">비타민</a></li>
								<li class=""><a href="#" data-code="supplements">테아닌</a></li>
								<li class=""><a href="#" data-code="supplements">오메가3</a></li>
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
									<input type='checkbox' name='check' style="mt-3"/>구독 가능 상품
								
								<div class="sort-nav">
									<ul class="product-sort">
										<li class="on" data-sort="">라이필추천순</li>
										<li data-sort="regTspDesc">최신순</li>
										<li data-sort="priceDesc">높은가격순</li>
										<li data-sort="priceAsc">낮은가격순</li>
									</ul>
								</div>
								
								<ul id="items">
									<c:forEach var="productResponse" items="${productResponseList}">
										<li class="store-product-wrapper"><a href="${pageContext.request.contextPath}/item/item_view?prdcode=${productResponse.prdcode}"
											onclick="selectStoreProduct(this, '');">
												<figure class="">
													<img
														src="${pageContext.request.contextPath}/item/attachDownload?prdcode=${productResponse.prdcode}"/>
												</figure>
												<div class="store-product-content">
													<span class="health_functional_food">건강기능식품</span>
													<h5>
														<em class="prd-product-brand">[${productResponse.prdbrand}]</em> ${productResponse.prdname}
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
						</section>

	<!--------------- footer ---------------->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>