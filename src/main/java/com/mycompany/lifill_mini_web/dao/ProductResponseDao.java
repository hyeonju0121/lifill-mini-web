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
	public ProductResponse prdSelectByPrdcode(String prdcode);
	public ProductResponse prdSelectByAttachData(String prdcode);
	
	public int prdFunctionOnCount(String subCategory);
	
	// page -> subCategory= "all" 인 경우에 따른 정렬 처리 메소드 
	public List<ProductResponse> selectAllPrdByPage(ItemPageRequest request);
	public List<ProductResponse> selectAllPrdByPageSortZero(ItemPageRequest request);
	public List<ProductResponse> selectAllPrdByPageSortOne(ItemPageRequest request);
	public List<ProductResponse> selectAllPrdByPageSortTwo(ItemPageRequest request);
	
	// page -> subCategory 
	public List<ProductResponse> selectPrdByPageSortZero(ItemPageRequest request);
	public List<ProductResponse> selectPrdByPageSortOne(ItemPageRequest request);
	public List<ProductResponse> selectPrdByPageSortTwo(ItemPageRequest request);
	public List<ProductResponse> selectPrdByPageSortFilterZero(ItemPageRequest request);
	public List<ProductResponse> selectPrdByPageSortFilterOne(ItemPageRequest request);
	public List<ProductResponse> selectPrdByPageSortFilterTwo(ItemPageRequest request);
	
	// ingredient -> subCategory
	public List<ProductResponse> selectIgdPrdByPageSortZero(ItemPageRequest request);
	public List<ProductResponse> selectIgdPrdByPageSortOne(ItemPageRequest request);
	public List<ProductResponse> selectIgdPrdByPageSortTwo(ItemPageRequest request);
	public List<ProductResponse> selectIgdPrdByPageSortFilterZero(ItemPageRequest request);
	public List<ProductResponse> selectIgdPrdByPageSortFilterOne(ItemPageRequest request);
	public List<ProductResponse> selectIgdPrdByPageSortFilterTwo(ItemPageRequest request);
	
}
