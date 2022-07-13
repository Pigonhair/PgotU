package com.parking.member.controller;

import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.parking.member.service.certificationService;

@Controller
public class MessageController {
	@GetMapping("/check/sendSMS")
	@ResponseBody 
	 public String sendSMS(String phoneNumber) {

		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}

		System.out.println("폰번호: " + phoneNumber);
		System.out.println("랜덤번호: " + numStr);
		
		certificationService.certifiedPhoneNumber(phoneNumber, numStr);
		return numStr;
	}

}