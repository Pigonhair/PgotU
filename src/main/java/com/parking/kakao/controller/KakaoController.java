package com.parking.kakao.controller;




import java.io.IOException;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.parking.kakao.model.KakaoProfile;
import com.parking.kakao.model.OAuthToken;
import com.parking.main.controller.MainController;
import com.parking.member.controller.MemberController;
import com.parking.member.service.MemberService;
import com.parking.member.vo.MemberVO;


@Controller
public class KakaoController{
	
   
	@Resource
	private MemberService memberService;
	
	private MemberVO membervo = new MemberVO();
	
   @GetMapping("/kakao/callback")
   public ModelAndView kakaoCallback(String code, HttpServletRequest request, Model model, HttpSession session) {

       ModelAndView mav = new ModelAndView();
       
//       http요청을 편하게 할수 있는 RestTemplate
//       Post 방식으로 key=value 테이터를 요청 (카카오쪽으로) 밑에 rt 라이브러리
      RestTemplate rt = new RestTemplate();

      // HTTPHeader 오브잭트 생성
      HttpHeaders headers = new HttpHeaders();
      headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
      
      // HttpBody 오브젝트 생성
      MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
      params.add("grant_type", "authorization_code");
      params.add("client_id", "1c3b9f39414b27ae345af84b892b3495"); 	
      params.add("redirect_uri", "http://localhost:8080/project/kakao/callback");
      params.add("code", code);
      
//       HttpHeader와 HttpBody를 하나의 오브젝트에 담기 밑 response에 넣기위해
      HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<MultiValueMap<String, String>>(
            params, headers);

//       Http 요청하기 - Post 방식으로 - 그리고 response 변수의 응답 받음
      ResponseEntity<String> response = rt.exchange(
            "https://kauth.kakao.com/oauth/token",
            HttpMethod.POST,   
            kakaoTokenRequest, 
            String.class);
//      // Gson, ObjectMapper
      ObjectMapper objectMapper = new ObjectMapper();
      OAuthToken oauthToken = null;
      try {
         oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
      } catch (JsonParseException  e) {
         e.printStackTrace();
      } catch (JsonMappingException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      System.out.println("카카오톡 엑서스 토큰 : " + oauthToken.getAccess_token());
      
      
      RestTemplate rt2 = new RestTemplate();

      // HTTPHeader 오브잭트 생성
      HttpHeaders headers2 = new HttpHeaders();
      headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
      headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
      
      
      
//       HttpHeader와 HttpBody를 하나의 오브젝트에 담기 밑 response에 넣기위해
      HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = new HttpEntity<MultiValueMap<String, String>>(
            params, headers2);

//       Http 요청하기 - Post 방식으로 - 그리고 response 변수의 응답 받음
      ResponseEntity<String> response2 = rt2.exchange(
            "https://kapi.kakao.com/v2/user/me",
            HttpMethod.POST,   
            kakaoProfileRequest, 
            String.class);
      
      ObjectMapper objectMapper2 = new ObjectMapper();
      KakaoProfile kakaoProflie = null;
      try {
         kakaoProflie = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
      } catch (JsonParseException  e) {
         e.printStackTrace();
      } catch (JsonMappingException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      
      
      membervo = memberService.isMemberID(Integer.toString(kakaoProflie.getId()));
      if(membervo != null) {
          //*************************************회원가입 되어있는경우**********************************
    	  System.out.println("이미 회원가입 되어있는 아이디입니다.");
    	  membervo = memberService.getMemberByID(Integer.toString(kakaoProflie.getId()));
    	  
    	  System.out.println("회원이름 :" + membervo.getMem_name());
    	  
    	  //session에 토큰넣어놓기
          session.setAttribute("mem_token", membervo.getMem_token());
    	  System.out.println("세션에 넣은 토큰값 : " + membervo.getMem_token());
    	  
          mav.setViewName("redirect:/member/logOK.do");
         return mav;  
      } else {
          //*************************************회원가입 안되있는경우**********************************
    	  membervo = new MemberVO();
    	  
    	  System.out.println("회원가입 안되어있는 아이디입니다.");
          System.out.println("kakao ID : " + kakaoProflie.getId()); // member id
          membervo.setMem_id(Integer.toString(kakaoProflie.getId()));
          membervo.setMem_token(oauthToken.getAccess_token());
          System.out.println("kakao Token : " + oauthToken.getAccess_token());
          membervo.setMem_name(kakaoProflie.getProperties().getNickname());
          System.out.println("kakao Nickname : " + kakaoProflie.getProperties().getNickname());
          
           mav.addObject("mem_id",membervo.getMem_id());
           mav.addObject("mem_name",membervo.getMem_name());
           mav.addObject("mem_token",membervo.getMem_token());
           mav.setViewName("/member/signUpKakao");
          return mav;  
      }
   }
   

   @RequestMapping("/member/logOK.do")
   public String logOK(HttpServletRequest request, Model model, HttpSession session) {
	   
	   model.addAttribute("logOK",1); //로그인 완료되었을 때
	   model.addAttribute("mem_name",membervo.getMem_name());
	   return "main/main";
   }

}