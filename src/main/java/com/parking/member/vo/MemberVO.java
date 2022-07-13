package com.parking.member.vo;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

/*create table member(
        mem_num number not null, -- 멤버 식별 번호
        mem_id varchar2(20) unique not null, -- 아이디
        mem_auth number(1),  -- 0관리자 1사용자 2사장님
        mem_token varchar2(300), --카카오톡에서 받아올 토큰
        constraint member_pk primary key (mem_num) -- mem_num을 참조하여 member_pk라는 프라이머리키를 만듦
      );

      CREATE TABLE member_detail ( --멤버 상세정보
      mem_num number not null, -- member테이블에서 받아옴

      mem_name varchar2(20) not null, -- 이름
      mem_phone varchar2(20) not null, --전화번호
      mem_dis number(1), -- 0일반인 1몸이 불편하신분들(장애인, 임산부, 노약자 등)

      constraint member_detail_pk primary key (mem_num), 
      constraint member_detail_fk foreign key (mem_num) references member (mem_num)
      );*/
      
public class MemberVO {
	//---------------member-----------------------------
		// 멤버 식별 번호 (시퀀스 사용)
		private int mem_num;
		// 멤버 아이디 (이메일 사용)
		@NotEmpty
		private String mem_id;
		// 관리자 사용자 사장님
		private int mem_auth;
		// 카카오톡에서 받아올 토큰
		@NotEmpty
		private String mem_token;
		//비밀번호
		@NotEmpty
		private String mem_pwd;

		// ----------------member_detail---------------------
		// 이름 (카카오톡 받아온 이름)
		@NotEmpty
		private String mem_name;
		// 핸드폰 번호
		private String mem_phone;
		// 장애여부
		private int mem_dis;

		// ---------------member_car-------------------------------
		// 차량번호
		private String car_id;
		// 차량모델
		private String car_model;
		// 차량 카테코리(소형,중형,대형)
		private String category;

		public String getMem_pwd() {
			return mem_pwd;
		}
		public void setMem_pwd(String mem_pwd) {
			this.mem_pwd = mem_pwd;
		}
		public int getMem_num() {
			return mem_num;
		}
		public void setMem_num(int mem_num) {
			this.mem_num = mem_num;
		}
		public String getMem_id() {
			return mem_id;
		}
		public void setMem_id(String mem_id) {
			this.mem_id = mem_id;
		}
		public int getMem_auth() {
			return mem_auth;
		}
		public void setMem_auth(int mem_auth) {
			this.mem_auth = mem_auth;
		}
		public String getMem_token() {
			return mem_token;
		}
		public void setMem_token(String mem_token) {
			this.mem_token = mem_token;
		}
		public String getMem_name() {
			return mem_name;
		}
		public void setMem_name(String mem_name) {
			this.mem_name = mem_name;
		}
		public String getMem_phone() {
			return mem_phone;
		}
		public void setMem_phone(String mem_phone) {
			this.mem_phone = mem_phone;
		}
		public int getMem_dis() {
			return mem_dis;
		}
		public void setMem_dis(int mem_dis) {
			this.mem_dis = mem_dis;
		}
		public String getCar_id() {
			return car_id;
		}
		public void setCar_id(String car_id) {
			this.car_id = car_id;
		}
		public String getCar_model() {
			return car_model;
		}
		public void setCar_model(String car_model) {
			this.car_model = car_model;
		}
		public String getCategory() {
			return category;
		}
		public void setCategory(String category) {
			this.category = category;
		}
		
		@Override
		public String toString() {
			return "MemberVO [mem_num=" + mem_num + ", mem_id=" + mem_id + ", mem_auth=" + mem_auth + ", mem_token="
					+ mem_token + ", mem_pwd=" + mem_pwd + ", mem_name=" + mem_name + ", mem_phone=" + mem_phone
					+ ", mem_dis=" + mem_dis + ", car_id=" + car_id + ", car_model=" + car_model + ", category="
					+ category + "]";
		}
		
	

		
	}