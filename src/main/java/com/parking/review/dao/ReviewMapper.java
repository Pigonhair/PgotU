package com.parking.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.parking.review.vo.ReviewVO;
import com.parking.search.vo.SearchVO;

public interface ReviewMapper {

	//리뷰 식별번호 정하기
	@Select("SELECT review_seq.nextval FROM dual")
	public int selectReview_num();
	
	//리뷰 쓰기
	@Insert("INSERT INTO reviewBoard (review_num, review_title, review_date, review_content, mem_num, park_id, park_name) "
			+ "VALUES(#{review_num},#{review_title},SYSDATE,#{review_content},#{mem_num},#{park_id},#{park_name})")
	public void insertReview(ReviewVO reviewvo);
	
	//리뷰 수정
	/*
	 * @Update("UPDATE reviewBoard SET reviewTitle=?, reviewContent=?, WHERE reviewNum=?"
	 * ) public void updateReview(reviewVO reviewvo);
	 */
	
	//리뷰 삭제
	
	
	
	//리뷰 리스트 불러오기
	public List<ReviewVO> allReviewList(Map<String,Object>map);
	public int selectCount(Map<String,Object>map);

	//리뷰작성자 가져오기
	@Select("SELECT MEM_NUM FROM REVIEWBOARD WHERE REVIEW_NUM = #{review_num}")
	public int getReviewMemNum(int review_num);
	
	//수정할 리뷰 가져오기
	@Select("SELECT * FROM REVIEWBOARD WHERE REVIEW_NUM = #{review_num}")
	public ReviewVO getReviewbyReviewNum(int review_num);
	
	//리뷰 수정하기
	@Update("UPDATE REVIEWBOARD SET REVIEW_TITLE=#{review_title}, REVIEW_CONTENT=#{review_content} WHERE REVIEW_NUM = #{review_num}")
	public void updateReview(ReviewVO reviewvo);

	
	//리뷰 순서대로 따오기
	/*
	 * @Select("SELECT reviewID FROM reviewBoard ORDER BY reviewID DESC") public int
	 * getNextReview();
	 */
	
	//리뷰 주차장별로 검색
	/*
	 * @Select("SELECT reviewID FROM reviewBoard WHERE parkNum=?") public int
	 * morahaji();
	 */
	
	
	
	
}
