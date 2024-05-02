package com.mycompany.lifill_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Inquiry {
	
	private int inqno;
	private String mid;
	private String prdcode;
	private String inqtitle;
	private String inqcontent;
	private String inqtype;
	
	private byte[] inqattach;
	private String inqattachoname;
	private String inqattachtype;
	
	private Date inqcreatedat;
	private Date inqupdatedat;
	private String inqreply;
	private String inqstatus;

}
