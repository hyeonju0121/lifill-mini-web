package com.mycompany.lifill_mini_web.dto.response;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GetProductResponse {
	// 기능별, 성분별, 상품코드, 브랜드, 상품명,
	// 대표이미지, 판매가, 수량, 최초 상품 등록일
	private String prdcode;
	private String prdbrand;
	private String prdname;
	private int prdstock;

	private String fnval;
	private String igdval;

	// prdcontents -> 대표이미지
	private byte[] prdimgrep1;
	private String prdimgrep1oname;
	private String prdimgrep1type;
	private MultipartFile prdimgrep1attach;

	private Date prdcreatedat;

}
