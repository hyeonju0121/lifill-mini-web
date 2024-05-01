package com.mycompany.lifill_mini_web.type;

import com.fasterxml.jackson.annotation.JsonCreator;

/*
 --------------------
    게시판 공지사항 유형 분류
 - 일반, 상품, 배송
 --------------------
 */
public enum BoardNoticeType {
	GENERAL, 
	PRODUCT,
	DELIVERY;

	@JsonCreator
	public static BoardNoticeType from(String s) {
        return BoardNoticeType.valueOf(s.toUpperCase());
    }
	
}
