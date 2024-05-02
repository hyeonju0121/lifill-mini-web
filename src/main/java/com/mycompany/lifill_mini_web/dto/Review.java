package com.mycompany.lifill_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Review {
	private int revno;
	private String mid;
	private String prdcode;
	private String revcontent;
	
	private byte[] revattach;
	private String revattachoname;
	private String revattachtype;
	
	private Date revcreatedat;
}
