package com.mycompany.lifill_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Order {
	private String ordNum;
	private String mId;
	private String prdCode;
	private int ordAmount;
	private int prdPrice;
	private int totalPrice;
	private String ordRequest;
	private String ordStatus;
	private Date ordDate;
	private String ordReceiverName;
	private String ordReceiverAddress;
	private String ordReceiverZipcode;
	private String ordReceiverPhone;
}
