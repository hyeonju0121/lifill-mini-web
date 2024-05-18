package com.mycompany.lifill_mini_web.dto.response;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewResponse {
	// review table
	private int revno;
	private String mid;
	private String ordid;
	private String prdcode;
	private String revcontent;
	private int revscore;
	
	private String revattachoname;
	private String revattachtype;
	private byte[] revattach;
	
	private Date revcreatedat;
	
	// product table
	private String prdbrand;
	private String prdname;
	
	private int seq;
}
