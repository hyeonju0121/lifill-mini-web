package com.mycompany.lifill_mini_web.dto;

import lombok.Data;

@Data
public class OrderDetail {
	private String ordid;
	private String prdcode;
	private int odtamount;
	private int prdprice;
}
