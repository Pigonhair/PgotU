package com.parking.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.parking.member.service.MemberService;
import com.parking.member.vo.MemberVO;


@Controller
public class MemberAjaxController {

	@Resource
	private MemberService memberService;
	
	@RequestMapping(value="/confirmMemberId.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> process(HttpServletRequest request, HttpSession session,
			@RequestParam("mem_id") String mem_id, 
			@RequestParam("mem_pwd") String mem_pwd){
		
		System.out.println("아이디 및 비밀번호 확인 in MemberAjaxController");
		
		MemberVO vo = new MemberVO();
		vo.setMem_id(mem_id);
		vo.setMem_pwd(mem_pwd);
		MemberVO member = memberService.CheckMemberIdPwd(vo);
		
		Map<String,String> map = new HashMap<String,String>();

		if(member!=null) {
			//로그인 성공
			map.put("result", "ok");
			session.setAttribute("mem_token", member.getMem_token());
    	   System.out.println("세션에 넣은 토큰값 : " + member.getMem_token());
		}else {
			//로그인 실패
			map.put("result", "fail");
		}

		return map;
	}
	
	@RequestMapping(value="/member/isMemberId.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> process(HttpServletRequest request, HttpSession session,
			@RequestParam("mem_id") String mem_id){
		System.out.println("아이디 및 비밀번호 확인 in MemberAjaxController");
		
		MemberVO member = memberService.isMemberId(mem_id);
		
		Map<String,String> map = new HashMap<String,String>();

		if(member!=null) {
			//사용할 수 없는 아이디입니다
			map.put("result", "fail");
		}else {
			//사용할 수 있는 아이디입니다.
			map.put("result", "ok");
		}

		return map;
	}
}
