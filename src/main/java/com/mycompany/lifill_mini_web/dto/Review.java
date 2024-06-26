package com.mycompany.lifill_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Review {
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
}
