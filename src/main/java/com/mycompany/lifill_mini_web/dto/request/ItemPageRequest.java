package com.mycompany.lifill_mini_web.dto.request;

import com.mycompany.lifill_mini_web.dto.Pager;

import lombok.Data;

@Data
public class ItemPageRequest {
	// 페이징에 필요한 파라미터를 받을 DTO 
	private String subCategory;
	private String sort;
	private String filter;
	private String pageNo;
	private Pager pager;

}
