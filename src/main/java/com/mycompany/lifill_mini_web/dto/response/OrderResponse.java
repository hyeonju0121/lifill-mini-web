package com.mycompany.lifill_mini_web.dto.response;

import java.util.Date;

import lombok.Data;

@Data
public class OrderResponse {

	private int seq;
	private String ordid;
	private String mid;
	private int ordtotalamount;
	private int ordtotalprice;
	private String ordrequest;
	private String ordstatus;
	private String ordpostnum;
	private Date ordcreatedat;
	private String ordreceivername;
	private String ordreceiveraddress;
	private String ordreceiverzipcode;
	private String ordreceiverphone;
	private String prdcode;
	private int odtamount;
	private int prdprice;
}
