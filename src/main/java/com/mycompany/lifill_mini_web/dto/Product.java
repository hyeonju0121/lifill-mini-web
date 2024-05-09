package com.mycompany.lifill_mini_web.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Product {
	private String prdcode;
	private int fnno;
	private String prdname;
	private String prdbrand;
	private int prdprice;
	private int prdstock;
	private boolean prdsubscribable;
	private boolean prdsalesstatus;
	
	@Data
	public static class createProductRequest {
		// product
		private String prdcode;
		private String prdname;
		private String prdbrand;
		private int prdprice;
		private int prdstock;
		private boolean prdsubscribable;
		private boolean prdsalesstatus;
		
		// function
		private String fnval;
		
		// ingredient
		private String igdval;
		
		// prdhashtag
		private String tagval;
		
		// prdcontents
		private List<MultipartFile> prdimglist;
		
		private byte[] prdimgrep1;
		private String prdimgrep1oname;
		private String prdimgrep1type;
		private MultipartFile prdimgrep1attach;
		
		private byte[] prdimgdetail;
		private String prdimgdetailoname;
		private String prdimgdetailtype;
		private MultipartFile prdimgdetailattach;
		
		private String prdtarget;
		private String prdtimes;
		private String prdmethod;
		private String prdeffect;
		private String prdtype;
		private String prdingredient;
	}
}
