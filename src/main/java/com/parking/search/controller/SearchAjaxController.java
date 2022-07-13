package com.parking.search.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.parking.member.service.MemberService;
import com.parking.member.vo.MemberVO;
import com.parking.search.service.SearchService;
import com.parking.search.vo.SearchVO;


@Controller
public class SearchAjaxController {

	@Resource
	private SearchService searchService;

	@RequestMapping(value="/searchParkingbyId.do", method=RequestMethod.POST)
	@ResponseBody
	public JSONObject process(HttpServletRequest request, HttpSession session,
			@RequestParam("park_id") String park_id){

		System.out.println("주차장아이디 in SearchAjaxController : " + park_id);

		SearchVO vo = searchService.selectParkingbyId(park_id);
		System.out.println("Park_name() : " + vo.getPark_name());

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("park_id", Integer.toString(vo.getPark_id()));
		jsonObject.put("park_name", vo.getPark_name());
		jsonObject.put("park_capacity", Integer.toString(vo.getPark_capacity()));
		jsonObject.put("mem_num", Integer.toString(vo.getMem_num()));
		jsonObject.put("park_type", vo.getPark_type());
		jsonObject.put("detailAddr", vo.getDetailAddr());
		jsonObject.put("park_public", Integer.toString(vo.getPark_public()));
		System.out.println("jsonObject : " + jsonObject);

		return jsonObject;
	}
}