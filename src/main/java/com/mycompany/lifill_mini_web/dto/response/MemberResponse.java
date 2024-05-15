package com.mycompany.lifill_mini_web.dto.response;

import java.util.Date;

import lombok.Data;

@Data
public class MemberResponse {

	private String mid;
	private String mpassword;
	private String mname;
	private String mphone;
	private String memail;
	private String mrole;
	private boolean menable;
	private Date mcreatedat;
	private Date mupdatedat;
	private String mzipcode;
	private String maddress;
	private String maddress1;
	private String maddress2;
}
