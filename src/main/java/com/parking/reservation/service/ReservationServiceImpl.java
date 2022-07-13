package com.parking.reservation.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.parking.reservation.dao.ReservationMapper;
import com.parking.reservation.vo.ReservationVO;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService {

   @Resource
   private ReservationMapper reservationMapper;

   @Override
   public void inseReser(ReservationVO vo) {
      System.out.println("**********impl 들어옴******");
      // 시퀀스 reser_id 적용하고
      vo.setReser_id(reservationMapper.selectReser());
      System.out.println("InsertReservation : vo.getReser_id() : " + vo.getReser_id());

      reservationMapper.inserReser(vo);

   }

   @Override
   public int selectCheckParkingList(ReservationVO vo) {
      int n = reservationMapper.selectCheckParkingList(vo);     
      return n;
   }

   @Override
   public List<ReservationVO> getmyReservationList(int mem_num) {
	   List<ReservationVO> reservationlist = reservationMapper.getmyReservationList(mem_num);
	   return reservationlist;

}

}