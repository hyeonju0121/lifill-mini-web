<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Insert title here</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		
		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/item/order.css">
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
			
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
				
				<form action="#" name="orderDTO" id="orderDTO" method="post">
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
									<p class="form_label">배송지명</p>
									<div class="form_group">
										<div class="input_clear">
											<input type="text" id="adbukNm" maxlength="10" title="배송지명 입력">
											<button type="button" class="clear_btn"><span class="blind">삭제</span></button>
										</div>
									</div>
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
												<button type="button" class="btn sm white searchPostNo" data-type="new">우편번호</button>
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
												<ul class="option_list" style="display: block;"><!-- [D] : 활성상태 .is_active 추가 -->
													<li><button type="button" data-value="부재 시 경비실에 맡겨주세요" data-type="new" onclick="changeInput(this);" class="option">부재 시 경비실에 맡겨주세요</button></li>
													<li><button type="button" data-value="부재 시 문 앞에 놓아주세요" data-type="new" onclick="changeInput(this);" class="option">부재 시 문 앞에 놓아주세요</button></li>
													<li><button type="button" data-value="배송 전에 연락주세요" data-type="new" onclick="changeInput(this);" class="option">배송 전에 연락주세요</button></li>
													<li><button type="button" data-value="빠른 배송 부탁드려요" data-type="new" onclick="changeInput(this);" class="option">빠른 배송 부탁드려요</button></li>
													<li><button type="button" data-value="DRT_INPUT" data-type="new" onclick="changeInput(this);" class="option">직접입력</button></li>
												</ul>
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
														<img src="${pageContext.request.contextPath}/resources/image/item_rep/eye/eye3_image1.png" alt="">
													</span>
												</a>
											</div>
											<a class="buy_info">
												<div class="buy_info01">
													<span class="brd_name">
														effekt.</span>
													<span class="prd_name">
							                        	초임계 루테인아스타잔틴 코어</span>
												</div>
												<div class="buy_info02">
													<p class="option"><!-- data-ga-variant="BEIGE/L" -->
														<em>1</em>개
													</p>
												</div>
											</a>
											<div class="price_info  discount_price" id="price-value0">
												<p class="prd_prcie">
													<span class="real_price">29,800</span>
												</p>
											</div>
										</div>
									</li>
								</ul>
							
							</section>
							
							<section class="order_block">
								<div class="tit_area">
									<h3 class="tit_lv2 ">결제 방법</h3>
									<div class="checkbox">
										<input type="checkbox" name="dfPayMnCdYn" id="dfPayMnCdYn" value="Y" tabindex="0">
										<label for="dfPayMnCdYn"><span>기본 결제수단으로 저장</span></label>
									</div>
								</div>
								<div class="payment">
									<ul class="option_box option_2 radio_select">
										<li class="option">
											<input id="chkProd1" type="radio" name="pay.payMnCd" value="CREDT_CARD_PAY">
											<label for="chkProd1">신용카드</label>
										</li>
										<li class="option">
											<input id="chkProd2" type="radio" name="pay.payMnCd" value="RLTM_BNK_ACCT_PAY">
											<label for="chkProd2">실시간 계좌이체</label>
										</li>
									</ul>
								</div>
							</section>
						</div>
						
						<!-- 오른쪽 구매 박스 영역 -->
						<div class="order_right">
							<div class="sticky_purchase on">
								<div class="total_sum_info">
									<div class="tit_area"><h3 class="tit_lv2 ">결제 정보</h3></div>
									<dl class="total_sum">
										<dt>총 결제 금액</dt>
										<dd id="paySum"><em>29,800</em>원</dd>
									</dl>
									<dl class="total_sum_detail">
										<dt>총 상품 금액</dt>
										<dd>29,800원</dd>
										<dt>총 배송비</dt>
										<dd id="deliverySum">0원</dd>
										<dt>정기 구독 할인 금액</dt>
										<dd id="subscribeSum">0원</dd>
									</dl>
			
									<div class="agree_box">
										<div class="agree_header">
											<div class="checkbox">
												<input type="checkbox" id="btnAgreePurchase" value="Y" tabindex="0">
												<label for="btnAgreePurchase"><span>주문 약관동의</span></label>
											</div>
										</div>
										<button type="button" class="agree_view_btn"><span class="blind">약관보기</span></button>
										<div class="agree_cont">
											<div class="terms_cont">
												<p>주문할 상품의 상품명, 상품가격, 배송정보 등 판매 조건을 확인하였으며 구매 진행에 동의하시겠습니까?</p></div>
										</div>
									</div>
			
								</div>
								
								<div class="total_order_wrap">
									<div class="btn_big_wrap">
										<button type="button" id="btnPayment" class="paySum">29,800원 결제하기</button>
									</div>
								</div>
								
							</div>
						</div>


					</div>
				</form>
			</div>
		</div>
	</body>
</html>