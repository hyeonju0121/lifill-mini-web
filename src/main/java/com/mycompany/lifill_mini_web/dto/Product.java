package com.mycompany.lifill_mini_web.dto;

import lombok.Data;

@Data
public class Product {
	private String prdcode;
	private String prdname;
	private String prdbrand;
	private int prdprice;
	private int prdstock;
	private boolean prdsubscribable;
	private boolean prdsalesstatus;
}
