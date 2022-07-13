<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.io.PrintWriter"%>
<%
	String mem_token = (String) session.getAttribute("mem_token");
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a4fc31dd472c61220b10d05b1cec480c&libraries=services"></script>
<script src="${path}/resources/js/LoginPopup.js"></script>
<script>
function gohome(){
	location.href=ctx+"/proejct/main.do";
}

$(document).ready(function() {	
	
	var ctx = '<%=request.getContextPath()%>';
	
	//로그인버튼
    $("#loginBtn").click(function(){
   	 	 var mem_id = $('input[name='+mem_id+']').val();
		 var meme_pwd = $('input[name='+meme_pwd+']').val();
		 
		if($('#mem_id').val()==''){
           alert('아이디를 입력해주세요');
           $('#mem_id').focus();
		} else{
			if($('#mem_pwd').val()==''){
				alert('비밀번호를 입력해주세요');
	           $('#mem_pwd').focus();
			} else{
				$.ajax({
		            url:'../confirmMemberId.do',
		            type:'post',
		            data:{mem_id:$('#mem_id').val(),mem_pwd:$('#mem_pwd').val() },
		            dataType:'json',
		            cache:false,
		            timeout:30000,
		            success:function(data){
		               if(data.result == 'ok'){
		                  //로그인성공
		            	   gohome();
		               }else if(data.result == 'fail'){
		                  //로그인실패
		                  alert("아이디 또는 비밀번호가 틀렸습니다.");
		                  $('#mem_id').val('').focus();
		                  $('#mem_pwd').val('');
		               }
		            },
		            error:function(){
		               alert('네트워크 오류 발생');
		            }
		         });				
			}
		}
		
   });
	
	
	
	//회원가입
    $("#signUpBtn").click(function(){
 		location.href=ctx+"/member/signUp.do";
    });	
    
	//로그아웃
   $("#logout").click(function(){
		location.href=ctx+"/member/logOut.do";
   });	
	
	//내정보 보기
   $("#myinfo").click(function(){
		location.href=ctx+"/member/mypage.do";
   });
	
	
	//로그인 popup창 열기
   $("#loginpopup").click(function(){
      var blur = document.getElementById('blur');
      blur.classList.toggle('active')
      var main_content = document.getElementById('main_content');
      main_content.classList.toggle('main_content')
      var popup = document.getElementById('popup');
      popup.classList.toggle('active')
   });
   
   //로그인 popup창 닫기
   $(".btn_exit").click(function(){
      var blur = document.getElementById('blur');
      blur.classList.toggle('active')
      var main_content = document.getElementById('main_content');
      main_content.classList.toggle('main_content')
      var popup = document.getElementById('popup');
      popup.classList.toggle('active')
   });
   
   //주소찾기 daum api
   $("#btnAddress").click(function(){
      new daum.Postcode({
          oncomplete: function(data) {
              var addr = data.address; // 최종 주소 변수
              // 주소 정보를 해당 필드에 넣는다.
              document.getElementById("btnAddress").value = addr;

          }
      }).open();
   });
   
	//내정보
   $(".myinfo").click(function(){
		var ctx = '<%=request.getContextPath()%>';
		//홈으로 돌아가기 버튼
	   $("#btn_home").click(function(){
		   location.href=ctx+"/member/memberdetail.do";
	   });
   });
	
	$('#form_Address').submit(function(){
		if($('#btnAddress').val() == ''){
           alert('주소를 입력해주세요');
           $('#btnAddress').focus();
           return false;
		} 
	});
});
</script>


<style>
#popup.active{
      visibility: visible;
      opacity:1;
      transition : 0.5s;
}

#popup{
    position: fixed;
     background: #e7e7e7;
/*      border: groove black; */
     left: 25%;
     top: 25%; 
     width: 50%;
     height: 50%;
     z-index: 100;
     visibility: hidden;
     opacity:0;
     transition : 0.5s;
     background: url('https://pexels.imgix.net/photos/27718/pexels-photo-27718.jpg?fit=crop&w=1280&h=823') left no-repeat;
     background-size:cover;
}

.container#blur.active{
   filter: blur(20px);
   pointer-events: none;
   user-select:none;
}
.main_content.main_content{
   filter: blur(20px);
   pointer-events: none;
   user-select:none;
}

@media ( max-width : 1230px) {
   #main_content .fbox {
      padding-right: 0;
      padding-bottom: 30px;
   }
}

@media ( max-width : 1230px) {
   #main_content .fbox dl {
      width: 50%;
   }
}

@media ( max-width : 1230px) {
   #main_content .fbox dl {
      border-bottom: 1px solid #dddddd;
   }
}

@media ( max-width : 1230px) {
   #main_content .btn_reserv {
      float: left;
      width: 49.5%;
   }
}

