<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				
				// 매개변수로 보낼 input 태그에 결제 금액을 value로 저장
				var tprice = $("#total-price").val(total);
				
				// 단순 가격 출력을 위한 text 변경 코드
		        var outputP = $("#price-sum1");
		        var outputP2 = $("#price-sum2");
		        var outputP3 = $("#price-sum3");
		       
	            outputP.text(total + "원");
	            outputP2.text(total + "원");
	            outputP3.text(total + "원");
			}
			
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
	            $('#orderForm').on('submit', function(event) {
	                var address1 = $('#address1').val();
	                var address2 = $('#address2').val();
	                
	                // 주소와 상세 주소를 합친 문자열
	                var fullAddress = addressPart1 + ', ' + addressPart2;
	                
	                // 합친 문자열을 value값으로 전달
	                $('#fullAddress').val(fullAddress);
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
					<span>02. ORDER</span>
					<span id="here"><b>03. ORDER COMPLETED</b></span>
				</div>
			</div>
			<div>
			<p>주문이 완료되었습니다!</p>
			
				<div>
					<span>주문번호 확인, 배송 조회 등은 마이페이지 > 주문 내역 조회 탭에서 확인 가능합니다.</span>
					<span>최대한 신속하고 안전하게 상품을 배송해드리겠습니다.</span>
				</div>
			
			</div>
		</div>
		<!--------------- footer ---------------->
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</body>
</html>