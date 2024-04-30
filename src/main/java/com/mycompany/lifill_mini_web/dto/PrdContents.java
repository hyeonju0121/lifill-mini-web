package com.mycompany.lifill_mini_web.dto;

import java.sql.Blob;

import lombok.Data;

@Data
public class PrdContents {
	private String prdCode;
	private Blob prdImgRep1;
	private Blob prdImgRep2;
	private Blob prdImgRep3;
	private Blob prdImgDetail;
	private String prdTarget;
	private String prdTimes;
	private String prdMethod;
	private String prdEffect;
	private String prdType;
	private String prdIngredient;
}
