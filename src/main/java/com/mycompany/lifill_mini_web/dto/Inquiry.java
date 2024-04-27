package com.mycompany.lifill_mini_web.dto;

import java.sql.Blob;
import java.util.Date;

import lombok.Data;

@Data
public class Inquiry {
	
	private int inqNo;
	private String mId;
	private String prdCode;
	private String inqTitle;
	private String inqContent;
	private String inqType;
	private Blob inqAttach;
	private Date inqCreatedAt;
	private Date inqUpdatedAt;
	private String inqReply;
	private String inqStatus;

}
