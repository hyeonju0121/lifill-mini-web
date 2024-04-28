package com.mycompany.lifill_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Payment {
	private String ordNum;
	private Date pmtDate;
	private int ordTotalPrice;
}
