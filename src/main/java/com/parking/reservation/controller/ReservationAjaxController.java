package com.parking.reservation.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.parking.parking.service.ParkingService;
import com.parking.reservation.service.ReservationService;
import com.parking.reservation.vo.ReservationVO;

@Controller
public class ReservationAjaxController {
   private Logger log = Logger.getLogger(this.getClass());

   @Resource
   private ReservationService reservationService;
   
   @Resource
   private ParkingService parkingService;
   

   @RequestMapping(value="/confirmParkingList.do", method=RequestMethod.POST)
   //ajax문자열을 읽을 수 있게 해줌
   @ResponseBody
   //일반회원 아이디 중복 체크해주는 메서드
   public Map<String,String> process(@RequestParam("parkID") String park_id, @RequestParam("startTime") String start_time, @RequestParam("endTime") String end_time){

      System.out.println("ajaxController들어옴");
      Map<String,String> map = new HashMap<String,String>();
      
      ReservationVO vo = new ReservationVO();
      vo.setPark_id(Integer.parseInt(park_id));
      vo.setStart_time(start_time);
      vo.setEnd_time(end_time);
      
      System.out.println("vo에서 받아온 park_id값: " + vo.getPark_id());
      System.out.println("vo에서 받아온 start_time값: " + vo.getStart_time());
      System.out.println("vo에서 받아온 end_time값: " + vo.getEnd_time());
      
      int count = reservationService.selectCheckParkingList(vo);
      int park_capacity = parkingService.getCapacityByParkID(Integer.parseInt(park_id));

      System.out.println("count값: " + count);
      System.out.println("park_capacity값: " + park_capacity);
      
      //count가 있으면
      if(count >= park_capacity) {
         //주차불가능
         map.put("result", "NotAvailable");
      }else {
         //이용가능
         map.put("result", "Available");
      }

      return map;
   }

   

}










