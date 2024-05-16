package com.mycompany.lifill_mini_web.dto;


import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Product {
	private String prdcode;
	private int fnno;
	private int igdno;
	private String prdname;
	private String prdbrand;
	private int prdprice;
	private int prdstock;
	private boolean prdsubscribable;
	private boolean prdsalesstatus;
	
}
