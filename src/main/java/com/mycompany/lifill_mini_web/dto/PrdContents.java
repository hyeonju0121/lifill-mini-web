package com.mycompany.lifill_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class PrdContents {
	private String prdcode;
	
	private byte[] prdimgrep1;
	private String prdimgrep1oname;
	private String prdimgrep1type;
	
	private byte[] prdimgrep2;
	private String prdimgrep2oname;
	private String prdimgrep2type;
	
	private byte[] prdimgrep3;
	private String prdimgrep3oname;
	private String prdimgrep3type;
	
	private byte[] prdimgdetail;
	private String prdimgdetailoname;
	private String prdimgdetailtype;
	
	private String prdtarget;
	private String prdtimes;
	private String prdmethod;
	private String prdeffect;
	private String prdtype;
	private String prdingredient;
	
	private Date prdcreatedat;
	private Date prdupdatedat;
}
