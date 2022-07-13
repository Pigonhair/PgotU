package com.parking.pay.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class PayController {

	
	/*
	 * @Resource PayService payService;
	 * 
	 * //자바빈(VO) 초기화
	 * 
	 * @ModelAttribute public PayVO initCommand() { return new PayVO(); }
	 */

	//search화면
	@RequestMapping(value = "/pay/pay.do")
	public String payReservation(HttpServletRequest request,Locale locale, Model model,HttpSession session) {

		return "pay/pay";
	}
	
	
	//결제 완료
	@RequestMapping(value = "/pay/payok.do")
	public String payok(HttpServletRequest request,Locale locale, Model model,HttpSession session) {

		return "pay/payok";
	}
	
	
}
