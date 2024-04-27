package com.mycompany.lifill_mini_web.dto;

import lombok.Data;

@Data
public class Cart {
	
	private int cId;
	private String mId;
	private int cTotalAmount;
	private int cTotalPrice;

}
