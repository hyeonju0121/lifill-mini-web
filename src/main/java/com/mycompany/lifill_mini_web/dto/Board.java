package com.mycompany.lifill_mini_web.dto;


import java.util.Date;

import lombok.Data;

@Data
public class Board {
	private int bNo;
	private String mId;
	
	private String bTitle;
	private String bContent;
	
	private String battachoname; // 파일 원래 이름
	private String battachtype; // 파일 종류
	private byte[] bAttach;
	
	private String bType;
	private int bHitCount;
	
	private Date bCreatedAt;
	private Date bUpdatedAt;

}
