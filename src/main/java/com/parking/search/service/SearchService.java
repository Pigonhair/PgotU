package com.parking.search.service;

import java.util.List;
import java.util.Map;

import com.parking.search.vo.SearchVO;

public interface SearchService {
	public List<SearchVO> selectParkinglist();

	public SearchVO selectParkingbyId(String park_id);
}
