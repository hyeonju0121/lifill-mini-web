package com.mycompany.lifill_mini_web.dto;

import java.sql.Blob;
import java.util.Date;

import lombok.Data;
@Data

public class Review {
	private int revNo;
	private String mId;
	private String prdCode;
	private String revContent;
	private Blob revAttach;
	private Date revDate;
}
