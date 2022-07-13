package com.parking.parking.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.parking.parking.vo.ParkingVO;

public interface ParkingMapper {

	@Select("SELECT PARK_CAPACITY FROM PARKING WHERE park_id=#{park_id}")
	public int getCapacityByParkID(int park_id);

	@Select("SELECT PARK_NAME FROM PARKING WHERE PARK_Id=#{park_id}")
	public String getParknameByParkid(int park_id);

	@Select("SELECT park_id.nextval FROM dual")
	public int selectPark_id();

	@Insert("INSERT INTO Parking(park_id, park_name, park_capacity, mem_num, park_type,detailAddr,park_public)"
			+ "VALUES (#{park_id},#{park_name},#{park_capacity},#{mem_num}, #{park_type},#{detailAddr},#{park_public})")
	public void insertParking(ParkingVO vo);

	@Select("SELECT * FROM PARKING WHERE MEM_NUM=#{mem_num}")
	public List<ParkingVO> getmyParkingList(int mem_num);
	
//	@Select("SELECT PARK_ID FROM PARKING WHERE MEM_NUM=#{mem_num}")
//	public ArrayList<Integer> getmyParkIDList(int mem_num);

	@Delete("DELETE FROM REVIEWBOARD WHERE PARK_id= #{park_id}")
	public void deleteReviewBoard(int park_id);
	@Delete("DELETE FROM PARKING_DETAIL WHERE PARK_id= #{park_id}")
	public void deleteParkingDetail(int park_id);
	@Delete("DELETE FROM PARKING WHERE PARK_id= #{park_id}")
	public void deleteParking(int park_id);

}