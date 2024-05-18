package com.mycompany.lifill_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.lifill_mini_web.dto.Review;

@Mapper
public interface ReviewDao {

	void insertReview(Review rev);
}
