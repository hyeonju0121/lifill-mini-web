<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

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
	href="${pageContext.request.contextPath}/resources/css/item/category2.css">

<!-- 사용자 정의 자바스크립트 -->
<style>
	  /* 클릭 시 변경할 CSS */
	  .highlight {
	    color: #rgba(55, 203, 233);
    	font-weight: 700;
    	background-color: #e5fffc;
	    
	  }
</style>

<script>
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

				<!-- <section class="category ">
					<div class="wrapper" style="width:1000px; margin-bottom:15px;">
						<ul class="category2">				
							<li class="" data-code="function"><a
								href="/lifill_mini_web/item/category2#">기능</a></li>
							<li class="" data-code="ingredient"><a
								href="/lifill_mini_web/item/category3#">성분</a></li>
						</ul>			
					</div>
				</section> -->

				<section class="category">
					<div class="wrapper" style="width:1150px; margin-bottom:15px;">
						<ul class="category2">
							<li class="" data-code="ingredient"><a
								href="/lifill_mini_web/item/category2#">성분</a></li>
							<li class="" data-code="function"><a
								href="/lifill_mini_web/item/category3#">기능</a></li>
						</ul>
						<div class="category3" id="goCategory3">
							<ul class="goCategory3" data-code="ingredient" >
								<li class=""><a href="#" 
									data-code="ingredient">전체</a></li>
								<li class=""><a href="#" data-code="nutrient">비타민/미네랄</a></li>
								<li class=""><a href="#" data-code="lactobacillus">유산균</a></li>
								<li class=""><a href="#" data-code="omega3">오메가3</a></li>
								<li class=""><a href="#" data-code="supplements">영양제</a></li>
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
									<input type='checkbox' name='check'/>구독 가능 상품
								
								<div class="sort-nav">
									<ul class="product-sort">
										<li class="on" data-sort="">라이필추천순</li>
										<li data-sort="regTspDesc">최신순</li>
										<li data-sort="priceDesc">높은가격순</li>
										<li data-sort="priceAsc">낮은가격순</li>
									</ul>
									<select id="sort"><option value="">라이필추천순</option>
										<option value="regTspDesc">최신순</option>
										<option value="priceDesc">높은가격순</option>
										<option value="priceAsc">낮은가격순</option></select>
								</div>
								
								<ul id="items">
									<c:forEach var="productResponse" items="${productResponseList}">
										<li class="store-product-wrapper"><a href="${pageContext.request.contextPath}/item/item_view"
											onclick="selectStoreProduct(this, '');">
												<figure class="">
													<img
														src="attachDownload?prdcode=${productResponse.prdcode}"/>
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