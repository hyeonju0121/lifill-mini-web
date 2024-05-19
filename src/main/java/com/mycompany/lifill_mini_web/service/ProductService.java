package com.mycompany.lifill_mini_web.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.mycompany.lifill_mini_web.dao.CartDao;
import com.mycompany.lifill_mini_web.dao.PrdHashtagDao;
import com.mycompany.lifill_mini_web.dao.ProductDao;
import com.mycompany.lifill_mini_web.dao.ProductResponseDao;
import com.mycompany.lifill_mini_web.dto.Cart;
import com.mycompany.lifill_mini_web.dto.request.CartAddItemRequest;
import com.mycompany.lifill_mini_web.dto.request.ItemPageRequest;
import com.mycompany.lifill_mini_web.dto.request.OrderItem;
import com.mycompany.lifill_mini_web.dto.request.OrderItemRequest;
import com.mycompany.lifill_mini_web.dto.response.OrdersResponse;
import com.mycompany.lifill_mini_web.dto.response.ProductResponse;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductService {

	@Resource
	private ProductResponseDao productResponseDao;

	@Resource
	private PrdHashtagDao prdHashtagDao;

	@Resource
	private ProductDao productDao;

	@Resource
	private CartDao cartDao;

	// 전체 상품 목록 조회 (서브카테고리, 정렬, 필터)
	public List<ProductResponse> getProductResponseList(ItemPageRequest request) {
		// 서브카테고리 조회
		String subCategory = request.getSubCategory();
		log.info("getProductResponseList() 진입: subCategory.toString={}", subCategory);

		List<ProductResponse> productResponse = new ArrayList<>();

		// 서브카테고리가 전체인 경우
		// 서브카테고리에 따른 정렬, 필터(정기구독가능여부), 페이징 처리
		if (subCategory.equals("all")) {
			// subCategory = "all" 인 경우
			// (subCategory=all, sort=0,1,2, filter=0,1)
			// sort = 0,1,2 에 따른 필터 구분
			switch (request.getSort()) {
			case "0":
				productResponse = productResponseDao.selectAllPrdByPageSortZero(request);
				break;
			case "1":
				productResponse = productResponseDao.selectAllPrdByPageSortOne(request);
				break;
			case "2":
				productResponse = productResponseDao.selectAllPrdByPageSortTwo(request);
				break;
			}
		} else { // 서브카테고리가 각 기능별에 해당하는 경우
			// subCategory = 001, 002, 003, 004, 005, 006, 007
			// 001 -> 눈건강 변환
			subCategory = subCategoryValidation(subCategory);
			request.setSubCategory(subCategory);

			// 정기구독을 체크한 경우
			if (request.getFilter().contentEquals("1")) {
				switch (request.getSort()) {
				case "0":
					productResponse = productResponseDao.selectPrdByPageSortZero(request);
					break;
				case "1":
					productResponse = productResponseDao.selectPrdByPageSortOne(request);
					break;
				case "2":
					productResponse = productResponseDao.selectPrdByPageSortTwo(request);
					break;
				}
			} else {
				switch (request.getSort()) {
				case "0":
					productResponse = productResponseDao.selectPrdByPageSortFilterZero(request);
					break;
				case "1":
					productResponse = productResponseDao.selectPrdByPageSortFilterOne(request);
					break;
				case "2":
					productResponse = productResponseDao.selectPrdByPageSortFilterTwo(request);
					break;
				}

			}

		}
		return productResponse;
	}

	// 카테고리, 정렬, 필터 여부에 일치하는 상품 count 가져오기
	public int getItemPageRequestCount(ItemPageRequest request) {
		String subCategory = request.getSubCategory();
		// log.info("subCategory={}", subCategory);

		int totalCnt = 0;

		// 서브카테고리가 전체인 경우
		if (subCategory.equals("all")) {
			// 구독가능상태여부가 0인 경우 -> 전체 상품 갯수 리턴
			if (request.getFilter().equals("0")) { // subCategory = 0
				totalCnt = getSalesOnCnt(subCategory);
				return totalCnt;
			} else {
				// filter 가 1인 경우 -> 구독 가능한 상품 갯수 리턴
				totalCnt = productDao.getAllPrdSubOneCnt();
				return totalCnt;
			}
		} else { // 서브카테고리가 각 기능별에 해당하는 경우
			int subInt = Integer.parseInt(subCategory);
			String sub = String.valueOf(subInt);

			// filter 가 0인 경우 -> 각 기능별에 해당하는 전체 상품 개수 조회
			if (request.getFilter().equals("0")) {
				totalCnt = productDao.getPrdSubFilterCnt(sub);
				return totalCnt;
			} else {
				// filter 가 1인 경우 -> 구독 가능한 상품 갯수 리턴
				totalCnt = productDao.getPrdSubFilterOneCnt(sub);
				return totalCnt;
			}
		}
	}

	// ingredient ----------------------------------------------------
	// 전체 상품 목록 조회 (서브카테고리, 정렬, 필터)
	public List<ProductResponse> getIgdProductResponseList(ItemPageRequest request) {
		// 서브카테고리 조회
		String subCategory = request.getSubCategory();
		log.info("getProductResponseList() 진입: subCategory.toString={}", subCategory);

		List<ProductResponse> productResponse = new ArrayList<>();

		// 서브카테고리가 전체인 경우
		// 서브카테고리에 따른 정렬, 필터(정기구독가능여부), 페이징 처리
		if (subCategory.equals("all")) {
			// subCategory = "all" 인 경우
			// (subCategory=all, sort=0,1,2, filter=0,1)
			// sort = 0,1,2 에 따른 필터 구분
			switch (request.getSort()) {
			case "0":
				productResponse = productResponseDao.selectAllPrdByPageSortZero(request);
				break;
			case "1":
				productResponse = productResponseDao.selectAllPrdByPageSortOne(request);
				break;
			case "2":
				productResponse = productResponseDao.selectAllPrdByPageSortTwo(request);
				break;
			}
		} else { // 서브카테고리가 각 기능별에 해당하는 경우
			// subCategory = 001, 002, 003, 004, 005, 006, 007
			// 001 -> 눈건강 변환
			subCategory = subIgdCategoryValidation(subCategory);
			request.setSubCategory(subCategory);

			log.info("subCategory.toString={}", subCategory);

			// 정기구독을 체크한 경우
			if (request.getFilter().contentEquals("1")) {
				switch (request.getSort()) {
				case "0":
					productResponse = productResponseDao.selectIgdPrdByPageSortZero(request);
					break;
				case "1":
					productResponse = productResponseDao.selectIgdPrdByPageSortOne(request);
					break;
				case "2":
					productResponse = productResponseDao.selectIgdPrdByPageSortTwo(request);
					break;
				}
			} else {
				switch (request.getSort()) {
				case "0":
					productResponse = productResponseDao.selectIgdPrdByPageSortFilterZero(request);
					break;
				case "1":
					productResponse = productResponseDao.selectIgdPrdByPageSortFilterOne(request);
					break;
				case "2":
					productResponse = productResponseDao.selectIgdPrdByPageSortFilterTwo(request);
					break;
				}

			}

		}
		return productResponse;
	}

	// 카테고리, 정렬, 필터 여부에 일치하는 상품 count 가져오기
	public int getIgdItemPageRequestCount(ItemPageRequest request) {
		// igdval = 001 -> 눈건강
		String subCategory = request.getSubCategory();
		log.info("subCategory={}", subCategory);

		int totalCnt = 0;

		// 서브카테고리가 전체인 경우
		if (subCategory.equals("all")) {
			// 구독가능상태여부가 0인 경우 -> 전체 상품 갯수 리턴
			if (request.getFilter().equals("0")) { // subCategory = 0
				totalCnt = productDao.getPrdIgdAllZeroCnt();
				return totalCnt;
			} else {
				// filter 가 1인 경우 -> 구독 가능한 상품 갯수 리턴
				totalCnt = productDao.getAllPrdSubOneCnt();
				return totalCnt;
			}
		} else {
			subCategory = subIgdCategoryValidation(subCategory);

			// 서브카테고리가 각 기능별에 해당하는 경우
			// filter 가 0인 경우 -> 각 기능별에 해당하는 전체 상품 개수 조회
			if (request.getFilter().equals("0")) {
				totalCnt = productDao.getPrdIgdFilterZeroCnt(subCategory);
				return totalCnt;
			} else {
				// filter 가 1인 경우 -> 구독 가능한 상품 갯수 리턴
				totalCnt = productDao.getPrdIgdFilterOneCnt(subCategory);
				return totalCnt;
			}
		}
	}

	// ----------------------------------------------------------------
	// 상품 단건 조회
	public ProductResponse getProductResponse(String prdcode) {
		ProductResponse productResponse = productResponseDao.prdSelectByPrdcode(prdcode);
		return productResponse;
	}

	// -----------------------------------------------------------
	// 상품 복수건 조회 (장바구니 건에서 주문할 때 사용)
	public List<OrdersResponse> getProductsResponse(OrderItem item) {
		// 사용자가 주문 요청한 prdcode 가져오기
		/*
		 * 
		 * request.toString=OrderItem( orders= [OrderItemRequest(prdcode=P100-0025,
		 * ordtotalamount=1, prdtotalprice=15000), OrderItemRequest(prdcode=P100-0030,
		 * ordtotalamount=1, prdtotalprice=36300), OrderItemRequest(prdcode=P500-0059,
		 * ordtotalamount=1, prdtotalprice=50000), OrderItemRequest(prdcode=P200-0072,
		 * ordtotalamount=1, prdtotalprice=34900)])
		 */

		List<OrderItemRequest> orders = item.getOrders();
		log.info("orders: {}", orders.toString());

		List<OrdersResponse> ordersResponse = new ArrayList<>();

		for (OrderItemRequest request : orders) {
			OrdersResponse response = new OrdersResponse();
			String prdcode = request.getPrdcode();

			response.setPrdcode(request.getPrdcode());
			response.setOrdamount(request.getOrdtotalamount());
			response.setOrdprice(request.getPrdtotalprice());

			// prdcode 기준으로 상품 조회해서 prdbrand, prdname을 response 객체에 셋팅 해주기
			ProductResponse prdByPrdcode = productResponseDao.prdSelectByPrdcode(prdcode);
			response.setPrdbrand(prdByPrdcode.getPrdbrand());
			response.setPrdname(prdByPrdcode.getPrdname());
			
			ordersResponse.add(response);
		}
		

		return ordersResponse;
	}

	// 상품코드 기준으로 AttachData (대표이미지) 조회
	public byte[] getAttachData(String prdcode) {
		ProductResponse productResponse = productResponseDao.prdSelectByAttachData(prdcode);
		return productResponse.getPrdimgrep1();
	}
	
	// 상품코드 기준으로 AttachDetailData (상품 상세 이미지) 조회
		public byte[] getAttachDetailData(String prdcode) {
			ProductResponse productResponse = productResponseDao.prdSelectByAttachDetailData(prdcode);
			return productResponse.getPrdimgdetail();
		}

	// 사용자 장바구니에 해당 상품 추가
	@Transactional
	public void addCartItem(CartAddItemRequest request) {
		// 사용자 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();

		Cart cart = new Cart();
		cart.setMid(mid);
		cart.setPrdcode(request.getPrdcode());
		cart.setCamount(Integer.parseInt(request.getOrdamount()));
		cart.setCprice(Integer.parseInt(request.getOrdprice()));

		// cart 테이블에 해당 객체 추가
		cartDao.addCartItem(cart);
	}

	// 판매중인 상품 total count
	public int getSalesOnCnt(String subCategory) {
		int totalCnt = 0;

		if (subCategory.equals("all")) {
			totalCnt = productDao.prdSalesOnCount();
		} else {
			subCategory = subCategoryValidation(subCategory);
			totalCnt = productResponseDao.prdFunctionOnCount(subCategory);
		}
		return totalCnt;
	}

	// 서브 카테고리 유형 검사 메소드
	public String subCategoryValidation(String subCategory) {
		switch (subCategory) {
		case "001":
			return "눈건강";
		case "002":
			return "장건강";
		case "003":
			return "간건강";
		case "004":
			return "뼈/관절건강";
		case "005":
			return "면역력";
		case "006":
			return "만성피로";
		case "007":
			return "혈액순환";
		default:
			throw new RuntimeException("잘못된 요청입니다.");
		}
	}

	// 서브 카테고리 유형 검사 메소드
	public String subIgdCategoryValidation(String subCategory) {
		switch (subCategory) {
		case "001":
			return "루테인";
		case "002":
			return "프로바이오틱스";
		case "003":
			return "밀크씨슬";
		case "004":
			return "마그네슘";
		case "005":
			return "글루코사민";
		case "006":
			return "칼슘";
		case "007":
			return "프로폴리스";
		case "008":
			return "아연";
		case "009":
			return "비타민";
		case "010":
			return "테아닌";
		case "011":
			return "오메가3";
		default:
			throw new RuntimeException("잘못된 요청입니다.");
		}
	}

}
