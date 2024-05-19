package com.mycompany.lifill_mini_web.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.lifill_mini_web.dao.ReviewDao;
import com.mycompany.lifill_mini_web.dto.Review;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReviewService {
	
	@Resource
	private ReviewDao reviewDao;
	
	// 전체 리뷰 목록 조회 (유저네임, 리뷰내용, 상품코드, 평점)
	public List<Review> getReviewList(String prdcode){
		
		//사용자 정보 가져오기
		List<Review> reviewList = reviewDao.revSelectByPrdcode(prdcode);
		
		return reviewList;
	}
}
