package com.parking.parking.service;

import java.util.ArrayList;
import java.util.List;

import com.parking.parking.vo.ParkingVO;

public interface ParkingService {
    
   public int getCapacityByParkID(int park_id);

   public String getParknameByParkid(int park_id);
   
   public void getInsertParking(ParkingVO vo);
   
   public void deleteParking(int park_id);

   public List<ParkingVO> getmyParkingList(int mem_num);
   
//   public ArrayList<Integer> getmyParkIDList(int mem_num);
}