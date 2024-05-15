package com.mycompany.lifill_mini_web.dto.request;

import java.util.Date;

import lombok.Data;

@Data
public class SingleOrderRequest {

	private String ordid; // service에서 저장해줄 필드
	private String mid; // service에서 저장해줄 필드
	private String prdcode; //
	private int ordtotalamount; //
	private int ordtotalprice; //
	private String ordrequest; //
	private String ordstatus; // service에서 저장해줄 필드
	private Date ordcreatedat; // 쿼리문에서 sysdate 값을 가질 필드
	private Date ordupdatedat; // 처음에 null을 가질 필드
	private String ordreceivername; //
	private String ordreceiveraddress; //
	private String ordreceiverzipcode; //
	private String ordreceiverphone; //
}
