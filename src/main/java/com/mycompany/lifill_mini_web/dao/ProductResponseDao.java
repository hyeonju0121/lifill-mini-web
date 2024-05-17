package com.mycompany.lifill_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.Pager;
import com.mycompany.lifill_mini_web.dto.request.ItemPageRequest;
import com.mycompany.lifill_mini_web.dto.response.ProductResponse;

@Mapper
public interface ProductResponseDao {
	public List<ProductResponse> prdselect();
	public List<ProductResponse> prdSelectByPage(Pager pager);
	public List<ProductResponse> prdselectBySubCategory(String subCategory);
	public ProductResponse prdSelectByPrdcode(String prdcode);
	public ProductResponse prdSelectByAttachData(String prdcode);
	public List<ProductResponse> prdselectBySalesstatus();
	
	public int prdFunctionOnCount(String subCategory);
	
	// sort
	public List<ProductResponse> selectAllPrdListSortZero(ItemPageRequest request);
	public List<ProductResponse> selectAllPrdListSortOne(ItemPageRequest request);
	public List<ProductResponse> selectAllPrdListSortTwo(ItemPageRequest request);
	
	public List<ProductResponse> selectPrdListSortZero(ItemPageRequest request);
	public List<ProductResponse> selectPrdListSortOne(ItemPageRequest request);
	public List<ProductResponse> selectPrdListSortTwo(ItemPageRequest request);

	// filter
	public List<ProductResponse> selectAllPrdListFilterZero(ItemPageRequest request);
	public List<ProductResponse> selectAllPrdListFilterSubZero(ItemPageRequest request);
	
	
	// cnt
	
	
}
