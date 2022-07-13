//package com.parking.parking.service;
//
//import java.util.List;
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import com.parking.parking.dao.ParkingMapper;
//import com.parking.reservation.vo.ReservationVO;
//
//@Service("excelService")
//@Transactional
//public class excelServiceImpl implements excelService {
//
//	 @Resource
//	 private ExcelMapper excelMapper;
//	
//	@Override
//	public void excelDown(ReservationVO reserVO, HttpServletResponse response) throws Exception {
//		
//		List<ReservationVO> reserList = excelMapper.selectReserList(reserVO);
//		
//		try {
//			//Excel Down 시작
//			Workbook workbook = new HSSFWorkBook();
//		}
//		
//	}
//
//}
