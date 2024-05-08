package com.mycompany.lifill_mini_web.dto;


import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Board {
	private int bno;
	private String mid;
	
	private String btitle;
	private String bcontent;
	
	private String battachoname; // 파일 원래 이름
	private String battachtype; // 파일 종류
	private byte[] battachdata;
	
	private MultipartFile battach;
	
	private String btype; // 게시물 유형 - 공지사항, 자주묻는질문
	private String bsubcategory; // 게시글 서브 카테고리 - 공지사항, 자주묻는질문
	private int bhitcount;
	
	private Date bcreatedat;
	private Date bupdatedat;
	private int seq;
}
