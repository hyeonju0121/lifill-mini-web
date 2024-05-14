<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Insert title here</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>
		
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/item/order.css">
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
			// 수량 버튼 함수
			function count(n)  {
	        	// 결과를 표시할 element
	            const element = $('#qtySpinner');
	              
	            // 현재 화면에 표시된 값
	            var number = element.val();
	            
	            // 더하기/빼기
	            if(n === 1) {
	              number = parseInt(number) + 1;
	            } else {
	              	if (number == 1) {
	           	    number = 1;
	            	} else {
		                number = parseInt(number) - 1;	            		  
	            	  }
	              }
	              
	            // 결과 출력
	            element.val(number);
	         }
			
			function setQtyAndPrc(type) {
				
				// 수량을 변경하는 함수를 호출
				if ( type === 'p' ) {
					count(1);
				} else if ( type === 'm' ) {
					count(-1);
				}
				
				// 바뀐 수량을 변수에 담고 숫자 타입으로 변환
				var qty = $("#qtySpinner").val();
				qty = parseInt(qty);
				
				// 상품 가격을 변수에 담고 숫자 타입으로 변환
				var prc =  $("#hidden-price").val();
		        prc =  parseInt(prc);
		        
				var total = qty * prc;
				
		        var outputP = $("#price-sum1");
		        var outputP2 = $("#price-sum2");
		        var outputP3 = $("#price-sum3");
		       
	            outputP.text(total + "원");
	            outputP2.text(total + "원");
	            outputP3.text(total + "원");
			}
			
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
			
			function sample6_execDaumPostcode() {
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
		                document.getElementById('sample6_postcode').value = data.zonecode;
		                document.getElementById("sample6_address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("sample6_detailAddress").focus();
		            }
		        }).open();
		    }
		</script>
		
	</head>
	
	<body>
		
		<div class="container">
			<div class="order_center">
				<div class="order_condition">
					<span>01. CART</span>
					<span id="here"><b>02. ORDER</b></span>
					<span>03. ORDER COMPLETED</span>
				</div>
				
				<form action="/" name="orderDTO" id="orderDTO" method="post">
					<div class="order_wrap">
						<!-- 왼쪽 영역 -->
						<div class="order_left">
							<section class="order_block">
								<div class="tit_area">
									<h3 class="tit_lv2 ">배송 정보</h3>
									<div class="checkbox">
										<input type="checkbox" name="baseDlvspYn" id="baseDlvspYn" value="Y" tabindex="0" checked="">
										<label for="baseDlvspYn"><span>기본 배송지로 등록</span></label>
									</div>
								</div>
								
								<div class="checkbox align_right">
									<input type="checkbox" name="getMbrInfo" id="getMbrInfo" tabindex="0">
									<label for="getMbrInfo"><span>회원 정보와 동일</span></label>
								</div>
								
								<div class="form_section">
									<p class="form_label required">주문 고객</p>
									<div class="form_group">
										<div class="input_clear">
											<input type="text" title="주문 고객 입력" id="newCstmrNm" value="" new-validate="required;" maxlength="33">
											<button type="button" class="clear_btn"><span class="blind">삭제</span></button>
											<p class="err_txt" id="validatorNewCstmrNm"></p>
										</div>
									</div>
									<p class="form_label required">받는 분</p>
									<div class="form_group">
										<div class="input_clear">
											<input type="text" title="받는 분 입력" placeholder="" id="newAddrseNm" value="" new-validate="required;" maxlength="33">
											<button type="button" class="clear_btn"><span class="blind">삭제</span></button>
											<p class="err_txt" id="validatorNewAddrseNm"></p>
										</div>
									</div>
									<p class="form_label required">휴대폰 번호</p>
									<div class="form_group">
										<div class="input_clear">
											<input type="hidden" id="newAddrseMobilNationNo" value="82">
											<input placeholder="'-' 없이 숫자만 입력" type="text" title="주문자 휴대폰 번호 입력('-' 없이 숫자만 입력)" id="newAddrseMobilNo" onkeyup="onlyNumber3(this)" value="" new-validate="required;digit;rangelength:10 11;digit;phone;" maxlength="13">
											<button type="button" class="clear_btn"><span class="blind">삭제</span></button>
											<p class="err_txt" id="validatorNewAddrseMobilNo"></p>
										</div>
									</div>
									<p class="form_label required">배송 주소</p>
									<div class="form_group">
										<div class="form_set col">
											<div class="multi_input">
												<div class="input_clear">
													<input type="hidden" id="newAddrSectCd" value="">
													<input type="text" title="배송주소 우편번호" id="newAddrsePostNo" value="" readonly="" new-validate="required;postno" maxlength="7">
													<button type="button" class="clear_btn"><span class="blind">삭제</span></button>
												</div>
												<<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호"/>
											</div>
											<div class="multi_input">
												<div class="input_clear">
													<input type="text" title="주소" readonly="" id="newAddrseBaseAddr" value="" new-validate="required;xssquotation" maxlength="100">
													<button type="button" class="clear_btn"><span class="blind">삭제</span></button>
												</div>
											</div>
											<div class="multi_input">
												<div class="input_clear">
													<input type="text" title="상세주소 입력" placeholder="상세 주소를 입력해주세요." id="newAddrseDetailAddr" value="" new-validate="required;xssquotation" maxlength="66">
													<button type="button" class="clear_btn"><span class="blind">삭제</span></button>
													<p class="err_txt" id="validatorNewAddrseDetailAddr"></p>
												</div>
											</div>
										</div>
										<div class="form_set col">
											<div class="custom_select_wrap" id="noDlvInfoDiv2">
												<button type="button" class="option_selected" id="newDlvMemo" data-type="new">배송 요청사항 선택</button><!-- [D] : 활성상태 .is_active 추가 -->
												<select class="option_list" style="display: block;"><!-- [D] : 활성상태 .is_active 추가 -->
													<option><button type="button" data-value="부재 시 경비실에 맡겨주세요" data-type="new" onclick="changeInput(this);" class="option">부재 시 경비실에 맡겨주세요</button></option>
													<option><button type="button" data-value="부재 시 문 앞에 놓아주세요" data-type="new" onclick="changeInput(this);" class="option">부재 시 문 앞에 놓아주세요</button></option>
													<option><button type="button" data-value="배송 전에 연락주세요" data-type="new" onclick="changeInput(this);" class="option">배송 전에 연락주세요</button></option>
													<option><button type="button" data-value="빠른 배송 부탁드려요" data-type="new" onclick="changeInput(this);" class="option">빠른 배송 부탁드려요</button></option>
													<option><button type="button" data-value="DRT_INPUT" data-type="new" onclick="changeInput(this);" class="option">직접 입력</button></option>
												</select>
											</div> 
											<div class="input_clear dlvMemoInput" id="newDlvMemoInputDiv" style="display: none;" data-type="new">
												<input type="text" title="배송시 요청사항 직접 입력" placeholder="배송기사님에게 전달되는 메시지 입니다." id="newDlvMemoInput" maxlength="33">
												<button type="button" class="clear_btn"><span class="blind">삭제</span></button>
											</div>
										</div>
								
									</div>
								</div>
							</section>
							
							<section class="order_block">
											<div class="tit_area"><h3 class="tit_lv2 ">주문 상품 정보 (1건)</h3></div>
							
							<ul class=" order_list">
								<li class="buy_detail">
							            <div class="product_area">
											<div class="thumb_area">
												<a href="item_view">
													<span class="thumb">
														<img src="attachDownload?prdcode=${product.prdcode}" alt="">
													</span>
												</a>
											</div>
											<div class="buy_info">
												<div class="buy_info01">
													<span class="brd_name">
														${product.prdbrand}</span>
													<span class="prd_name">
							                        	<a href="item_view?prdcode=${product.prdcode}">${product.prdname}</a></span>
							                        	<br/>
													<div class="buy_info02">
														<p class="option"><!-- data-ga-variant="BEIGE/L" -->
															<button type="button" name="button" class="info-minus" onclick="setQtyAndPrc('m')">
																<span>-</span>
															</button>
															<input id="qtySpinner" name="quantity" type="text" title="수량 선택" class="count" data-page="productDetail" data-min="1" data-txt="inv" min="1" value="${amount}" readonly>
															<button type="button" name="button" class="info-plus" onclick="setQtyAndPrc('p')">
																<span>+</span>
															</button>
														</p>
													</div>
												</div>
											</div>
											<div class="price_info  discount_price" id="price-value0">
												<p class="prd_price">
													<span id="price-sum1" class="real_price">${price}</span>
													<input id="hidden-price" type="hidden" value="${product.prdprice}">
												</p>
											</div>
										</div>
									</li>
								</ul>
							
							</section>
							
						</div>
						
						<!-- 오른쪽 구매 박스 영역 -->
						<div class="order_right">
							<div class="sticky_purchase on">
								<div class="total_sum_info">
									<div class="tit_area"><h3 class="tit_lv2 ">결제 정보</h3></div>
									<dl class="total_sum">
										<dt>총 결제 금액</dt>
										<dd id="price-sum2">${price}원</dd>
									</dl>
									<dl class="total_sum_detail">
										<dt>총 상품 금액</dt>
										<dd id="price-sum3">${price}원</dd>
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
										<button type="submit" id="btnPayment" class="paySum" disabled>결제하기</button>
									</div>
								</div>
								
							</div>
						</div>


					</div>
				</form>
				<script defer src="${pageContext.request.contextPath}/js/sign_up.js"> </script>
		       			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			</div>
		</div>
	</body>
</html>