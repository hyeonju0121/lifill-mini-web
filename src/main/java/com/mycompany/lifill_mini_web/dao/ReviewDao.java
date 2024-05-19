package com.mycompany.lifill_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.Review;
import com.mycompany.lifill_mini_web.dto.response.ReviewResponse;

@Mapper
public interface ReviewDao {

	void insertReview(Review rev);
	
	List<ReviewResponse> selectReview(String mid);

	int selectReviewCount(String mid);

	List<Review> revSelectByPrdcode(String prdcode);
}
