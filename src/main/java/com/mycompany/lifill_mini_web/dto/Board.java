package com.mycompany.lifill_mini_web.dto;

import java.sql.Blob;
import java.util.Date;

import lombok.Data;

@Data
public class Board {
	
	private int bNo;
	private String mId;
	private String bTitle;
	private String bContent;
	private Blob bAttach;
	private String bType;
	private int bHitCount;
	private Date bCreatedAt;
	private Date bUpdatedAt;

}
