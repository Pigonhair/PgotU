<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" href="${path}/resources/js/SMS.js" /> --%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
html, body {
  height: 100%;
  background: #e0e0e0;
  font-family: sans-serif;
  font-size: 14px;
}

#wrap {
  width: 100%;
  max-width: 900px;
  margin: 0 auto 60px;
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.25);
}

.input::before {
  content: "";
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 300px;
  background: #0f1041;
}
.input-header {
  position: relative;
  padding-top: 80px;
  color: #fff;
}
.input-header h1 {
  padding-bottom: 25px;
  font-size: 3.25em;
  font-weight: 100;
}
.input-content {
  position: relative;
  padding: 44px 55px;
  background: #fff;
  z-index: 10;
}
.input-content h2 {
  padding-bottom: 45px;
  font-size: 1.625em;
  font-weight: bold;
  vertical-align: middle;
}
.input-content h2 span {
  display: inline-block;
  margin-left: 10px;
  padding: 5px 6px 3px;
  border: 1px solid #ffca00;
  border-radius: 4px;
  font-size: 0.85rem;
  vertical-align: middle;
  color: #ffca00;
}
.input-content .inputbox {
  overflow: hidden;
  position: relative;
  padding: 15px 0 28px 200px;
}
.input-content .inputbox-title {
  position: absolute;
  top: 15px;
  left: 0;
  width: 200px;
  height: 30px;
  color: #666;
  font-weight: bold;
  line-height: 30px;
}
.input-content .inputbox-content {
  position: relative;
  width: 100%;
}
.input-content .inputbox-content input {
  width: 500px;
  height: 30px;
  box-sizing: border-box;
  line-height: 30px;
  font-size: 14px;
  border: 0;
  background: none;
  border-bottom: 1px solid #ccc;
  outline: none;
  border-radius: 0;
  -webkit-appearance: none;
}
.input-content .inputbox-content input:focus ~ label, .input-content .inputbox-content input:valid ~ label {
  color: #2962ff;
  transform: translateY(-20px);
  font-size: 0.825em;
  cursor: default;
}
.input-content .inputbox-content input:focus ~ .underline {
  width: 500px;
}
.input-content .inputbox-content label {
  position: absolute;
  top: 0;
  left: 0;
  height: 30px;
  line-height: 30px;
  color: #ccc;
  cursor: text;
  transition: all 200ms ease-out;
  z-index: 10;
}
.input-content .inputbox-content .underline {
  content: "";
  display: block;
  position: absolute;
  bottom: -1px;
  left: 0;
  width: 0;
  height: 2px;
  background: #2962ff;
  transition: all 200ms ease-out;
}
.input-content .btns {
  padding: 30px 0 0 200px;
}
.input-content .btns .btn {
  display: inline-block;
  margin-right: 2px;
  padding: 10px 25px;
  background: none;
  border: 1px solid #c0c0c0;
  border-radius: 2px;
  color: #666;
  font-size: 1.125em;
  outline: none;
  transition: all 100ms ease-out;
}
.input-content .btns .btn:hover, .input-content .btns .btn:focus {
  transform: translateY(-3px);
}
.input-content .btns .btn-confirm {
  border: 1px solid #2962ff;
  background: #2962ff;
  color: #fff;
}

.c-number {
	background-color: black;
	color: white;
	border: 0;
	border-radius: 15px;
	display: inline;
	float: right; 
	margin-right: 100px;
    padding: 10px 6px;
	width: 25%;
	height: 100%;
	font-size: 13px;
	font-weight: bold;
	cursor: pointer;
	opacity: 1;
	visibility: visible;
	-webkit-transition: all 0.3s ease;
}

.c-number:hover {
	transition: all 0.3s ease;
	background-color: rgba(0, 0, 0, 0.8);;
}

