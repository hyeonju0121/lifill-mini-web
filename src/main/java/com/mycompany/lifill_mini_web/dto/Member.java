package com.mycompany.lifill_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Member {

	private String mId;
	private String mPassword;
	private String mName;
	private String mPhone;
	private String mEmail;
	private String mRole;
	private Date mCreatedAt;
	private Date mUpdatedAt;
}
