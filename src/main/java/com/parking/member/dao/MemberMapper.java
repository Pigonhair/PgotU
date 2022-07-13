package com.parking.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.parking.member.vo.MemberVO;


public interface MemberMapper {

	
	
	/************************ Member Register ************************/
	// 멤버 mem_num 시퀀스 적용하기 
	@Select("SELECT mem_num.nextval FROM dual")
	public int selectMem_num();
	
	//member테이블에 member 정보 입력
	@Insert("INSERT INTO MEMBER (mem_num, mem_id, mem_auth, mem_token, mem_pwd)"
			+ "VALUES (#{mem_num},#{mem_id},#{mem_auth},#{mem_token}, #{mem_pwd})")
	public void insertMember(MemberVO vo);	
	
	//member_detail 테이블에 추가 입력
	@Insert("INSERT INTO member_detail(mem_num,mem_name,mem_phone,mem_dis)"
			+ "VALUES(#{mem_num},#{mem_name},#{mem_phone},#{mem_dis})")
	public void insertMember_detail(MemberVO vo);
	
	@Insert("INSERT INTO member_car(mem_num,car_id,car_model,category)"
			+ "VALUES(#{mem_num},#{car_id},#{car_model},#{category})")
	public void insertMember_car(MemberVO vo);
	/************************ Member Register ************************/

	
	/************************ mem_id로 member, member_detail가져오기 ************************/
	@Select("select mem_num,mem_id,mem_auth,mem_token, mem_pwd, mem_name,mem_phone,mem_dis from member\r\n" + 
			"left join member_detail using(mem_num) where mem_id=#{mem_id}")
	public MemberVO isMemberID(String mem_id);
	
	/************************ mem_token로 member, member_detail, member_car가져오기 ************************/
	@Select("select a.mem_num\r\n" + 
			"	,a.mem_id\r\n" + 
			"	,a.mem_auth\r\n" + 
			"	,a.mem_token\r\n" + 
			"	,b.mem_name\r\n" + 
			"	,b.mem_phone\r\n" + 
			"	,b.mem_dis\r\n" + 
			"	,c.car_id\r\n" + 
			"	,c.car_model\r\n" + 
			"	,c.category\r\n" + 
			"	from member a\r\n" + 
			"	inner join member_detail b\r\n" + 
			"		on a.mem_num = b.mem_num\r\n" + 
			"	inner join member_car c\r\n" + 
			"		on b.mem_num = c.mem_num\r\n" + 
			"	where mem_token=#{mem_token}")
	public MemberVO getMemberbytoken(String mem_token);
	
	/************************ member정보 업데이트하기 ************************/
	@Update("update member set mem_auth =#{mem_auth} where mem_num=#{mem_num}")
	public void updateMember(MemberVO vo);
	
	@Update("update member_detail set mem_phone=#{mem_phone}, mem_dis=#{mem_dis} where mem_num=#{mem_num}")
	public void updateMember_detail(MemberVO vo);
	
	@Update("update member_car set car_id=#{car_id},car_model=#{car_model},category=#{category} where mem_num=#{mem_num}")
	public void updateMember_car(MemberVO vo);
	/************************ member정보 업데이트하기 ************************/


	@Select("SELECT mem_num,mem_id,mem_pwd,mem_auth,mem_token,mem_name,mem_phone,mem_dis FROM MEMBER\n" + 
			"left join member_detail using (mem_num) WHERE MEM_ID = #{mem_id}")
	public MemberVO getMemberByID(String mem_id);

	@Select("SELECT * FROM MEMBER WHERE MEM_ID = #{mem_id} AND MEM_PWD = #{mem_pwd} ")
	public MemberVO CheckMemberIdPwd(MemberVO vo);

	/************************ 회원데이터(member, pakring)삭제 ************************/
	@Delete("DELETE FROM MEMBER_CAR WHERE MEM_NUM= #{mem_num}")
	public void deletemember_car(int mem_num);
	@Delete("DELETE FROM MEMBER_DETAIL WHERE MEM_NUM= #{mem_num}")
	public void deletemember_detail(int mem_num);
	@Delete("DELETE FROM REVIEWBOARD WHERE MEM_NUM= #{mem_num}")
	public void deletereview(int mem_num);
	@Delete("DELETE FROM PARKING WHERE MEM_NUM= #{mem_num}")
	public void deleteparking(int mem_num);
	@Delete("DELETE FROM RESERVATION WHERE MEM_NUM= #{mem_num}")
	public void deletereservation(int mem_num);
	@Delete("DELETE FROM MEMBER WHERE MEM_NUM= #{mem_num}")
	public void deletemember(int mem_num);
	/************************ member삭제 ************************/

	@Select("SELECT MEM_NUM FROM MEMBER WHERE MEM_TOKEN = #{mem_token}")
	public int getMemnumBytoken(String mem_token);


	/************************ memberList ************************/
	@Select("select a.mem_num\r\n" + 
			"	,a.mem_id\r\n" + 
			"	,a.mem_auth\r\n" + 
			"	,a.mem_token\r\n" + 
			"	,b.mem_name\r\n" + 
			"	,b.mem_phone\r\n" + 
			"	,b.mem_dis\r\n" + 
			"	,c.car_id\r\n" + 
			"	,c.car_model\r\n" + 
			"	,c.category\r\n" + 
			"	from member a\r\n" + 
			"	inner join member_detail b\r\n" + 
			"		on a.mem_num = b.mem_num\r\n" + 
			"	inner join member_car c\r\n" + 
			"		on b.mem_num = c.mem_num\r\n")
	public List<MemberVO> getMemberList();

	@Select("SELECT * FROM MEMBER WHERE MEM_ID = #{mem_id}")
	public MemberVO isMemberId(String mem_id);
}
