package com.mycompany.lifill_mini_web.dto.response;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductResponse {
	// Product table -------------------------------
	private String prdcode;
	private int fnno;
	private String prdname;
	private String prdbrand;
	private int prdprice;
	private int prdstock;
	private boolean prdsubscribable;
	private boolean prdsalesstatus;

	// Prdcontents table ---------------------------
	private List<MultipartFile> prdimglist;

	// 대표이미지
	private byte[] prdimgrep1;
	private String prdimgrep1oname;
	private String prdimgrep1type;
	private MultipartFile prdimgrep1attach;

	private byte[] prdimgrep2;
	private String prdimgrep2oname;
	private String prdimgrep2type;
	private MultipartFile prdimgrep2attach;
	
	private byte[] prdimgrep3;
	private String prdimgrep3oname;
	private String prdimgrep3type;
	private MultipartFile prdimgrep3attach;
	
	// 상세이미지
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
	
	private Date prdcreatedat;
	private Date prdupdatedat;
	
	// Prdhashtag table
	private int tagno;
	private String tagval;
	
	// function table
	private String fnval;

	// ingredient table
	private int igdno;
	private String igdval;

	// 성분 값을 직접 입력한 경우
	private String directval;

}
