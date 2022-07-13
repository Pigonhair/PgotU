package com.parking.parking.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.parking.parking.dao.ParkingMapper;
import com.parking.parking.vo.ParkingVO;

@Service("parkingService")
public class ParkingServiceImpl implements ParkingService {
   
   @Resource
   private ParkingMapper parkingMapper;

   @Override
   public int getCapacityByParkID(int park_id) {
      int n = parkingMapper.getCapacityByParkID(park_id);
      return n;
      
   }
   
	@Override
	public String getParknameByParkid(int park_id) {
		String park_name = parkingMapper.getParknameByParkid(park_id);
		return park_name;
	}
	@Override
	   public void getInsertParking(ParkingVO vo) {
	      int park_id = parkingMapper.selectPark_id();
	      vo.setPark_id(park_id);
	      parkingMapper.insertParking(vo);
	      
	   }
	
	@Override
		public List<ParkingVO> getmyParkingList(int mem_num) {
			List<ParkingVO> parkinglist = parkingMapper.getmyParkingList(mem_num);
			return parkinglist;
		}
	
//	@Override
//	public ArrayList<Integer> getmyParkIDList(int mem_num) {
//		ArrayList<Integer> parkIDlist = parkingMapper.getmyParkIDList(mem_num);
//		return parkIDlist;
//	}

	@Override
	public void deleteParking(int park_id) {
		parkingMapper.deleteReviewBoard(park_id);
		parkingMapper.deleteParkingDetail(park_id);
		parkingMapper.deleteParking(park_id);		
	}

	
}