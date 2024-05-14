package com.mycompany.lifill_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Refund {
	private String ordid;
	private String rfdstatus;
	private String rfdreason;
	private Date rfdcreatedat;
	private Date rfdupdatedat;
}
