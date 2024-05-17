package com.mycompany.lifill_mini_web.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.lifill_mini_web.dao.PrdHashtagDao;
import com.mycompany.lifill_mini_web.dao.ProductDao;
import com.mycompany.lifill_mini_web.dao.ProductResponseDao;
import com.mycompany.lifill_mini_web.dto.Pager;
import com.mycompany.lifill_mini_web.dto.request.ItemPageRequest;
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
	
		// 상품 목록 조회
	    /*public List<ProductResponse> getProductResponseList() {
			// 비즈니스 로직 처리
			//List<ProductResponse> productResponse = productResponseDao.prdSelectByPage(pager);
			
			List<ProductResponse> productResponse = productResponseDao.prdselectBySalesstatus();
			
			log.info("로직 실행");
			return productResponse;
		}*/
	    
	    // 전체 상품 목록 조회
	    public List<ProductResponse> getProductResponseSubCategoryList(String subCategory) {
	    	List<ProductResponse> productResponse = new ArrayList<>();
	    	
	    	if (subCategory.equals("all")) {
	    		productResponse = productResponseDao.prdselectBySalesstatus();
	    	} else {
	    		subCategory = subCategoryValidation(subCategory);
	    		productResponse = productResponseDao.prdselectBySubCategory(subCategory);
	    	}
	    	
	    	return productResponse;
	    }
	    
	    // 전체 상품 목록 조회 (서브카테고리, 정렬)
	    public List<ProductResponse> getProductResponseList(ItemPageRequest request) {
	    	// 서브카테고리 조회 
	    	String subCategory = request.getSubCategory();
	    	List<ProductResponse> productResponse = new ArrayList<>();
	    	
	    	// 정렬 
	    	// 서브카테고리가 전체인 경우
	    	if (subCategory.equals("all")) {
	    		// filter 가 0인 경우 -> 전체 상품 조회 
	    		if (request.getFilter().equals("0")) { // sort = 0, filter = 0
	    			productResponse = productResponseDao.selectAllPrdListFilterZero(request);
	    			return productResponse;
	    			
	    		} else {
	    			// filter 가 1인 경우 -> 구독 가능한 상품만 조회
	    			switch(request.getSort()) {
		    			case "0" : productResponse = productResponseDao.selectAllPrdListSortZero(request); break;
		    			case "1" : productResponse = productResponseDao.selectAllPrdListSortOne(request); break;
		    			case "2" : productResponse = productResponseDao.selectAllPrdListSortTwo(request); break;
	    			}
	    		}
	    	} else { // 서브카테고리가 각 기능별에 해당하는 경우
	    		subCategory = subCategoryValidation(subCategory);
	    		request.setSubCategory(subCategory);
	    		
	    		// filter 가 0인 경우 -> 각 기능별에 해당하는 전체 상품 조회 
	    		if (request.getFilter().equals("0")) {
	    			productResponse = productResponseDao.selectAllPrdListFilterSubZero(request);
	    			return productResponse;
	    		}
	    		
	    		switch(request.getSort()) {
	    			case "0" : productResponse = productResponseDao.selectPrdListSortZero(request); break;
	    			case "1" : productResponse = productResponseDao.selectPrdListSortOne(request); break;
	    			case "2" : productResponse = productResponseDao.selectPrdListSortTwo(request); break;
	    		}
	    	}
	    	
	    	return productResponse;
	    }
	    
	    // 카테고리, 정렬, 필터 여부에 일치하는 상품 count 가져오기
	    public int getItemPageRequestCount(ItemPageRequest request) {
	    	String subCategory = request.getSubCategory();
	    	log.info("subCategory={}", subCategory);
    		
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
	    		subCategory = subCategoryValidation2(subCategory);
	    		int subInt = Integer.parseInt(subCategory);
	    		log.info("subInt={}", subInt);
	    		String sub = String.valueOf(subInt);
	    		
	    		//subCategory = subCategoryValidation(subCategory);
	    		request.setSubCategory(subCategory);
	    		
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
	    
	    
		// 상품 단건 조회
		public ProductResponse getProductResponse(String prdcode) {
			ProductResponse productResponse = productResponseDao.prdSelectByPrdcode(prdcode);
			return productResponse;
		}

		// 상품코드 기준으로 AttachData (대표이미지) 조회
		public byte[] getAttachData(String prdcode) {
			ProductResponse productResponse = productResponseDao.prdSelectByAttachData(prdcode);
			return productResponse.getPrdimgrep1();
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
	    	switch(subCategory) {
			case "001": return "눈건강";
			case "002": return "장건강";
			case "003": return "간건강";
			case "004": return "뼈/관절건강";
			case "005": return "면역력";
			case "006": return "만성피로";
			case "007": return "혈액순환";
			default: 
				throw new RuntimeException("잘못된 요청입니다.");
	    	}
	    }
	    
	 // 서브 카테고리 유형 검사 메소드
	    public String subCategoryValidation2(String subCategory) {
	    	switch(subCategory) {
			case "눈건강": return "001";
			case "장건강": return "002";
			case "간건강": return "003";
			case "뼈/관절건강": return "004";
			case "면역력": return "005";
			case "만성피로": return "006";
			case "혈액순환": return "007";
			default: 
				throw new RuntimeException("잘못된 요청입니다.");
	    	}
	    }
	
}
