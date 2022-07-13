package com.parking.review.vo;

public class ReviewVO {

	//리뷰 식별번호
	private int review_num;
	//리뷰 타이틀
	private String review_title;
	//리뷰 내용
	private String review_content;
	//리뷰 쓴 날짜
	private String review_date;
	//회원 번호
	private int mem_num;
	//주차장 식별번호
	private int park_id;
	//주차장 이름
	private String park_name;
	//주차장 이름
	private String img;

	
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getPark_id() {
		return park_id;
	}
	public void setPark_id(int park_id) {
		this.park_id = park_id;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getPark_name() {
		return park_name;
	}
	public void setPark_name(String park_name) {
		this.park_name = park_name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "ReviewVO [review_num=" + review_num + ", review_title=" + review_title + ", review_content="
				+ review_content + ", review_date=" + review_date + ", mem_num=" + mem_num + ", park_id=" + park_id
				+ ", park_name=" + park_name + ", img=" + img + "]";
	}
	
}
