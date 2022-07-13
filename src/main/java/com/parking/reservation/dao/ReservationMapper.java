
package com.parking.reservation.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.parking.parking.vo.ParkingVO;
import com.parking.reservation.vo.ReservationVO;
import com.parking.search.vo.SearchVO;

public interface ReservationMapper {

   // reservation 테이블 reser_id 시퀀스 적용하기
   @Select("SELECT reser_id_reservation.nextval FROM dual")
   public int selectReser();
   
   // reservation 테이블에 정보 입력
   @Insert("INSERT INTO RESERVATION (reser_id,park_id,mem_num,start_time,end_time,car_num,totalPrice)"
         + " values(#{reser_id},#{park_id},#{mem_num},#{start_time},#{end_time},#{car_num},#{totalPrice})")
   public void inserReser(ReservationVO vo);

    // ReservationMapper.Xml참조
    public int selectCheckParkingList(ReservationVO vo);
 
    // 예약목록 가져오기
	@Select("SELECT * FROM RESERVATION WHERE MEM_NUM=#{mem_num}")
	public List<ReservationVO> getmyReservationList(int mem_num);
}