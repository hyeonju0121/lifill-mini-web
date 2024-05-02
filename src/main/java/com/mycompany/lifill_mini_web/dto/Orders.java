package com.mycompany.lifill_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Orders {
	private String ordid;
	private String mid;
	private String prdcode;
	private int ordamount;
	private int totalprice;
	private String ordrequest;
	private String ordstatus;
	private Date orddate;
	private String ordreceivername;
	private String ordreceiveraddress;
	private String ordreceiverzipcode;
	private String ordreceiverphone;
}
