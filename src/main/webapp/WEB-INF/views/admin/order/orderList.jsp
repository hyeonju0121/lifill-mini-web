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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/order/orderList.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/sidebar.css">
	</head>
	
	<body>
		<div class="wrapper">
			<!-- sidebar -->
			<jsp:include page="/WEB-INF/views/admin/common/admin_sidebar.jsp"/>

			<!-- contents -->
			<div class="main p-3">
				<div class="item-section mt-2 mb-2" style="font-size: 12px">
				주문 관리 > 전체 주문 조회
				</div>
			
				<div class="headingArea">
					<div class="title">
						<h1 id="itemTitle">전체 주문 조회</h1>
					</div>
				</div>
				
				<div class="section_block">
					<div class="sub bg-light">
						<div class="sub2 col-sm-8 mt-2">
							<ul>
								<li class="sub-li">전체 <span class="itemTotalCount">21</span>건 |</li>
								<li class="sub-li">미배송 <span class="itemTotalCount">0</span>건 |</li>
								<li class="sub-li">배송중 <span class="itemTotalCount">15</span>건 |</li>
								<li class="sub-li">배송완료 <span class="itemTotalCount">6</span>건</li>
							</ul>
						</div>
					</div>
					
					<div class="container mt-3">
					  <!-- <h2>전체 상품 목록</h2> -->
					  <table class="table">
					    <thead class="table-dark">
					      <tr>
					        <th>No</th>
					        <th>주문번호</th>
					        <th>주문자</th>
					        <th>총 실결제금액</th>
					        <th>결제수단</th>
					        <th>결제상태</th>
					        <th>배송상태</th>
					        <th>주문상태</th>
					        <th>주문일시</th>
					        <th>수정/삭제</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr>
					        <td>1</td>
					        <td>20240422-0000001</td>
					        <td>유현주</td>
					        <td>KRW 29,800</td>
					        <td>무통장입금</td>
					        <td>결제완료</td>
					        <td>배송준비중</td>
					        <td>-</td>
					        <td>2024-04-22 09:28</td>
					        <td>
					        	<div class="btn_big_wrap">
									<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/order/orderUpdate'" class="btn btn-outline-dark">수정</button>
									<button type="button" onclick="location.href='#'" class="btn btn-outline-dark">삭제</button>
								</div>
					        </td>
					      </tr>
					      <tr>
					        <td>2</td>
					        <td>20240422-0000002</td>
					        <td>변성준</td>
					        <td>KRW 76,200</td>
					        <td>신용카드</td>
					        <td>결제완료</td>
					        <td>배송중</td>
					        <td>-</td>
					        <td>2024-04-22 15:15</td>
					        <td>
					        	<div class="btn_big_wrap">
									<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/order/orderUpdate'" class="btn btn-outline-dark">수정</button>
									<button type="button" onclick="location.href='#'" class="btn btn-outline-dark">삭제</button>
								</div>
					        </td>
					      </tr>
					      <tr>
					        <td>3</td>
					        <td>20240422-0000003</td>
					        <td>곽동현</td>
					        <td>KRW 45,800</td>
					        <td>무통장입금</td>
					        <td>결제완료</td>
					        <td>배송준비중</td>
					        <td>-</td>
					        <td>2024-04-22 17:00</td>
					        <td>
					        	<div class="btn_big_wrap">
									<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/order/orderUpdate'" class="btn btn-outline-dark">수정</button>
									<button type="button" onclick="location.href='#'" class="btn btn-outline-dark">삭제</button>
								</div>
					        </td>
					      </tr>
					      <tr>
					        <td>4</td>
					        <td>20240422-0000004</td>
					        <td>홍길동</td>
					        <td>KRW 24,500</td>
					        <td>무통장입금</td>
					        <td>결제완료</td>
					        <td>-</td>
					        <td>취소(환불대기중)</td>
					        <td>2024-04-22 19:07</td>
					        <td>
					        	<div class="btn_big_wrap">
									<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/order/orderUpdate'" class="btn btn-outline-dark">수정</button>
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