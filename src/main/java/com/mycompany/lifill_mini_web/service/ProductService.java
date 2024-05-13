package com.mycompany.lifill_mini_web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.lifill_mini_web.dao.ProductResponseDao;
import com.mycompany.lifill_mini_web.dto.response.ProductResponse;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductService {
	
	@Autowired
	private ProductResponseDao productResponseDao;
	
	public ProductResponse getProduct(String prdcode) {
		
		ProductResponse product = productResponseDao.prdSelectByPrdcode(prdcode);
		
		return product;
	}
	
}
