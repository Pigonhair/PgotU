package com.parking.search.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.parking.search.vo.SearchVO;

public interface SearchMapper {
	
	//Mapper
	public List<SearchVO> selectParkinglist();

	@Select("SELECT * FROM PARKING WHERE park_id=#{park_id}")
	public SearchVO selectParkingbyId(String park_id);
}
