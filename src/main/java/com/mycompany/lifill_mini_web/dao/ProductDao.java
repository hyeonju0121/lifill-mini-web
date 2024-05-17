package com.mycompany.lifill_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.Product;

@Mapper
public interface ProductDao {
	public int prdcount();
	public int prdinsert(Product product);
	public int prdUpdate(Product product);
	public int prdSalesOnCount();
	public int prdSalesOffCount();
	
	public int prdSelectFunctionOnCount();
	public int getAllPrdSubOneCnt();
	public int getPrdSubFilterCnt(String sub);
	public int getPrdSubFilterOneCnt(String sub);
	
	// ingredient count 가져오기 
	public int getPrdIgdAllZeroCnt();
	public int getPrdIgdFilterZeroCnt(String subCategory);
	public int getPrdIgdFilterOneCnt(String subCategory);

}
