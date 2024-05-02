package com.mycompany.lifill_mini_web.dto;

import lombok.Data;

@Data
public class Refund {
	private int rfdid;
	private String ordid;
	private String rfdreason;
}
