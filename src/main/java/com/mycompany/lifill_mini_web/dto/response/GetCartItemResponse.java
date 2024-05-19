package com.mycompany.lifill_mini_web.dto.response;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GetCartItemResponse {
	
	private String prdcode;
	private String prdbrand;
	private String prdname;
	private int prdprice;

	private int camount;
	private int cprice;
	
	// 상품 이미지
	private byte[] prdimgrep1;
	private String prdimgrep1oname;
	private String prdimgrep1type;
	private MultipartFile prdimgrep1attach;
	

}
