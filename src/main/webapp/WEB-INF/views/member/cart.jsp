<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" >
		<title>장바구니 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.7.1.min.js"></script>

		<!-- external css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cart.css">

	</head>
	
	<body>
		<!-- 네비게이션 바  ------------------------------------------------------------------------>
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>
		
		<!-- cart page ------------------ -->
		<div class="container mt-5">
			<h2 style="text-align:center;"> 장바구니</h2>
			<div class="row">
				<div class="col-sm-8 mt-5">
					<div class="cart-table">
						<table class="table p-2">
							<thead>
								<tr>
									<!-- <th><input type="checkbox" name="allCheck" id="allCheck" onclick="allselect(this.checked);"/></th>-->
									<!-- 체크박스 전체 여부 -->
									<th class="all_check_input_div">
										<input type="checkbox" class="all_check_input input_size_20" checked="checked">
									</th>
									
									<th class="product-h">상품</th>
									<th>수량</th>
									<th>가격</th>
									<th></th>
								</tr>
							</thead>
							
							<tbody>
							
								<c:if test="${totalCnt == 0}">
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td>
											<div style="margin-top:30px; margin-bottom:30px; font-size:20px;">
												장바구니가 비었습니다.
											</div>
										</td>
										<td></td>
									</tr>
								</c:if>
								
								<c:if test="${totalCnt != 0}">
									<c:forEach var="cartItem" items="${cartItemList}">
										<tr>
										<!-- item1 ------------------------------------------------- -->
										<!-- 체크박스 -->
										<td class="cart_info_td">
											<input type="checkbox" class="individual_cart_checkbox input_size_20" checked="checked"/>
											<input type="hidden" class="individual_itemPrice_input" value="${cartItem.prdprice}">
											<input type="hidden" class="individual_itemCount_input" value="${cartItem.camount}">
											<input type="hidden" class="individual_totalPrice_input" value="${cartItem.prdprice * cartItem.camount}">
											
											<input type="hidden" class="individual_itemPrdcode_input" value="${cartItem.prdcode}">
											<!--<input type="hidden" class="individual_totalPrice_input" value="${cartItem.cprice}">-->
											
											<!--<input type="checkbox" name="chk" id="check1" onclick="checked();"/>-->
										</td>
										<!-- 상품 이미지 -->
										<td class="procuct-col">
											<div class="d-flex product-img">
												<img src="attachDownload?prdcode=${cartItem.prdcode}" class="rounded-3" style="width:130px;height:130px;"/>
												<div class="p-content mt-4 ms-2">
													<h6 class="p-name">[${cartItem.prdbrand}]</h6>
													<h6><a href="${pageContext.request.contextPath}/item/item_view?prdcode=${cartItem.prdcode}">${cartItem.prdname}</a></h6>
												</div>
											</div>
										</td>
										<!-- 상품 수량 -->
										<td width="20%">
											<div class="count-button mt-4">
												<div class="count_set">
													<button type="button" name="button" class="info-minus">
														<span>-</span>
													</button>
														<input id="qtySpinner" name="quantity" type="text" 
															title="수량 선택" class="count" data-page="productDetail" 
															data-min="1" data-txt="inv" min="1" value="${cartItem.camount}" readonly>
													<button type="button" name="button" class="info-plus">
														<span>+</span>
													</button>
												</div>
											</div>
												<a class="quantity_modify_btn" data-cartId="${ci.cartId}">수량 변경</a>
										</td>
										<!-- 상품 가격 -->
										<td class="product-price">
											<div class="product-count d-flex justify-content-center">
												<!--<p class="total" id="tprice">${cartItem.cprice}</p>-->
												<input id="qtySpinner-change" type="text" class="total-price" value="${cartItem.cprice}" readonly>
											
												<!-- <h4 class="p-price mt-4" id='total-price'>29800</h4>
												<h4 class="ms-1 mt-4">원</h4>-->
											</div>
										</td>
										
										<!-- 상품 삭제 버튼 -->
										<td class="product-close">
											<button class="btn ms-3 mt-2" onclick="productRemove()">
												<img class="remove-img"
													src="${pageContext.request.contextPath}/resources/image/icon/x.png"/>
											</button>
										</td>
										</tr>
									
									</c:forEach>
								</c:if>
								
							</tbody>
						</table>				
					</div>
				</div>
				
				<div class="col-sm-4 mt-5">
					<div class="card bg-light w-100 ms-2 mb-3" style="max-width: 18rem;">
					  <div class="card-body">
					  		<div class="row mt-2">
						    <div class="col card-text">
						      	<h5>상품 금액</h5>
						    </div>
						    <div class="col card-text">
						      	<h5 class="totalPrice_span">45,700</h5>
						    </div>
						 </div>
						 <div class="row mt-3 mb-5">
						    <div class="col card-text">
						      	<h5>배송비</h5>
						    </div>
						    <div class="col card-text">
						      	<h5>+0원</h5>
						    </div>
						     <div class="row mt-3 mb-3">
							    <div class="col card-text">
							      	<h6 style="font-size:15px">(라이필은 현재 <strong id="text-strong">무료배송</strong>입니다.)</h6>
							    </div>
							 </div>
						 </div>
						 <hr>
						 <div class="row mt-3 mb-3">
						    <div class="col card-text">
						      	<h5>결제예정금액</h5>
						    </div>
						    <div class="col card-text">
						      	<h5 class="totalPrice_span">45,700</h5>
						    </div>
						 </div>
					  </div>
					  
					  </div>
					  
					  <div class="d-grid gap-2 col-8 ms-2">
						  <button class="order_btn btn btn-outline-primary btn-lg" type="button">결제하기</button>
					  </div>
						
					  <div class="row mt-3">
						  <h6 style="font-size:14px">[주문완료] 상태일 경우에만 주문 취소가 가능합니다.</h6>
						  <h6 style="font-size:14px">[마이필 > 주문내역 상세페이지]에서 직접 취소하실 수 있습니다.</h6>
					  </div>
					</div>
				</div>
			</div>
			
			<!-- 주문 form -->
			<form action="${pageContext.request.contextPath}/item/buyOnCart" method="get" class="order_form">
			</form>
			
			<script>
			
			/*
				$(".order_btn").on("click", function() {
					let form_contents='';
					let orderNumber = 0;
					
					
					// 상품 데이터가 저장된 <input> 값들을 감싸고 있는 <td> 태그를 반복해서 접근하는 메소드 
					$(".cart_info_td").each(function(index, element) {
						if($(element).find(".individual_cart_checkbox").is(":checked") === true){
							// 상품 코드 
							let prdcode = $(element).find(".individual_itemPrdcode_input").val();
							// 상품 총 수량 
							let ordtotalamount = $(element).find(".individual_itemCount_input").val();
							// 상품 총 가격  
							let prdtotalprice = $(element).find(".individual_totalPrice_input").val();
							
							// 서버로 전송할 <input> 태그를 문자열 값으로 만들고 form_contents 에 추가 
							let prdcode_input = "<input name='orders[" + orderNumber + "].prdcode' type='hidden' value='" + prdcode + "'>";
							form_contents += prdcode_input;
							
							let ordtotalamount_input = "<input name='orders[" + orderNumber + "].ordtotalamount' type='hidden' value='" + ordtotalamount + "'>";
							form_contents += ordtotalamount_input;
							
							let prdtotalprice_input = "<input name='orders[" + orderNumber + "].prdtotalprice' type='hidden' value='" + prdtotalprice + "'>";
							form_contents += prdtotalprice_input;
							
							orderNumber += 1;
						}
					});
					
					$(".order_form").html(form_contents);
					$(".order_form").submit();
					
				})
			*/
			
				$(document).ready(function() {
					// 장바구니 정보 섹션 정보 삽입 
				    setTotalInfo();
	
				    // 체크여부에 따른 장바구니 정보 변화
				    $(".individual_cart_checkbox").on("change", function() {
				        
				    	// 총 주문 정보 셋팅 
				    	setTotalInfo();
				    });
	
				    // 체크박스 전체 선택
				    $(".all_check_input").on("click", function() {
				        $(".individual_cart_checkbox").prop("checked", $(this).prop("checked"));
				        
				     	// 총 주문 정보 셋팅 
				        setTotalInfo();
				    });
	
				    // 수량 조절 버튼
				    $(".info-plus").on("click", function() {
				    	// 현재 버튼이 속한 행과 수량을 찾음 
				        let row = $(this).closest("tr");
				        let quantityInput = row.find(".count");
				        
				        let quantity = parseInt(quantityInput.val());
				        quantityInput.val(++quantity);
	
				        let prc = parseInt(row.find(".individual_itemPrice_input").val());
				        let total = quantity * prc;
				        // 해당 행에 디스플레이 표시 (화면에 변동된 금액 표시)
				        row.find(".total-price").val(total.toLocaleString());
	
				     	// 총 주문 정보 셋팅 
				        setTotalInfo();
				    });
	
				    $(".info-minus").on("click", function() {
				    	// 현재 버튼이 속한 행과 수량을 찾음 
				        let row = $(this).closest("tr");
				        let quantityInput = row.find(".count");
				        
				        let quantity = parseInt(quantityInput.val());
	
				        if (quantity > 1) {
				            quantityInput.val(--quantity);
				            
				            let prc = parseInt(row.find(".individual_itemPrice_input").val());
				            let total = quantity * prc;
				            
				         	// 해당 행에 디스플레이 표시 (화면에 변동된 금액 표시)
				            row.find(".total-price").val(total.toLocaleString());
				        }
	
				        // 총 주문 정보 셋팅 
				        setTotalInfo();
				    });
				    
				    // 주문하기 버튼
				    $(".order_btn").on("click", function() {
			            let form_contents = '';
			            let orderNumber = 0;

			            $(".cart_info_td").each(function(index, element) {
			                if ($(element).find(".individual_cart_checkbox").is(":checked") === true) {
			                    let prdcode = $(element).find(".individual_itemPrdcode_input").val();
			                    let ordtotalamount = $(element).closest("tr").find(".count").val();
			                    let prdtotalprice = $(element).closest("tr").find(".total-price").val().replace(/,/g, '');

			                    let prdcode_input = "<input name='orders[" + orderNumber + "].prdcode' type='hidden' value='" + prdcode + "'>";
			                    form_contents += prdcode_input;

			                    let ordtotalamount_input = "<input name='orders[" + orderNumber + "].ordtotalamount' type='hidden' value='" + ordtotalamount + "'>";
			                    form_contents += ordtotalamount_input;

			                    let prdtotalprice_input = "<input name='orders[" + orderNumber + "].prdtotalprice' type='hidden' value='" + prdtotalprice + "'>";
			                    form_contents += prdtotalprice_input;

			                    orderNumber += 1;
			                }
			            });

			            $(".order_form").html(form_contents);
			            $(".order_form").submit();
			        });
				    
				});
			
				function setTotalInfo() {
				    let totalPrice = 0; // 총 가격 
				    let totalCount = 0; // 총 갯수 
				    let totalKind = 0; // 총 종류 
				    let finalTotalPrice = 0; // 최종 가격

				    $(".individual_cart_checkbox:checked").each(function(index, element) {
				        let row = $(this).closest("tr");
				        let quantity = parseInt(row.find(".count").val());
				        let prc = parseInt(row.find(".individual_itemPrice_input").val()); // 상품 원가 갖고옴 
				        let total = quantity * prc; // 상품 수량 * 상품 원가 
				        
				        totalPrice += total;
				        totalCount += quantity;
				        totalKind++;
				    });

				    finalTotalPrice = totalPrice;

				    $(".totalPrice_span").text(totalPrice.toLocaleString());
				    $(".totalCount_span").text(totalCount);
				    $(".totalKind_span").text(totalKind);
				    $(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
				}
			
			</script>
		
	</body>
	
</html>