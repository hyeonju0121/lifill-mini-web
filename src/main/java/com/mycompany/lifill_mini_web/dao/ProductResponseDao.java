package com.mycompany.lifill_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.response.ProductResponse;

@Mapper
public interface ProductResponseDao {
	public List<ProductResponse> prdselect();
	public ProductResponse prdSelectByPrdcode(String prdcode);
	public ProductResponse prdSelectByAttachData(String prdcode);

}
