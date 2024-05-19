package com.mycompany.lifill_mini_web.dto.request;

import lombok.Data;

@Data
public class CartAddItemRequest {
	private String prdcode;
	private String ordamount;
	private String ordprice;

}
