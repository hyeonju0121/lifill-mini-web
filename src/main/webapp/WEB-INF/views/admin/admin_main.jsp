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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/order/dashboard.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/sidebar.css">
	</head>
	
	<body>
		<div class="wrapper">
			<!-- sidebar -->
			<jsp:include page="/WEB-INF/views/admin/common/admin_sidebar.jsp"/>

			<!-- contents -->
			<div class="main p-3">
				<div class="item-section mt-2 mb-2" style="font-size: 12px">
				 주문 관리 > 대시보드 
				</div>
			
				<div class="headingArea">
					<div class="title">
						<h1 id="itemTitle">주문건 대시보드</h1>
					</div>
				</div>
				
				<div class="section_block">
					<div class="sub">
						<div class="col-sm-8 bg-dark">
							<div class="sub1 ms-4 mt-2">
								<h5 class="subheading">실시간 매출 현황</h5>
							</div>
							<div class="sub2 mt-2">
								<span class="subheading2">최종 업데이트 일시 : </span>
								<span class="sub-update-date">2024-04-22 10:35</span>
							</div>
						</div>
						
					</div>
					
					<div class="title_block d-flex">
						<div class="col-sm-2 info">
							<h6 class="sub_tit">구분</h6>
						</div>
						<div class="col-sm-2 info">
							<h6 class="sub_tit">오늘</h6>
						</div>
						<div class="col-sm-2 info">
							<h6 class="sub_tit">이번달</h6>
						</div>
						<div class="col-sm-2 info">
							<h6 class="sub_tit">바로가기</h6>
						</div>
					</div>
					
					<!-- item1 : 총 주문 금액 ----------------------------------- -->
					<div class="item1_block d-flex">
						<div class="col-sm-2 item_tit">
							<h6 class="sub_tit">총 주문 금액 (건수)</h6>
						</div>
						<div class="col-sm-2 info">
							<span class="order_todayTotal">5,000</span>
							<span>원</span>
							<span class="order_totalSub">(2건)</span>
						</div>
						<div class="col-sm-2 info">
							<span class="order_monthTotal">80,000</span>
							<span>원</span>
							<span class="order_totalSub">(10건)</span>
						</div>
						<div class="col-sm-2 info">
							<button type="button" class="btn btn-outline-secondary"
								onclick="location.href='#'">
								주문조회
							</button>
						</div>
					</div>
					
					<!-- item2 : 총 실 결제금액 ----------------------------------- -->
					<div class="item2_block d-flex">
						<div class="col-sm-2 item_tit">
							<h6 class="sub_tit">총 실 결제금액 (건수)</h6>
						</div>
						<div class="col-sm-2 info">
							<span class="order_todayPayTotal">4,500</span>
							<span>원</span>
							<span class="order_totalSub">(2건)</span>
						</div>
						<div class="col-sm-2 info">
							<span class="order_monthPayTotal">62,500</span>
							<span>원</span>
							<span class="order_totalSub">(9건)</span>
						</div>
						<div class="col-sm-2 info">
							<button type="button" class="btn btn-outline-secondary"
								onclick="location.href='#'">
								결제조회
							</button>
						</div>
					</div>
					
					<!-- item3 : 총 환불 금액 ----------------------------------- -->
					<div class="item3_block d-flex">
						<div class="col-sm-2 item_tit">
							<h6 class="sub_tit">총 환불 금액 (건수)</h6>
						</div>
						<div class="col-sm-2 info">
							<span class="order_todayCancelTotal">0</span>
							<span>원</span>
							<span class="order_totalSub">(0건)</span>
						</div>
						<div class="col-sm-2 info">
							<span class="order_monthCancelTotal">9,500</span>
							<span>원</span>
							<span class="order_totalSub">(2건)</span>
						</div>
						<div class="col-sm-2 info">
							<button type="button" class="btn btn-outline-secondary"
								onclick="location.href='#'">
								환불조회
							</button>
						</div>
					</div>
				</div>
				
				<div class="desc_block mt-2">
					<h5 class="desc_title">
						실시간 매출현황
					</h5>
					<h5 class="desc">
						- 오늘 0시부터, 혹은 이번 달 1일부터 현재까지 발생한 총 주문 금액(건수), 총 실 결제금액(건수), 총 환불 금액(건수) 정보를 확인할 수 있습니다.
					</h5>
					
					<h5 class="desc_title mt-5">
						총 주문 금액(건수)
					</h5>
					<h5 class="desc">
						- 총 주문 금액(건수)는 해당 기간 내 발생한 주문의 금액 및 건수를 집계한 현황입니다. <br>
						- 총 주문 금액에는 상품구매금액 및 배송비가 포함되어 있으며, 취소, 교환, 반품 시 반품배송비 등으로 인한 배송비 변동액도 포함하여 집계됩니다.<br>
						- 주문조회 버튼 클릭 시 [주문,결제,전체 주문 조회]로 이동하여 총 주문 목록을 확인할 수 있습니다.
					</h5>
					
					<h5 class="desc_title mt-5">
						총 실 결제금액(건수)
					</h5>
					<h5 class="desc">
						- 총 실 결제 금액(건수)는 해당 기간 내 결제완료된 금액 및 건수를 집계한 현황입니다. <br>
						- 이 때, 취소, 교환, 반품 시 반품배송비 등으로 인한 배송비 변동액도 포함하여 집계됩니다.<br>
						- 결제조회 버튼 클릭 시 [주문,결제,전체 주문 조회]로 이동하여 실 결제 목록을 확인할 수 있습니다.
					</h5>
					
					<h5 class="desc_title mt-5">
						총 환불 금액(건수)
					</h5>
					<h5 class="desc">
						- 총 환불금액(건수)는 취소, 교환, 반품에 의해 고객에게 환불된 금액과 건수 합계 정보를 집계한 현황입니다. <br>
						- 환불 금액은 실제 고객에게 환불처리된 실 환불 금액 정보를 의미합니다.<br>
						- 환불조회 버튼 클릭 시 [주문 취소/교환/반품/환불/환불 관리]로 이동하여 환불 목록을 확인할 수 있습니다.
					</h5>
				</div>
			</div>
		</div>
		
		<script src="${pageContext.request.contextPath}/resources/js/admin_sidebar.js"></script>
	</body>
</html>