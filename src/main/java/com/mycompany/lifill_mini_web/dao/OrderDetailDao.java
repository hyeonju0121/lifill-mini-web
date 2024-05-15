package com.mycompany.lifill_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.OrdersDetail;

@Mapper
public interface OrderDetailDao {

	public void createOrdersDetail(OrdersDetail odt);

}
