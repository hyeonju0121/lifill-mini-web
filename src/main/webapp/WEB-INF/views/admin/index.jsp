<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>관리자 - 라이필</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리  설정-->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		
		<!-- 사용자 정의 자바스크립트 -->
		
		<script>
			
		</script>
	</head>
	
	<body>
		<div class="card">
		    <div class="card-header">관리자 로그인 메인 화면</div>
		    <div class="card-body">
				<ul>
					<li><a href="admin/admin_login">관리자 - 로그인</a></li>
					<li><a href="admin/admin_main">관리자 - 메인페이지</a></li>
					<li><a href="admin/create_item">관리자 - 상품 등록</a></li>
		    		<li><a href="admin/read_item">관리자 - 상품 조회</a></li>
					<li><a href="admin/update_item">관리자 - 상품 수정</a></li>
					<li><a href="admin/delete_item">관리자 - 상품 삭제</a></li>
					<li><a href="admin/read_order">관리자 - 주문 조회</a></li>
					<li><a href="admin/change_order">관리자 - 주문 상태 변경</a></li>
					<li><a href="admin/delete_order">관리자 - 주문 취소</a></li>
		    	</ul>
			</div> 
		</div>
	</body>
</html>