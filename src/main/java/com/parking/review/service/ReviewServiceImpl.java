package com.parking.review.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.parking.review.dao.ReviewMapper;
import com.parking.review.vo.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{

	@Resource
	private ReviewMapper reviewmapper;
	
	
	@Override
	public void insertReview(ReviewVO reviewvo) {
		reviewvo.setReview_num(reviewmapper.selectReview_num());		
		reviewmapper.insertReview(reviewvo);
		
	}


	@Override
	public List<ReviewVO> allReviewList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return reviewmapper.allReviewList(map);
	}


	@Override
	public int selectCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return reviewmapper.selectCount(map);
	}

	@Override
	public int getReviewMemNum(int review_num) {
		int mem_num = reviewmapper.getReviewMemNum(review_num);
		return mem_num;
	}
	
	@Override
	public ReviewVO getReviewbyReviewNum(int review_num) {
		ReviewVO reviewVO = reviewmapper.getReviewbyReviewNum(review_num);
		return reviewVO;
	}
	
	@Override
	public void updateReview(ReviewVO reviewvo) {
		reviewmapper.updateReview(reviewvo);
	}
}
