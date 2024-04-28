package com.mycompany.lifill_mini_web.dto;

import java.sql.Blob;

import lombok.Data;

@Data
public class PrdImage {
	private int pmgId;
	private String prdCode;
	private Blob pmgRep1;
	private Blob pmgRep2;
	private Blob pmgRep3;
	private Blob pmgDetail;	
}