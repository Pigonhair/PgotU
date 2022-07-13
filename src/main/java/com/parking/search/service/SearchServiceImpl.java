package com.parking.search.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.parking.search.dao.SearchMapper;
import com.parking.search.vo.SearchVO;

@Service("searchService")
public class SearchServiceImpl implements SearchService{
	
	@Resource
	SearchMapper searchMapper;
	
	@Override
	public List<SearchVO> selectParkinglist() {
		return searchMapper.selectParkinglist();
	}
	
	@Override
	public SearchVO selectParkingbyId(String park_id) {
		return searchMapper.selectParkingbyId(park_id);
	}
}
