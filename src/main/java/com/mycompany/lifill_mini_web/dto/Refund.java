package com.mycompany.lifill_mini_web.dto;

import lombok.Data;

@Data
public class Refund {
	private int rfdNo;
	private String ordNum;
	private String mId;
	private String rfdReason;
}
