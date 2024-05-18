package com.mycompany.lifill_mini_web.dto.request;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewRequest {
	
	// review 테이블에 전달할 필드
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
