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
									총 <em id="items-total">18</em>개
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
									<li class="store-product-wrapper"><a href="${pageContext.request.contextPath}/item/item_view"
										onclick="selectStoreProduct(this, '');"
										data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDJWHTYK4379&quot;,&quot;nick&quot;:&quot;mega-propolis-immune-jelly&quot;,&quot;title&quot;:&quot;메가 프로폴리스 면역젤리&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:13500}">
											<figure class="">
												<img
													src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye1.png" 
													alt="메가 프로폴리스 폴리스 폴리스"
													srcset="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye1.png">
											</figure>
											<div class="store-product-content">
												<span class="health_functional_food">건강기능식품</span>
												<h4>
													<em>라이필</em> 메가 프로폴리스 폴리스 폴리스
												</h4>
												<p>
													15,000원
												</p>
												<div>
													<div>
														<span class="icon rating"></span> 4.9
													</div>
													<div>(후기 626)</div>
												</div>
												<div class="hashtag">
													<div># 항산화 효과</div>
													<div># 구강 항균</div>
												</div>
											</div>
									</a></li>
									<li class="store-product-wrapper"><a href="${pageContext.request.contextPath}/item/item_view"
										onclick="selectStoreProduct(this, '');"
										data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDYWPKFW7396&quot;,&quot;nick&quot;:&quot;peace-free&quot;,&quot;title&quot;:&quot;피스&amp;프리 : 그날의 극적 화해&quot;,&quot;brand&quot;:&quot;PHEW&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:32500}">
											<figure class="">
												<img
													src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye2.png"
													alt="브레멘 변성준 곽동현 유현주 파이팅!!!!!!!!"
													srcset="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye2.png">
												<button class="cart"
													onclick="event.stopPropagation(); addToCart(this); return false;"
													data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDYWPKFW7396&quot;,&quot;nick&quot;:&quot;peace-free&quot;,&quot;title&quot;:&quot;피스&amp;프리 : 그날의 극적 화해&quot;,&quot;brand&quot;:&quot;PHEW&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:32500}">
													<span></span>
												</button>
											</figure>
											<div class="store-product-content">
												<span class="health_functional_food">건강기능식품</span>
												<h4>
													<em>라이필</em> 브레멘 변성준 곽동현 유현주 파이팅!!!!!!!!
												</h4>
												<p>99,000원</p>
												<div>
													<div>
														<span class="icon rating"></span> 4.8
													</div>
													<div>(후기 139)</div>
												</div>
												<div class="hashtag">
													<div># 보컬구함</div>
													<div># 브레멘</div>
													<div># 음악대</div>
													<div># 귀보호</div>
												</div>
											</div>
									</a></li>
									<li class="store-product-wrapper"><a href="javascript:;"
										onclick="selectStoreProduct(this, '');"
										data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDUBUWYD7693&quot;,&quot;nick&quot;:&quot;immune-balance&quot;,&quot;title&quot;:&quot;이뮨밸런스 : 롤러코스터 하차 선언&quot;,&quot;brand&quot;:&quot;PHEW&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:19500}">
											<figure class="">
												<img
													src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye3_image1.png"
													alt="브레멘 음악 콘서트"
													srcset="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye3_image1.png">
												<button class="cart"
													onclick="event.stopPropagation(); addToCart(this); return false;"
													data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDUBUWYD7693&quot;,&quot;nick&quot;:&quot;immune-balance&quot;,&quot;title&quot;:&quot;이뮨밸런스 : 롤러코스터 하차 선언&quot;,&quot;brand&quot;:&quot;PHEW&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:19500}">
													<span></span>
												</button>
											</figure>
											<div class="store-product-content">
												<span class="health_functional_food">건강기능식품</span>
												<h4>
													<em>라이필 </em> 브레멘 음악대 단독 콘서트
												</h4>
												<p>990,000원</p>
												<div>
													<div>
														<span class="icon rating"></span> 4.9
													</div>
													<div>(후기 9999)</div>
												</div>
												<div class="hashtag">
													<div># 변성준</div>
													<div># 곽동현</div>
													<div># 유현주</div>
													<div># 많관부</div>
													<div># 스트레스 감소</div>
												</div>
											</div>
									</a></li>
									<li class="store-product-wrapper"><a href="javascript:;"
										onclick="selectStoreProduct(this, '');"
										data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDPTAVCZ7443&quot;,&quot;nick&quot;:&quot;press-wellness-shot&quot;,&quot;title&quot;:&quot;프레스샷&quot;,&quot;brand&quot;:&quot;온누리스토어&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:25700}">
											<figure class="">
												<img
													src="https://img.pilly.kr/product/store/PDPTAVCZ7443/product_01.png?v=v202405021455?v=v202405021455"
													alt="프레스샷"
													srcset="https://img.pilly.kr/product/store/PDPTAVCZ7443/product_01@2x.png?v=v202405021455?v=v202405021455 2x, https://img.pilly.kr/product/store/PDPTAVCZ7443/product_01@3x.png?v=v202405021455?v=v202405021455 3x">
												<button class="cart"
													onclick="event.stopPropagation(); addToCart(this); return false;"
													data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDPTAVCZ7443&quot;,&quot;nick&quot;:&quot;press-wellness-shot&quot;,&quot;title&quot;:&quot;프레스샷&quot;,&quot;brand&quot;:&quot;온누리스토어&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:25700}">
													<span></span>
												</button>
											</figure>
											<div class="store-product-content">
												<span class="health_functional_food">건강기능식품</span>
												<h3>
													<em>온누리스토어</em>프레스샷
												</h3>
												<p>
													<em>14%</em>25,700원<strike>29,900원</strike>
												</p>
												<div>
													<div>
														<span class="icon rating"></span> 5
													</div>
													<div>(후기 2)</div>
												</div>
												<div class="hashtag">
													<div># 에너지생성</div>
													<div># 면역기능</div>
													<div># 뼈의 형성과 유지</div>
													<div># 유해산소로부터 세포보호</div>
												</div>
											</div>
									</a></li>
									<li class="store-product-wrapper"><a href="javascript:;"
										onclick="selectStoreProduct(this, '');"
										data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDYLJOQO9667&quot;,&quot;nick&quot;:&quot;theanine&quot;,&quot;title&quot;:&quot;테아닌&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:6900}">
											<figure class="">
												<img
													src="https://img.pilly.kr/product/store/PDYLJOQO9667/product_01.png?v=v202405021455?v=v202405021455"
													alt="테아닌"
													srcset="https://img.pilly.kr/product/store/PDYLJOQO9667/product_01@2x.png?v=v202405021455?v=v202405021455 2x, https://img.pilly.kr/product/store/PDYLJOQO9667/product_01@3x.png?v=v202405021455?v=v202405021455 3x">
												<button class="cart"
													onclick="event.stopPropagation(); addToCart(this); return false;"
													data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDYLJOQO9667&quot;,&quot;nick&quot;:&quot;theanine&quot;,&quot;title&quot;:&quot;테아닌&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:6900}">
													<span></span>
												</button>
											</figure>
											<div class="store-product-content">
												<span class="health_functional_food">건강기능식품</span>
												<h3>
													<em>필리</em>테아닌
												</h3>
												<p>
													<em>48%</em>6,900원<strike>13,500원</strike>
												</p>
												<div>
													<div>
														<span class="icon rating"></span> 4.6
													</div>
													<div>(후기 11)</div>
												</div>
												<div class="hashtag">
													<div># 스트레스</div>
													<div># 긴장완화</div>
												</div>
											</div>
									</a></li>
									<li class="store-product-wrapper"><a href="javascript:;"
										onclick="selectStoreProduct(this, '');"
										data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDJILGYX7766&quot;,&quot;nick&quot;:&quot;iron-chewable&quot;,&quot;title&quot;:&quot;철분 츄어블&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:5900}">
											<figure class="">
												<img
													src="https://img.pilly.kr/product/store/PDJILGYX7766/product_01.png?v=v202405021455?v=v202405021455"
													alt="철분 츄어블"
													srcset="https://img.pilly.kr/product/store/PDJILGYX7766/product_01@2x.png?v=v202405021455?v=v202405021455 2x, https://img.pilly.kr/product/store/PDJILGYX7766/product_01@3x.png?v=v202405021455?v=v202405021455 3x">
												<button class="cart"
													onclick="event.stopPropagation(); addToCart(this); return false;"
													data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDJILGYX7766&quot;,&quot;nick&quot;:&quot;iron-chewable&quot;,&quot;title&quot;:&quot;철분 츄어블&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:5900}">
													<span></span>
												</button>
											</figure>
											<div class="store-product-content">
												<span class="health_functional_food">건강기능식품</span>
												<h3>
													<em>필리</em>철분 츄어블
												</h3>
												<p>
													<em>54%</em>5,900원<strike>13,000원</strike>
												</p>
												<div>
													<div>
														<span class="icon rating"></span> 4.9
													</div>
													<div>(후기 120)</div>
												</div>
												<div class="hashtag">
													<div># 혈액생성</div>
													<div># 에너지생성</div>
													<div># 체내산소운반</div>
													<div># 항산화</div>
												</div>
											</div>
									</a></li>
									<li class="store-product-wrapper"><a href="javascript:;"
										onclick="selectStoreProduct(this, '');"
										data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDZBA94HTD2Y&quot;,&quot;nick&quot;:&quot;vitaminb&quot;,&quot;title&quot;:&quot;비타민B&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:12000}">
											<figure class="">
												<img
													src="https://img.pilly.kr/product/store/PDZBA94HTD2Y/product_01.png?v=v202405021455?v=v202405021455"
													alt="비타민B"
													srcset="https://img.pilly.kr/product/store/PDZBA94HTD2Y/product_01@2x.png?v=v202405021455?v=v202405021455 2x, https://img.pilly.kr/product/store/PDZBA94HTD2Y/product_01@3x.png?v=v202405021455?v=v202405021455 3x">
												<button class="cart"
													onclick="event.stopPropagation(); addToCart(this); return false;"
													data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDZBA94HTD2Y&quot;,&quot;nick&quot;:&quot;vitaminb&quot;,&quot;title&quot;:&quot;비타민B&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:12000}">
													<span></span>
												</button>
											</figure>
											<div class="store-product-content">
												<span class="health_functional_food">건강기능식품</span>
												<h3>
													<em>필리</em>비타민B
												</h3>
												<p>12,000원</p>
												<div>
													<div>
														<span class="icon rating"></span> 4.8
													</div>
													<div>(후기 202)</div>
												</div>
												<div class="hashtag">
													<div># 에너지 생성</div>
													<div># 피로회복</div>
													<div># 에너지 대사에 필요</div>
												</div>
											</div>
									</a></li>
									<li class="store-product-wrapper"><a href="javascript:;"
										onclick="selectStoreProduct(this, '');"
										data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDJDOMQS7443&quot;,&quot;nick&quot;:&quot;probiotics&quot;,&quot;title&quot;:&quot;프로바이오틱스&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:13800}">
											<figure class="">
												<img
													src="https://img.pilly.kr/product/store/PDJDOMQS7443/product_01.png?v=v202405021455?v=v202405021455"
													alt="프로바이오틱스"
													srcset="https://img.pilly.kr/product/store/PDJDOMQS7443/product_01@2x.png?v=v202405021455?v=v202405021455 2x, https://img.pilly.kr/product/store/PDJDOMQS7443/product_01@3x.png?v=v202405021455?v=v202405021455 3x">
												<button class="cart"
													onclick="event.stopPropagation(); addToCart(this); return false;"
													data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDJDOMQS7443&quot;,&quot;nick&quot;:&quot;probiotics&quot;,&quot;title&quot;:&quot;프로바이오틱스&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:13800}">
													<span></span>
												</button>
											</figure>
											<div class="store-product-content">
												<span class="health_functional_food">건강기능식품</span>
												<h3>
													<em>필리</em>프로바이오틱스
												</h3>
												<p>13,800원</p>
												<div>
													<div>
														<span class="icon rating"></span> 4.9
													</div>
													<div>(후기 117)</div>
												</div>
												<div class="hashtag">
													<div># 유산균 증식</div>
													<div># 유해균 억제</div>
													<div># 원활한 배변활동</div>
												</div>
											</div>
									</a></li>
									<li class="store-product-wrapper"><a href="javascript:;"
										onclick="selectStoreProduct(this, '');"
										data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDC6K049PCFQ&quot;,&quot;nick&quot;:&quot;omega3&quot;,&quot;title&quot;:&quot;오메가3&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:13500}">
											<figure class="">
												<img
													src="https://img.pilly.kr/product/store/PDC6K049PCFQ/product_01.png?v=v202405021455?v=v202405021455"
													alt="오메가3"
													srcset="https://img.pilly.kr/product/store/PDC6K049PCFQ/product_01@2x.png?v=v202405021455?v=v202405021455 2x, https://img.pilly.kr/product/store/PDC6K049PCFQ/product_01@3x.png?v=v202405021455?v=v202405021455 3x">
												<button class="cart"
													onclick="event.stopPropagation(); addToCart(this); return false;"
													data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDC6K049PCFQ&quot;,&quot;nick&quot;:&quot;omega3&quot;,&quot;title&quot;:&quot;오메가3&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:13500}">
													<span></span>
												</button>
											</figure>
											<div class="store-product-content">
												<span class="health_functional_food">건강기능식품</span>
												<h3>
													<em>필리</em>오메가3
												</h3>
												<p>13,500원</p>
												<div>
													<div>
														<span class="icon rating"></span> 4.9
													</div>
													<div>(후기 163)</div>
												</div>
												<div class="hashtag">
													<div># 혈행개선</div>
													<div># 남녀노소 모두 추천</div>
												</div>
											</div>
									</a></li>
									<li class="store-product-wrapper"><a href="javascript:;"
										onclick="selectStoreProduct(this, '');"
										data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDX5OMRMKQNS&quot;,&quot;nick&quot;:&quot;calcium-magnesium-vitamind&quot;,&quot;title&quot;:&quot;칼슘 마그네슘 비타민D&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:12400}">
											<figure class="">
												<img
													src="https://img.pilly.kr/product/store/PDX5OMRMKQNS/product_01.png?v=v202405021455?v=v202405021455"
													alt="칼슘 마그네슘 비타민D"
													srcset="https://img.pilly.kr/product/store/PDX5OMRMKQNS/product_01@2x.png?v=v202405021455?v=v202405021455 2x, https://img.pilly.kr/product/store/PDX5OMRMKQNS/product_01@3x.png?v=v202405021455?v=v202405021455 3x">
												<button class="cart"
													onclick="event.stopPropagation(); addToCart(this); return false;"
													data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDX5OMRMKQNS&quot;,&quot;nick&quot;:&quot;calcium-magnesium-vitamind&quot;,&quot;title&quot;:&quot;칼슘 마그네슘 비타민D&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:12400}">
													<span></span>
												</button>
											</figure>
											<div class="store-product-content">
												<span class="health_functional_food">건강기능식품</span>
												<h3>
													<em>필리</em>칼슘 마그네슘 비타민D
												</h3>
												<p>12,400원</p>
												<div>
													<div>
														<span class="icon rating"></span> 4.8
													</div>
													<div>(후기 190)</div>
												</div>
												<div class="hashtag">
													<div># 뼈와 치아 형성</div>
													<div># 골다공증 위험감소</div>
													<div># 신경과 근육 유지</div>
												</div>
											</div>
									</a></li>
									<li class="store-product-wrapper"><a href="javascript:;"
										onclick="selectStoreProduct(this, '');"
										data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PD0I8DW3HS9N&quot;,&quot;nick&quot;:&quot;vitaminc&quot;,&quot;title&quot;:&quot;비타민C&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:11900}">
											<figure class="">
												<img
													src="https://img.pilly.kr/product/store/PD0I8DW3HS9N/product_01.png?v=v202405021455?v=v202405021455"
													alt="비타민C"
													srcset="https://img.pilly.kr/product/store/PD0I8DW3HS9N/product_01@2x.png?v=v202405021455?v=v202405021455 2x, https://img.pilly.kr/product/store/PD0I8DW3HS9N/product_01@3x.png?v=v202405021455?v=v202405021455 3x">
												<button class="cart"
													onclick="event.stopPropagation(); addToCart(this); return false;"
													data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PD0I8DW3HS9N&quot;,&quot;nick&quot;:&quot;vitaminc&quot;,&quot;title&quot;:&quot;비타민C&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:11900}">
													<span></span>
												</button>
											</figure>
											<div class="store-product-content">
												<span class="health_functional_food">건강기능식품</span>
												<h3>
													<em>필리</em>비타민C
												</h3>
												<p>11,900원</p>
												<div>
													<div>
														<span class="icon rating"></span> 4.9
													</div>
													<div>(후기 70)</div>
												</div>
												<div class="hashtag">
													<div># 유해산소로부터 세포보호</div>
													<div># 항산화제 역할</div>
													<div># 수용성</div>
												</div>
											</div>
									</a></li>
									<li class="store-product-wrapper"><a href="javascript:;"
										onclick="selectStoreProduct(this, '');"
										data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDIZYTWB7736&quot;,&quot;nick&quot;:&quot;redginseng-octacosanol&quot;,&quot;title&quot;:&quot;홍삼 옥타코사놀&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:21000}">
											<figure class="">
												<img
													src="https://img.pilly.kr/product/store/PDIZYTWB7736/product_01.png?v=v202405021455?v=v202405021455"
													alt="홍삼 옥타코사놀"
													srcset="https://img.pilly.kr/product/store/PDIZYTWB7736/product_01@2x.png?v=v202405021455?v=v202405021455 2x, https://img.pilly.kr/product/store/PDIZYTWB7736/product_01@3x.png?v=v202405021455?v=v202405021455 3x">
												<button class="cart"
													onclick="event.stopPropagation(); addToCart(this); return false;"
													data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDIZYTWB7736&quot;,&quot;nick&quot;:&quot;redginseng-octacosanol&quot;,&quot;title&quot;:&quot;홍삼 옥타코사놀&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:21000}">
													<span></span>
												</button>
											</figure>
											<div class="store-product-content">
												<span class="health_functional_food">건강기능식품</span>
												<h3>
													<em>필리</em>홍삼 옥타코사놀
												</h3>
												<p>21,000원</p>
												<div>
													<div>
														<span class="icon rating"></span> 4.9
													</div>
													<div>(후기 74)</div>
												</div>
												<div class="hashtag">
													<div># 면역력 증진</div>
													<div># 피로개선</div>
													<div># 지구력 증진</div>
													<div># 항산화효과</div>
												</div>
											</div>
									</a></li>
									<li class="store-product-wrapper"><a href="javascript:;"
										onclick="selectStoreProduct(this, '');"
										data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDPMO159KRV&quot;,&quot;nick&quot;:&quot;milkthistle&quot;,&quot;title&quot;:&quot;밀크씨슬&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:11300}">
											<figure class="">
												<img
													src="https://img.pilly.kr/product/store/PDPMO159KRV/product_01.png?v=v202405021455?v=v202405021455"
													alt="밀크씨슬"
													srcset="https://img.pilly.kr/product/store/PDPMO159KRV/product_01@2x.png?v=v202405021455?v=v202405021455 2x, https://img.pilly.kr/product/store/PDPMO159KRV/product_01@3x.png?v=v202405021455?v=v202405021455 3x">
												<button class="cart"
													onclick="event.stopPropagation(); addToCart(this); return false;"
													data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDPMO159KRV&quot;,&quot;nick&quot;:&quot;milkthistle&quot;,&quot;title&quot;:&quot;밀크씨슬&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:11300}">
													<span></span>
												</button>
											</figure>
											<div class="store-product-content">
												<span class="health_functional_food">건강기능식품</span>
												<h3>
													<em>필리</em>밀크씨슬
												</h3>
												<p>11,300원</p>
												<div>
													<div>
														<span class="icon rating"></span> 4.9
													</div>
													<div>(후기 113)</div>
												</div>
												<div class="hashtag">
													<div># 간(세포막) 보호</div>
													<div># 항산화제 역할</div>
												</div>
											</div>
									</a></li>
									<li class="store-product-wrapper"><a href="javascript:;"
										onclick="selectStoreProduct(this, '');"
										data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDADSABE7437&quot;,&quot;nick&quot;:&quot;hyaluronicacid-spirulina&quot;,&quot;title&quot;:&quot;히알루론산 스피루리나&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:19500}">
											<figure class="item-image">
												<img
													src="https://img.pilly.kr/product/store/PDADSABE7437/product_01.png?v=v202405021455?v=v202405021455"
													alt="히알루론산 스피루리나"
													srcset="https://img.pilly.kr/product/store/PDADSABE7437/product_01@2x.png?v=v202405021455?v=v202405021455 2x, https://img.pilly.kr/product/store/PDADSABE7437/product_01@3x.png?v=v202405021455?v=v202405021455 3x">
												<button class="cart"
													onclick="event.stopPropagation(); addToCart(this); return false;"
													data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDADSABE7437&quot;,&quot;nick&quot;:&quot;hyaluronicacid-spirulina&quot;,&quot;title&quot;:&quot;히알루론산 스피루리나&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:19500}">
													<span></span>
												</button>
											</figure>
											<div class="store-product-content">
												<span class="health_functional_food">건강기능식품</span>
												<h3>
													<em>필리</em>히알루론산 스피루리나
												</h3>
												<p>19,500원</p>
												<div>
													<div>
														<span class="icon rating"></span> 4.9
													</div>
													<div>(후기 224)</div>
												</div>
												<div class="hashtag">
													<div># 피부보습</div>
													<div># 피부건강</div>
													<div># 항산화</div>
												</div>
											</div>
									</a></li>
									<li class="store-product-wrapper"><a href="javascript:;"
										onclick="selectStoreProduct(this, '');"
										data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDVCBZUX4669&quot;,&quot;nick&quot;:&quot;lutein&quot;,&quot;title&quot;:&quot;루테인&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:10600}">
											<figure class="">
												<img
													src="https://img.pilly.kr/product/store/PDVCBZUX4669/product_01.png?v=v202405021455?v=v202405021455"
													alt="루테인"
													srcset="https://img.pilly.kr/product/store/PDVCBZUX4669/product_01@2x.png?v=v202405021455?v=v202405021455 2x, https://img.pilly.kr/product/store/PDVCBZUX4669/product_01@3x.png?v=v202405021455?v=v202405021455 3x">
												<button class="cart"
													onclick="event.stopPropagation(); addToCart(this); return false;"
													data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDVCBZUX4669&quot;,&quot;nick&quot;:&quot;lutein&quot;,&quot;title&quot;:&quot;루테인&quot;,&quot;brand&quot;:&quot;필리&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:10600}">
													<span></span>
												</button>
											</figure>
											<div class="store-product-content">
												<span class="health_functional_food">건강기능식품</span>
												<h3>
													<em>필리</em>루테인
												</h3>
												<p>10,600원</p>
												<div>
													<div>
														<span class="icon rating"></span> 4.8
													</div>
													<div>(후기 74)</div>
												</div>
												<div class="hashtag">
													<div># 눈 보호</div>
													<div># 청색광 흡수</div>
													<div># 황반색소 밀도 유지</div>
												</div>
											</div>
									</a></li>
									<li class="store-product-wrapper"><a href="javascript:;"
										onclick="selectStoreProduct(this, '');"
										data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDCTNIBI6699&quot;,&quot;nick&quot;:&quot;jarrow-womens-fem-dophilus-capsules-30ea&quot;,&quot;title&quot;:&quot;자로우 우먼즈 펨 도필러스 30캡슐&quot;,&quot;brand&quot;:&quot;자로우포뮬라스&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:27900}">
											<figure class="">
												<img
													src="https://img.pilly.kr/product/store/PDCTNIBI6699/product_01.png?v=v202405021455?v=v202405021455"
													alt="자로우 우먼즈 펨 도필러스 30캡슐"
													srcset="https://img.pilly.kr/product/store/PDCTNIBI6699/product_01@2x.png?v=v202405021455?v=v202405021455 2x, https://img.pilly.kr/product/store/PDCTNIBI6699/product_01@3x.png?v=v202405021455?v=v202405021455 3x">
												<button class="cart"
													onclick="event.stopPropagation(); addToCart(this); return false;"
													data-ga="{&quot;itemListId&quot;:&quot;L101&quot;,&quot;itemListName&quot;:&quot;category_health_functional_food&quot;,&quot;code&quot;:&quot;PDCTNIBI6699&quot;,&quot;nick&quot;:&quot;jarrow-womens-fem-dophilus-capsules-30ea&quot;,&quot;title&quot;:&quot;자로우 우먼즈 펨 도필러스 30캡슐&quot;,&quot;brand&quot;:&quot;자로우포뮬라스&quot;,&quot;category&quot;:&quot;건강기능식품&quot;,&quot;price&quot;:27900}">
													<span></span>
												</button>
											</figure>
											<div class="store-product-content">
												<span class="health_functional_food">건강기능식품</span>
												<h3>
													<em>자로우포뮬라스</em>자로우 우먼즈 펨 도필러스 30캡슐
												</h3>
												<p>
													<em>9%</em>27,900원<strike>30,900원</strike>
												</p>
												<div>
													<div>
														<span class="icon rating"></span> 5
													</div>
													<div>(후기 9)</div>
												</div>
												<div class="hashtag">
													<div># 유산균증식</div>
													<div># 유해균억제</div>
													<div># 원활한배변활동</div>
													<div># 장건강</div>
												</div>
											</div>
									</a></li>
								</ul>
							</div>
						</section>

	<!--------------- footer ---------------->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>