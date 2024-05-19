package com.mycompany.lifill_mini_web.dto.request;


import lombok.Data;

@Data
public class OrderItemRequest {
	// 뷰로부터 전달받을 값 
	private String prdcode; 
	private int ordtotalamount;
	private int prdtotalprice;
	
}
