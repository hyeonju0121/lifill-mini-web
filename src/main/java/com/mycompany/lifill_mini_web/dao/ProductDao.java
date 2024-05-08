package com.mycompany.lifill_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.Product;

@Mapper
public interface ProductDao {
	public int prdcount();
	public int prdinsert(Product product);

}
