package com.mycompany.lifill_mini_web.dto.request;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CreateInquiryRequest {
	// inquiry table
	private int inqno;
	private String mid;
	private String prdcode;
	private String inqtitle;
	private String inqcontent;
	
	private String inqattachoname; // 파일 원래 이름
	private String inqattachtype;  // 파일 종류
	private byte[] inqattachdata;
	private MultipartFile inqattach;
	
	private Date inqcreatedat;
	private Date inqupdatedat;
	
	private String requestInqval;
	private String inqreply;
	private String inqstatus;
	
	// inqcategory table
	private int inqtype;
	private String inqval;

}
