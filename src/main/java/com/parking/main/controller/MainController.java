package com.parking.main.controller;

import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.parking.member.service.MemberService;
import com.parking.member.vo.MemberVO;


@Controller
public class MainController {
	
	@Resource
	private MemberService memberService;
	
	
	@RequestMapping("/project/main.do")
	public String getMain(HttpServletRequest request,Locale locale, Model model,HttpSession session) {

		 String mem_token = (String)session.getAttribute("mem_token");
		 System.out.println("Maincontroller.session.mem_token  " + mem_token);
		 
		 if(mem_token != null) {
			 //session에 토큰이 있을경우
			 MemberVO memberVO = memberService.getMemberbytoken(mem_token);
			 
			 System.out.println("로그인하는 사용자 :" + memberVO.getMem_name());
			 model.addAttribute("logOK",1); //로그인 완료되었을 때
			 model.addAttribute("mem_name",memberVO.getMem_name());
		 } else {
			 //session에 토큰이 없을 경우
			 model.addAttribute("logOK",0); //로그인안됬을 때
		 }
		 
		return "main/main";
	}
	
	
}
