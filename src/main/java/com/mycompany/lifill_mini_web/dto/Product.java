package com.mycompany.lifill_mini_web.dto;

import lombok.Data;

@Data
public class Product {
	private String prdCode;
	private String prdName;
	private String prdBrand;
	private int prdPrice;
	private int prdStock;
	private boolean prdSubscribable;
	private boolean prdSalesStatus;
}
