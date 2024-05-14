package com.mycompany.lifill_mini_web.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.lifill_mini_web.dao.PrdHashtagDao;
import com.mycompany.lifill_mini_web.dao.ProductDao;
import com.mycompany.lifill_mini_web.dao.ProductResponseDao;
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
	    public List<ProductResponse> getProductResponseList() {

			// 비즈니스 로직 처리
			List<ProductResponse> productResponse = productResponseDao.prdselectBySalesstatus();

			log.info("로직 실행");
			return productResponse;
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
		public int getSalesOnCnt() {
			return productDao.prdSalesOnCount();
		}
	
}
