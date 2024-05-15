package com.mycompany.lifill_mini_web.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Orders {
	private String ordid;
	private String mid;
	private int ordtotalamount;
	private int ordtotalprice;
	private String ordrequest;
	private String ordstatus;
	private String ordpostnum;
	private Date ordcreatedat;
	private Date ordupdatedat;
	private String ordreceivername;
	private String ordreceiveraddress;
	private String ordreceiverzipcode;
	private String ordreceiverphone;
}
