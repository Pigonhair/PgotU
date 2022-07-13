package com.parking.reservation.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parking.member.service.MemberService;
import com.parking.member.vo.MemberVO;
import com.parking.reservation.service.ReservationService;
import com.parking.reservation.vo.ReservationVO;

@Controller
public class ReservationController {

	@Resource
	ReservationService reservationService;
	@Resource
	MemberService memberService;

	// 로그 처리
//   private Logger log = Logger.getLogger(this.getClass());

	// 자바빈(VO) 초기화
	// 서버 유효성 체크시 필수로 필요
	@ModelAttribute("reservationVO")
	public MemberVO initCommand() {
		return new MemberVO();
	}

	@RequestMapping(value = "/project/reserveInsert.do", method = RequestMethod.POST)
	public String kakaoInsert(HttpServletRequest request, ModelMap model, HttpSession session)
			throws UnsupportedEncodingException, ParseException {
		request.setCharacterEncoding("UTF-8");

		ReservationVO vo = new ReservationVO();

		String pakring_Selected = request.getParameter("parking_id_selected");
		System.out.println("주차장번호 : " + pakring_Selected);

		// park_id 셋팅
		int park_id = Integer.parseInt(pakring_Selected);
		vo.setPark_id(park_id);
		System.out.println("vo에서가져온Park_id값 : " + vo.getPark_id());

		// park_name 가져오기
		String park_name = request.getParameter("parking_name_selected");
		System.out.println("주차장이름 : " + park_name);

		// session에서토큰으로 사용자확인
		String mem_token = (String) session.getAttribute("mem_token");
		System.out.println("mem_token :" + mem_token);

		// 토큰으로 memberVO가져오기
		MemberVO memberVO = memberService.getMemberbytoken(mem_token);
		int mem_num = memberVO.getMem_num();
		vo.setMem_num(mem_num);
		System.out.println("mem : " + vo.getMem_num());

		String car_num = request.getParameter("car_num");
		vo.setCar_num(car_num);
		System.out.println("vo에서가져온car_num값: " + vo.getCar_num());

		// 문자열로 받아온 데이터 시간차 계산해서 총가격 측정
		String start_time = request.getParameter("start_time");
		String end_time = request.getParameter("end_time");

		SimpleDateFormat fm = new SimpleDateFormat("HH:mm");
		Date d1 = fm.parse(start_time);
		Date d2 = fm.parse(end_time);
		long diff = d2.getTime() - d1.getTime();
		long diffHours = diff / (60 * 60 * 1000) % 24;
		long diffMinutes = diff / (60 * 1000) % 60;
		long totalMinutes = diffMinutes + (diffHours * 60);
		System.out.println("시간차:" + diffHours + "시" + diffMinutes + "분");
		System.out.println("총 예약 분: " + totalMinutes);
		long price = 100 * totalMinutes;
		int totalPrice = (int) price;
		System.out.println("총 가격: " + totalPrice + "원");

		// start time, end_time, totalPrice VO에 값 넣기
		vo.setStart_time(start_time);
		vo.setEnd_time(end_time);
		vo.setTotalPrice(totalPrice);

		System.out.println("**********controller 들어옴******");

		reservationService.inseReser(vo);

		model.addAttribute("payprice", totalPrice);
		model.addAttribute("start_time", start_time);
		model.addAttribute("end_time", end_time);
		model.addAttribute("park_name", park_name);
		model.addAttribute("car_num", car_num);

		return "pay/pay";
	}

	@RequestMapping(value = "/parking/excelDown.do")
	public void excelDown(HttpServletResponse response, Locale locale, Model model, HttpSession session)
			throws Exception {
		// 예약목록조회(지정된 주차장만)
		String mem_token = (String) session.getAttribute("mem_token");
		MemberVO memberVO = memberService.getMemberbytoken(mem_token);
		System.out.println(memberVO);
// 		//토큰이용해서 로그인한 사람의 주차장번호만 조회 > 이까진 됐음
//		(+그 주차장번호(리스트형식)로 예약목록리스트 가져와야함)
// 		List<Integer> parkIDlist = parkingService.getmyParkIDList(memberVO.getMem_num());
// 		System.out.println(parkIDlist); 

		List<ReservationVO> reservationlist = reservationService.getmyReservationList(memberVO.getMem_num());
		System.out.println(reservationlist);

		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("예약관리명단");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;

		// 테이블 헤더용 스타일
		CellStyle headStyle = wb.createCellStyle();

		// 가는 경계선을 가집니다.
		headStyle.setBorderTop(BorderStyle.THIN);
		headStyle.setBorderBottom(BorderStyle.THIN);
		headStyle.setBorderLeft(BorderStyle.THIN);
		headStyle.setBorderRight(BorderStyle.THIN);

		// 배경색은 노란색입니다.

		headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		// 데이터는 가운데 정렬합니다.
		headStyle.setAlignment(HorizontalAlignment.CENTER);

		// 데이터용 경계 스타일 테두리만 지정
		CellStyle bodyStyle = wb.createCellStyle();
		bodyStyle.setBorderTop(BorderStyle.THIN);
		bodyStyle.setBorderBottom(BorderStyle.THIN);
		bodyStyle.setBorderLeft(BorderStyle.THIN);
		bodyStyle.setBorderRight(BorderStyle.THIN);

		// 헤더 생성
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("예약 번호");
		
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("주차장 번호");

		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("사용자 번호");
		
		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("주차 시작시간");
		
		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("주차 종료시간");
		
		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("차 번호");
		
		cell = row.createCell(6);
		cell.setCellStyle(headStyle);
		cell.setCellValue("지불 비용");

		// 데이터 부분 생성
		for (ReservationVO vo : reservationlist) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getReser_id());

			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getPark_id());

			cell = row.createCell(2);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getMem_num());
			
			cell = row.createCell(3);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getStart_time());
			
			cell = row.createCell(4);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getEnd_time());
			
			cell = row.createCell(5);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getCar_num());
			
			cell = row.createCell(6);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getTotalPrice());

		}

		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename=Parking.xls");

		// 엑셀 출력
		wb.write(response.getOutputStream());
		wb.close();
	}

}