<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>라이필 > 주문</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>
		
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/item/order.css">
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
			// 약관 동의 체크시에만 버튼이 활성화 되도록 하는 함수
			$(document).ready(function() {
		        $('#btnAgreePurchase').change(function() {
		            if ($(this).is(':checked')) {
		                $('#btnPayment').prop('disabled', false);
		                $('#btnPayment').css('background-color', 'black');
		            } else {
		                $('#btnPayment').prop('disabled', true);
		                $('#btnPayment').css('background-color', '#ccc');
		            }
		        });
		    });
			
			// Daum이 제공하는 우편번호 검색 기능 사용을 위한 함수 
			function DaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('zipcode').value = data.zonecode;
		                document.getElementById("address1").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("address2").focus();
		            }
		        }).open();
		    }
			
	        $(document).ready(function() {
	            $('#ordersForm').on('submit', function(event) {
	                var address1 = $('#address1').val();
	                var address2 = $('#address2').val();
	                
	                // 주소와 상세 주소를 합친 문자열
	                var fullAddress = address1 + ', ' + address2;
	                
	                // 합친 문자열을 value값으로 전달
	                $('#fullAddress').val(fullAddress);
	            });
	        });
	        
	        // 회원 정보와 동일 체크박스의 값이 변할 때 실행되는 함수
	        $(document).ready(function() {
	            $('#getMemberInfo').change(function() {
	            	
	            	var mname = $('#mname').val();
	            	var mphone = $('#mphone').val();
	            	var mzipcode = $('#mzipcode').val();
	            	var maddress = $('#maddress').val();

	            	var rname = $('#receivername').val();
	            	var rphone = $('#receiverphone').val();
	            	var rzipcode = $('#receiverzipcode').val();
	            	var raddress1 = $('#address1').val();
	            	var raddress2 = $('#address2').val();
	            	
	            	var address = maddress.split(', ');
	            	
	                if ($(this).prop('checked')) {
	                	$('#receivername').val(mname);
	                	$('#receiverphone').val(mphone);
	                	$('#receiverzipcode').val(mzipcode);
	                	$('#address1').val(address[0]);
	                	$('#address2').val(address[1]);
	                } else {
	                	$('#receivername').val('');
	                	$('#receiverphone').val('');
	                	$('#receiverzipcode').val('');
	                	$('#address1').val('');
	                	$('#address2').val('');
	                }

	            });
	        });
	        
		</script>
		
	</head>
	
	<body>
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>
		
		<div class="container">
			<div class="order_center">
				<div class="order_condition">
					<span>01. CART</span>
					<span id="here"><b>02. ORDER</b></span>
					<span>03. ORDER COMPLETED</span>
				</div>
				<!-- 주문 요청 form -->
				<form action="buyMultiple" id="ordersForm" method="post">
					<div class="order_wrap">
						<!-- 왼쪽 영역 -->
						<div class="order_left">
							<section class="order_block">
								<div class="checkbox align_right">
									<input type="checkbox" id="getMemberInfo" tabindex="0">
									<label for="getMbrInfo"><span>회원 정보와 동일</span></label>
								</div>
								<div class="form_section">
									<p class="form_label required">받는 분</p>
									<div class="form_group">
										<div class="input_clear">
											<input id="receivername" type="text" name="ordreceivername" title="받는 분 입력" placeholder="" value="">
										</div>
									</div>
									<p class="form_label required">휴대폰 번호</p>
									<div class="form_group">
										<div class="input_clear">
											<input id="receiverphone" placeholder="'-' 없이 숫자만 입력" type="text" title="주문자 휴대폰 번호 입력('-' 없이 숫자만 입력)" value="" name="ordreceiverphone">
										</div>
									</div>
									<p class="form_label required">배송 주소</p>
									<div class="form_group">
										<div class="form_set col">
											<div class="multi_input">
												<div class="input_clear">
													<input id="receiverzipcode" type="text" name="ordreceiverzipcode" id="zipcode" value="" readonly>
												</div>
												<input type="button" onclick="DaumPostcode()" value="찾기"/>
											</div>
											<div class="multi_input">
												<div class="input_clear">
													<input type="text" readonly id="address1" value="">
												</div>
											</div>
											<div class="multi_input">
												<div class="input_clear">
													<input type="text" placeholder="상세 주소를 입력해주세요." id="address2" value="">
												</div>
												<input type="hidden" id="fullAddress" name="ordreceiveraddress">
											</div>
										</div>
										<div class="form_set col">
											<div class="custom_select_wrap">
												<p class="option_selected" data-type="new">배송 요청사항 선택</p><!-- [D] : 활성상태 .is_active 추가 -->
												<select class="option_list" name="ordrequest">
													<option value="부재 시 경비실에 맡겨주세요">부재 시 경비실에 맡겨주세요</option>
													<option value="부재 시 문 앞에 놓아주세요">부재 시 문 앞에 놓아주세요</option>
													<option value="빠른 배송 부탁드려요">빠른 배송 부탁드려요</option>
													<option value="DRT_INPUT">직접 입력</option>
												</select>
											</div> 
											<div class="input_clear dlvMemoInput" style="display: none;" data-type="new">
												<input type="text" placeholder="배송기사님에게 전달되는 메시지 입니다.">
											</div>
										</div>
									</div>
								</div>
							</section>
							<section class="order_block">
								<div class="tit_area"><h3 class="tit_lv2 ">주문 상품 정보</h3></div>
									<c:forEach var="item" items="${product}" varStatus="loop">
									 <input type="hidden" name="orders[${loop.index}].prdcode" value="${item.prdcode}">
									 <input type="hidden" name="orders[${loop.index}].ordtotalamount" value="${item.ordamount}">
    								 <input type="hidden" name="orders[${loop.index}].prdtotalprice" value="${item.ordprice}">
										<ul class="order_list">
											<li class="buy_detail">
										            <div class="product_area">
														<div class="thumb_area">
															<a href="item_view">
																<span class="thumb">
																	<img src="attachDownload?prdcode=${item.prdcode}">
																</span>
															</a>
														</div>
														<div class="buy_info">
															<div class="buy_info01">
																<span class="brd_name">
																	${item.prdbrand}</span>
																<span class="prd_name">
										                        	<a href="item_view?prdcode=${item.prdcode}">${item.prdname}</a></span>
										                        	<input type="hidden" name="prdcode-v" value="${item.prdcode}"/>
										                        	<br/>
																<div class="buy_info02">
																	<p class="option">
																		<button type="button" class="info-minus" onclick="setQtyAndPrc('m')">
																			<span>-</span>
																		</button>
																		<input id="qtySpinner" name="ordtotalamount-v" type="text" class="count" min="1" value="${item.ordamount}" readonly>
																		<button type="button" class="info-plus" onclick="setQtyAndPrc('p')">
																			<span>+</span>
																		</button>
																	</p>
																</div>
															</div>
														</div>
														<div class="price_info  discount_price" id="price-value0">
															<p class="prd_price">
																<span class="real_price" data-price="${item.ordprice}">${item.ordprice}</span>원
															</p>
														</div>
													</div>
												</li>
											</ul>
									</c:forEach>
							</section>
						</div>
						
						<!-- 오른쪽 구매 박스 영역 -->
						<div class="order_right">
							<div class="sticky_purchase on">
								<div class="total_sum_info">
									<div class="tit_area"><h3 class="tit_lv2 ">결제 정보</h3></div>
									<dl class="total_sum">
										<dt>총 결제 금액</dt>
										<dd id="price-sum2">0원</dd>
									</dl>
									<input id="total-price" type="hidden" name="ordtotalprice" value=""/>
									<dl class="total_sum_detail">
										<dt>총 상품 금액</dt>
										<dd id="price-sum3">0원</dd>
										<dt>총 배송비</dt>
										<dd id="deliverySum">0원</dd>
										<dt>정기 구독 할인 금액</dt>
										<dd id="subscribeSum">0원</dd>
									</dl>
									<div class="agree_box">
										<div class="agree_cont">
											<div class="terms_cont">
												<p>주문할 상품의 상품명, 상품가격, 배송정보 등 판매 조건을 확인하였으며 구매 진행에 동의하시겠습니까?</p></div>
										</div>
										<div class="agree_header">
											<div class="checkbox">
												<input type="checkbox" id="btnAgreePurchase" value="Y" tabindex="0">
												<label for="btnAgreePurchase"><span>주문 약관동의</span></label>
											</div>
										</div>
									</div>
								</div>
								<div class="total_order_wrap">
									<div class="btn_big_wrap">
										<button type="submit" id="btnPayment" class="order_btn" disabled>결제하기</button>
									</div>
								</div>
								
							</div>
						</div>

					</div>
					
				</form>
					
					
				<script defer src="${pageContext.request.contextPath}/js/sign_up.js"> </script>
		       	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		       	
		       	<input id="mname" type="hidden" value="${member.mname}">
				<input id="mphone" type="hidden" value="${member.mphone}">
				<input id="mzipcode" type="hidden" value="${mzipcode}">
				<input id="maddress" type="hidden" value="${maddress}">
		       	
		       	<script>
			       	$(document).ready(function () {
			       	    function calculateTotal() {
			       	        let total = 0;
			       	        $('.real_price').each(function () {
			       	            total += parseFloat($(this).data('price'));
			       	        });
			       	        $('#price-sum2, #price-sum3').text(total + '원');
			       	        $('#total-price').val(total);
			       	    }
			       	    calculateTotal();
			       	});
			       	
			      
		       	</script>
			</div>
		</div>
		<!--------------- footer ---------------->
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</body>
</html>