<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<aside id="sidebar">
	<div class="d-flex">
		<button id="toggle-btn" type="button">
			<i class="lni lni-grid-alt"></i>
		</button>
		<div class="sidebar-logo">
			<a href="#">LIFILL</a>
		</div>
	</div>
	
	<ul class="sidebar-nav">
		<!-- 관리자 프로필 (관리자 정보 수정) -->
		<li class="sidebar-item">
			<a href="#" class="sidebar-link"> 
				<i class="lni lni-user"></i>
				<span>관리자 프로필</span>
			</a>
		</li>

		<!-- 회원 관리 (회원 조회, 회원정보 수정 및 탈퇴) -->
		<li class="sidebar-item">
			<a href="#" class="sidebar-link has-dropdown collapsed" data-bs-toggle="collapse"
				data-bs-target="#member" aria-expanded="false" aria-controls="member">
				<i class="lni lni-users"></i>
				<span>회원 관리</span>
			</a>
			
			<ul id="member" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
				<li class="sidebar-item">
					<a href="${pageContext.request.contextPath}/admin/member/memberList" class="sidebar-link">전체 회원 조회</a>
				</li>
				<!-- <li class="sidebar-item">
					<a href="#" class="sidebar-link">회원정보 수정 및 탈퇴</a>
				</li> -->
			</ul>
		</li>

		<!-- 상품 관리 (상품 등록, 상품 목록(내부: 수정 및 삭제)) -->
		<li class="sidebar-item">
			<a href="#" class="sidebar-link has-dropdown collapsed" data-bs-toggle="collapse"
				data-bs-target="#product" aria-expanded="false" aria-controls="product">
				<i class="lni lni-cart"></i>
				<span>상품 관리</span>
			</a>
			<ul id="product" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
				<li class="sidebar-item">
					<a href="${pageContext.request.contextPath}/admin/item/dashboard" class="sidebar-link">대시보드</a>
				</li>
				<li class="sidebar-item">
					<a href="${pageContext.request.contextPath}/admin/item/create" class="sidebar-link">상품 등록</a>
				</li>
				<li class="sidebar-item">
					<a href="${pageContext.request.contextPath}/admin/item/itemList" class="sidebar-link">전체 상품 목록</a>
				</li>
			</ul>
		</li>
		
		<!-- 주문 관리 (주문 조회, 수정 및 삭제) -->
		<li class="sidebar-item">
			<a href="#" class="sidebar-link has-dropdown collapsed" data-bs-toggle="collapse"
				data-bs-target="#order" aria-expanded="false" aria-controls="order">
				<i class="lni lni-delivery"></i>
				<span>주문 관리</span>
			</a>
			<ul id="order" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
				<li class="sidebar-item">
					<a href="${pageContext.request.contextPath}/admin/order/dashboard" class="sidebar-link">대시보드</a>
				</li>
				<li class="sidebar-item">
					<a href="${pageContext.request.contextPath}/admin/order/orderList" class="sidebar-link">전체 주문 조회</a>
				</li>
			</ul>
		</li>

		<!-- 게시판 관리 (공지사항, 고객문의, Q&A) -->
		<li class="sidebar-item">
			<a href="#" class="sidebar-link has-dropdown collapsed" data-bs-toggle="collapse"
				data-bs-target="#board" aria-expanded="false" aria-controls="board">
				<i class="lni lni-clipboard"></i>
				<span>고객센터 관리</span>
			</a>
			<ul id="board" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
				<li class="sidebar-item">
					<a href="${pageContext.request.contextPath}/admin/board/noticeList" class="sidebar-link">공지사항</a>
				</li>
				<li class="sidebar-item">
					<a href="${pageContext.request.contextPath}/admin/board/faqList" class="sidebar-link">자주묻는질문</a>
				</li>
				<li class="sidebar-item">
					<a href="#" class="sidebar-link">1:1문의</a>
				</li>
			</ul>
		</li>
	</ul>
	
	<div class="sidebar-footer">
		<a href="#" class="sidebar-link">
			<i class="lni lni-exit"></i>
			<span>Logout</span>
		</a>
	</div>
</aside>