</style>
</head>
<body>
<div id="wrap" class="input">
  <header class="input-header">
    <h1>회원가입</h1>
  </header>
  
  <section class="input-content">
    <h2>회원가입<span>*은 필수 입력사항입니다.</span></h2>
    <form  action="${pageContext.request.contextPath}/member/signUpkakao.do" method="post">
    <div class="input-content-wrap">
      <dl class="inputbox">
        <dt class="inputbox-title">* 아이디</dt>
        <dd class="inputbox-content">
          <input id="mem_id" type="text" value="${mem_id}" placeholder="아이디" name="mem_id" required readonly />
          <input id="mem_token" type="hidden" value="${mem_token}" name="mem_token" required readonly/>          
          <label for="input0">${id}</label>
          
          <span class="underline"></span>
        </dd>
      </dl>
      <dl class="inputbox">
        <dt class="inputbox-title">* 이름</dt>
        <dd class="inputbox-content">
          <input id="mem_name" type="text" placeholder="이름" value="${mem_name}" name="mem_name" required readonly/>
          <label for="input0"></label>
          <span class="underline"></span>
        </dd>
      </dl>
      <dl class="inputbox">
        <dt class="inputbox-title">* 전화번호</dt>
        <dd class="inputbox-content">
          <input id="mem_phone" type="text" name="mem_phone" style="width: 280px;" required/>
          <label for="input0">전화번호</label>
          <span class="underline"></span>
          <button type="button" class="c-number" id="sendPhoneNumber" onclick="smsclick();">인증번호 받기</button>
        </dd>
      </dl>
      
      <dl class="inputbox">
        <dt class="inputbox-title">* 인증번호확인</dt>
        <dd class="inputbox-content">
          <input id="inputCertifiedNumber" type="text" name="inputCertifiedNumber" style="width: 280px;" required/>
          <label for="input0">인증번호입력</label>
          <span class="underline"></span>
          <span><button type="button" class="c-number" id ="checkBtn">인증확인</button></span>
        </dd>
      </dl>
      
      <dl class="inputbox">
        <dt class="inputbox-title">* 차량번호</dt>
        <dd class="inputbox-content">
          <input id="carid" type="text" name="carid" required/>
          <label for="input0">차량번호</label>
          <span class="underline"></span>
        </dd>
      </dl>
      <dl class="inputbox">
        <dt class="inputbox-title">* 차량모델</dt>
        <dd class="inputbox-content">
          <input id="carmodel" type="text" name="carmodel" required/>
          <label for="input0">차량모델</label>
          <span class="underline"></span>
        </dd>
      </dl>
      
      <dl class="inputbox">
        <dt class="inputbox-title">* 소형,중형,대형</dt>
        <dd class="inputbox-content">
          <select title="category" id="category" name="category">
             <option value="big-sized" selected="selected">대형</option>
             <option value="medium-sized">중형</option>
             <option value="small-sized">소형</option>
          </select>     
        </dd>
      </dl>
      <dl class="inputbox">
        <dt class="inputbox-title">* 장애여부 </dt>
        <dd class="inputbox-content">
          <select title="mem_dis" id="mem_dis" name="mem_dis">
             <option value="ordi" selected="selected">일반</option>
             <option value="dis">장애인</option>
          </select>
        </dd>
      </dl>
      <dl class="inputbox">
        <dt class="inputbox-title">* 사용자구분</dt>
        <dd class="inputbox-content">
          <select title="mem_auth" id="mem_auth" name="mem_auth">
             <option value="user" selected="selected">일반사용자</option>
             <option value="owner">주차장 소유자</option>
          </select>        
        </dd>
      </dl>
      <div class="btns">
          <input type="hidden" id="sms_chk" value="N"/>
          <input type="submit" class="btn btn-confirm" value="회원가입">
          <input type="button" id="btn_home" class="btn btn-confirm" value="취소">
          
      </div>
    </div>
    </form>
  </section>
</div>
<script>

$(document).ready(function() {
	//context path가져오기
	var ctx = '<%=request.getContextPath()%>';
	//홈으로 돌아가기 버튼
   $("#btn_home").click(function(){
	   location.href=ctx+"/project/main.do";
   });

});

function smsclick(){
	 let phoneNumber = $('#mem_phone').val();
		Swal.fire('인증번호 발송 완료!')

		$.ajax({
			type : "GET",
			url : "../check/sendSMS",
			data : {
				"phoneNumber" : phoneNumber
			},
			success : function(res) {
				$('#checkBtn').click(function() {
					if ($.trim(res) == $('#inputCertifiedNumber').val()) {
						
						Swal.fire({
							icon : 'success',
							title : '인증성공',
							text : '휴대폰 인증이 정상적으로 완료되었습니다.',
						})
						$("#mem_phone").attr("readonly",true);
						$('#sms_chk').val("Y");
					} else {
						Swal.fire({
							icon : 'error',
							title : '인증오류',
							text : '인증번호가 올바르지 않습니다!',
						})
					}
				})
			}
		});
}

</script>
</body>
</html>