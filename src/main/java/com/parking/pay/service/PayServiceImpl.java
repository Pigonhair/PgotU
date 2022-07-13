package com.parking.pay.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.parking.pay.dao.PayMapper;
import com.parking.search.vo.SearchVO;

@Service("payService")
public class PayServiceImpl implements PayService{
	
	@Resource
	PayMapper payMapper;

}
