package com.mycompany.lifill_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.Orders;

@Mapper
public interface OrderDao {

	public int orderCount();

	public int createOrders(Orders orders);
}
