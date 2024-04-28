package com.mycompany.lifill_mini_web.dto;

import lombok.Data;

@Data
public class OrderDetail {
	private String ordNum;
	private String prdCode;
	private int odtAmount;
}
