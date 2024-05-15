package com.mycompany.lifill_mini_web.dto;

import lombok.Data;

@Data
public class OrdersDetail {
	private String ordid;
	private String prdcode;
	private int odtamount;
	private int prdprice;
}
