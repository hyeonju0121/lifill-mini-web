package com.mycompany.lifill_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Payment {
	private String ordid;
	private Date pmtdate;
}
