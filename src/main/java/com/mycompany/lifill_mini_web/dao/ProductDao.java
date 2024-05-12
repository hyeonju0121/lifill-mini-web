package com.mycompany.lifill_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.Product;

@Mapper
public interface ProductDao {
	public int prdcount();
	public int prdinsert(Product product);
	//public List<Product.GetProductResponse> prdselect(Pager pager);

}