@media ( max-width : 1230px) {
   #main_content .btn_wrap {
      display: inline-block;
      float: left;
      position: relative;
      width: 100%;
      top: 0;
      right: 0;
      padding: 30px 30px 0;
   }
}
</style>
<title>Parking</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${path}/resources/css/main.css" />
<link rel="stylesheet" href="${path}/resources/css/mainbackground.css" />
<link rel="stylesheet" href="${path}/resources/css/LoginBtn.css" />
<link rel="stylesheet" href="${path}/resources/css/LoginPopup.css" />

</head>
<body>

<%
	PrintWriter script = response.getWriter();
	script.println("<a class = \"background2\" id = \"logo\" href=\"../project/main.do\">");
	script.println("<img class = \"background2\" src =\"../resources/images/parking--.png\"/>");
	script.println("</a>");
	script.println("<div class=\"container\" id=\"blur\">");
// 	script.println("<img class=\"background\" src=\"https://s3-us-west-2.amazonaws.com/s.cdpn.io/221808/sky.jpg\" />");
    script.println("<img class=\"background\" src=\"../resources/images/back.jpg\" />");
	
	int x = 0;
	for(x=0; x<=200 ; x++){
		
		script.println("<div class=\"circle-container\">");
		script.println("<div class=\"circle\"></div>");
		script.println("</div>");
	
}%>
      
<c:if test="${logOK==0}">     
   <a href="#" class="cta" id="loginpopup">
       <span>로그인</span> 
       <svg width="13px" height="10px" viewBox="0 0 13 10">
    <path d="M1,5 L11,5"></path>
    <polyline points="8 1 12 5 8 9"></polyline>
  </svg>
      </a>
      </div>
</c:if>
      
<c:if test="${logOK==1}">
   <a href="#" class="cta" id="logout">
       <span>로그아웃</span> 
    <path d="M1,5 L11,5"></path>
    <polyline points="8 1 12 5 8 9"></polyline>
  </svg>
   </a>
  <a href="#" class="cta" id="myinfo">
       <span>${mem_name}님</span> 
    <path d="M1,5 L11,5"></path>
    <polyline points="8 1 12 5 8 9"></polyline>
  </svg>
   </a>
   </div>
</c:if>

 
  <form action="${pageContext.request.contextPath}/project/search.do" id="form_Address" style = "height: 200" method=post> 
   <div id="main_content">
         <fieldset>
            <legend>.</legend>
            <div class="fbox">
               <dl>
                  <dt>목적지</dt>
                  <dd class="cal_wrap main">
                     <input type="text" id="btnAddress" name="btnAddress" placeholder="목적지를 선택하세요">
                  </dd>
               </dl>
               <p class="btn_wrap">
                  <input type="submit" id="btnReserve"  class="btn_reserv" value="찾 기"></input>
                  <input type="button" id="btnReview" class="btn_review" value="주차장 리뷰" onClick="location.href='${pageContext.request.contextPath}/review.do'"></input>
               </p>
            </div>
         </fieldset>
         <div id="resve_able_info" class="fc_wine"
            style="padding-left: 20px; padding-top: 10px;"></div>
         <div id="resve_able_info2"
            style="padding-left: 20px; padding-top: 0px;"></div>
         <input type="hidden" id="iLotArea" name="iLotArea">
         <p align="middle"><iframe width="450" height="280" src="https://www.youtube.com/embed/zEk_a6UiTJg?" style="align:left; margin-top: 10px;" frameborder="0" allowfullscreen></iframe></p>
         </div>
      </form>
      
      
   
   <!-- 로그인 팝업창 -->
    <div id="popup">
     <form class="form-container">
       <div class="container2">
  <div class='window'>
    <div class='overlay'></div>
    <div class='content2'>
    <div><button type="button" class='btn_exit'>x</button></div>
      <div class='welcome'>예약이</div>
      <div class='welcome2'>필요한 순간, <span style="color:#ffd400">피갓츄</span></div>
      <div class='subtitle'>현재 1,352,786명의 회원이 피갓츄에서 활동하고 있습니다.
<span style="color:#ffd400">1,352,787</span>번째 피갓츄회원이 되어보세요 :)</div>
      <div class='input-fields'>
        
        <input type='text' id="mem_id" placeholder='아이디' name="mem_id" class='input-line full-width'></input>
        <input type='password' id="mem_pwd" placeholder='패스워드' name="mem_pwd" class='input-line full-width'></input>
      </div>
      
	  <div class='spacing'><div class='spacing'>
      <input type="submit" id="loginBtn" class='ghost-round full-width' value="로그인하기" ></div>
      <a href="https://kauth.kakao.com/oauth/authorize?client_id=1c3b9f39414b27ae345af84b892b3495&redirect_uri=http://localhost:8080/project/kakao/callback&response_type=code">
      <img src="../resources/images/kakaolog.png" style="height:50px; width:300px"></a>
      <div><button type="button" id="signUpBtn" class='ghost-round full-width'>피갓츄 회원가입 하기   
      </button></div>
    </div>
    </div>
  </div>
  
     </form>
   </div>
</body>

</html>