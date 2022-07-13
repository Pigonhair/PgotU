package com.parking.parking.service;

import javax.servlet.http.HttpServletResponse;

import com.parking.reservation.vo.ReservationVO;

public interface excelService {

	public void excelDown(ReservationVO reserVO, HttpServletResponse response) throws Exception;
}
