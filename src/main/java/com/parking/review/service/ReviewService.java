package com.parking.review.service;

import java.util.List;
import java.util.Map;

import com.parking.review.vo.ReviewVO;

public interface ReviewService {

	/*
	 * 리뷰 쓰기
	 * selectReview_num(); 에서 식별번호 불러옴
	 * insertReview(ReviewVO reviewvo); 로 리뷰쓰기
	 */
	
	public void insertReview(ReviewVO reviewvo);
		
	//리뷰 리스트 호출
	public List<ReviewVO> allReviewList(Map<String,Object> map);
	
	//게시판 글 갯수 카운트
	public int selectCount(Map<String,Object> map);

	//리뷰 작성자확인
	public int getReviewMemNum(int review_num);

	//수정할 리뷰 가져오기
	public ReviewVO getReviewbyReviewNum(int review_num);

	//리뷰 수정하기
	public void updateReview(ReviewVO reviewvo);

	
}
