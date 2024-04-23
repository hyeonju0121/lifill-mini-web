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

<!-- 사용자 정의 자바스크립트 -->
<script>
	
</script>
<style>
* {
	margin: 0;
	padding: 0;
}

/* #lifill_logo {
		width: 60px;
		margin : 5px;
		
	} */
#logo {
	font-size: 40px;
	text-align: center;
}

li {
	list-style-type: none;
}

#content_box div {
	display: inline;
}

.product_items {
	float: left;
	margin-left: 20px;
}



#content_box p {
	float: right;
}

.text {
	font-size: 15px;
	font-weight: bold;
}

.text_price {
	font-size: 15px;
	font-weight: bold;
}

.nav_item {
	font-size: 13px;
}
</style>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/category1.css">
</head>

<body>
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>


	<div class="wrap">
		<header> </header>
		<div class="box" id="logo">
			LIFILL
			<%-- <img id="lifill_logo" src="${pageContext.request.contextPath}/resources/image/icon/lifill_logo.png"/> --%>
		</div>

		

		<!-- <h1 style="text-align: center; margin-top:30px;">LIFILL</h1> -->

		<section class="category">
		<div class="wrapper" style="width:1000px; margin-bottom:15px;">
			<ul class="category2">
				<li class="on" data-code="ingredient"><a
					href="/lifill_mini_web/item/category1#">전체상품</a></li>
				<li class="" data-code="function"><a
					href="/lifill_mini_web/item/category2#">기능</a></li>
				<li class="" data-code="function"><a
					href="/lifill_mini_web/item/category3#">성분</a></li>
			</ul>
			<div class="category3">
				<ul data-code="ingredient" style="display: grid;">
					<li class="on"><a href="#" class="goCategory3"
						data-code="ingredient">전체</a></li>
					<li><a href="#" class="goCategory3" data-code="nutrient">비타민/미네랄</a></li>
					<li><a href="#" class="goCategory3" data-code="lactobacillus">유산균</a></li>
					<li><a href="#" class="goCategory3" data-code="omega3">오메가3</a></li>
					<li><a href="#" class="goCategory3" data-code="supplements">영양제</a></li>
				</ul>
				<ul data-code="function" style="display: none;">
					<li class="on"><a href="#" class="goCategory3"
						data-code="function">전체</a></li>
					<li><a href="#" class="goCategory3" data-code="bone_tooth">뼈/치아</a></li>
					<li><a href="#" class="goCategory3" data-code="liver">간</a></li>
					<li><a href="#" class="goCategory3" data-code="eye">눈</a></li>
					<li><a href="#" class="goCategory3" data-code="energy">에너지</a></li>
					<li><a href="#" class="goCategory3" data-code="exercise">운동능력</a></li>
					<li><a href="#" class="goCategory3"
						data-code="immune_antioxidation">면역/항산화</a></li>
				</ul>
			</div>
		</div>
	</section>



	</div>
	

	<div class="contents">
		<div class="product_list_wrap">
			<div class="search_filter_wrap">
				<!-- <p class="text">총 XX개의 상품.</p> -->
			</div>
		</div>
	</div>
	<!-- list wrap -->

	<section id="content_box">
		<div class="box">
			<h4 style="text-align:center;">성분별</h4>
			<!--  div로 감싸서 checkbox와 텍스트 글자 합치기 -->
			<div class="d-flex justify-content-between">
			<div>
				<input type='checkbox' name='check'/>구독 가능 상품
			</div>
				<select id="sort"><option value="">추천순</option>
					<option value="regTspDesc">최신순</option>
					<option value="priceDesc">높은가격순</option>
					<option value="priceAsc">낮은가격순</option>
				</select>
			</div>
			<!-- items wrap -->
			
			<div class="card-group d-flex">
					  <div class="card me-3">
					    <img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye1.png" class="card-img-top">
					    <div class="card-body">
					      <h5 class="card-title">물약1</h5>
					      <p class="card-text">30,000원</p>
					      <div class="hashtag">
								<div># 항산화 효과</div>
								<div># 구강 향균</div>
						  </div>
					    </div>
					  </div>
					  <div class="card me-3">
					    <img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye2.png" class="card-img-top">
					    <div class="card-body">
					      <h5 class="card-title">물약2</h5>
					      <p class="card-text">30,000원</p>
					      <div class="hashtag">
								<div># 항산화 효과</div>
								<div># 구강 향균</div>
						  </div>
					    </div>
					  </div>
					  <div class="card me-3">
					    <img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye3_image1.png" class="card-img-top">
					    <div class="card-body">
					      <h5 class="card-title">물약3</h5>
					      <p class="card-text"></p>
					      <div class="hashtag">
								<div># 항산화 효과</div>
								<div># 구강 향균</div>
								<div># 가나다라</div>
								<div># 가나다라</div>
						  </div>
					    </div>
					  </div>
					  <div class="card">
					    <img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye4.png" class="card-img-top">
					    <div class="card-body">
					      <h5 class="card-title">물약4</h5>
					      <div class="left">
					      <p class="card-text" style="font-size:20px;">30,000원</p>
					      <p class="card-text"><small class="text-muted">

					      <div class="hashtag">
								<div># 눈건강 효과</div>
								<div># 가나다라</div>
								<div># 가나다라</div>
								<div># 가나다라</div>
								<div># 가나다라</div>
								<div># 가나다라</div>
								<div># 가나다라</div>
												
												
						</div>
						</small></p>
						  </div>
					    </div>
					  </div>
					</div>
				 </div>
			
			
						
	</section>

	<!--------------- footer ---------------->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>