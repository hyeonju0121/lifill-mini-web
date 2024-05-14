package com.mycompany.lifill_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Member {

	private String mid;
	private String mpassword;
	private String mname;
	private String mphone;
	private String memail;
	private String mrole;
	private boolean menabled;
	private Date mcreatedat;
	private Date mupdatedat;
}
