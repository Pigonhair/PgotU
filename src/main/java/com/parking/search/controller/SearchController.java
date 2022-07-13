package com.parking.search.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.parking.search.service.SearchService;
import com.parking.search.vo.SearchVO;


@Controller
public class SearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Resource
	SearchService searchService;

	//자바빈(VO) 초기화
	@ModelAttribute
	public SearchVO initCommand() {
		return new SearchVO();
	}

	//search화면
	@RequestMapping(value = "/project/search.do")
	public ModelAndView mapTest() {

		
		//총 글의 갯수 또는 검색된 글의 갯수
		List<SearchVO> list = searchService.selectParkinglist();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/search/search");
		mav.addObject("list", list);
		return mav;
	}
	
	
}
