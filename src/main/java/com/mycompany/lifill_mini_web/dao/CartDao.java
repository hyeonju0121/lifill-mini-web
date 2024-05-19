package com.mycompany.lifill_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.Cart;
import com.mycompany.lifill_mini_web.dto.request.OrderItemRequest;
import com.mycompany.lifill_mini_web.dto.response.GetCartItemResponse;

@Mapper
public interface CartDao {

	public int addCartItem(Cart cart);

	public List<GetCartItemResponse> getCartItem(String mid);

	public void deleteCartItem(OrderItemRequest request);

	public int getCartTotalCnt(String mid);
}
