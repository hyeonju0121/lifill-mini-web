package com.mycompany.lifill_mini_web.dto.request;

import java.util.List;

import lombok.Data;

@Data
public class OrderItem {
	private List<OrderItemRequest> orders;
}
