package com.mycompany.lifill_mini_web.dto.response;

import lombok.Data;

@Data
public class OrdersResponse {
	// 장바구니에 있는 상품들을 orders.jsp 내에서 사용할 수 있도록 필드 구성
	private String prdcode;
	private int ordamount;
	private int ordprice;
	
	private String prdbrand;
	private String prdname;

}
