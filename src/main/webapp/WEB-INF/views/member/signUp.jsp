<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
.input-content .inputbox-content #mem_id{
  position: relative;
  width: 500px;
}
.input-content .inputbox-content #confirmMemberId{
  position: relative;
  width: 500px;
}

.input-content .inputbox-content #confirmMemberId {
  width: 500px;
  height: 30px;
  box-sizing: border-box;
  line-height: 30px;
  font-size: 14px;
  border: 0;
  background: none;
  outline: none;
  border-radius: 0;
  -webkit-appearance: none;
  text-align:left;
}
.input-content .inputbox-content #confirmMemberpwd{
  position: relative;
  width: 500px;
}

.input-content .inputbox-content #confirmMemberpwd {
  width: 500px;
  height: 30px;
  box-sizing: border-box;
  line-height: 30px;
  font-size: 14px;
  border: 0;
  background: none;
  outline: none;
  border-radius: 0;
  -webkit-appearance: none;
  text-align:left;
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
</style>
</head>
<body>
<div id="wrap" class="input">
  <header class="input-header">
    <h1>회원가입</h1>
  </header>
  
  <section class="input-content">
    <h2>회원가입<span>*은 필수 입력사항입니다.</span></h2>
    <form  action="${pageContext.request.contextPath}/member/insert.do" method="post">
    <div class="input-content-wrap">
      <dl class="inputbox">
        <dt class="inputbox-title">* 아이디</dt>
        <dd class="inputbox-content">
          <input id="mem_id" type="text" value="${mem_id}" placeholder="아이디" name="mem_id" required />
          <input id="mem_token" type="hidden" value="${mem_token}" name="mem_token" required readonly/>          
          <label for="input0">${id}</label>
          <span class="underline"></span>
        </dd>
        <dd class="inputbox-content">
          <input id="confirmMemberId" type="text" value="ID 중복체크" readonly>
        </dd>  
      </dl>
      <div>
      	
      </div>
      <dl class="inputbox">
        <dt class="inputbox-title">* 비밀번호</dt>
        <dd class="inputbox-content">
          <input id="mem_pwd" type="password" name="mem_pwd" required/>
          <label for="input0">비밀번호</label>
          <span class="underline"></span>
        </dd>
      </dl>
      <dl class="inputbox">
        <dt class="inputbox-title">* 비밀번호확인</dt>
        <dd class="inputbox-content">
          <input id="mem_pwd_chk" type="password" name="mem_pwd_chk" required/>
          <label for="input0">비밀번호</label>
          <span class="underline"></span>
        </dd>
        <dd class="inputbox-content">
          <input id="confirmMemberpwd" type="text" value="비밀번호확인 확인" readonly>
        </dd>
      </dl>      
      <dl class="inputbox">
        <dt class="inputbox-title">* 이름</dt>
        <dd class="inputbox-content">
          <input id="mem_name" type="text" placeholder="이름" value="${mem_name}" name="mem_name" required/>
          <label for="input0"></label>
          <span class="underline"></span>
        </dd>
      </dl>
      <dl class="inputbox">
        <dt class="inputbox-title">* 전화번호</dt>
        <dd class="inputbox-content">
          <input id="mem_phone" type="text" name="mem_phone" required/>
          <label for="input0">전화번호</label>
          <span class="underline"></span>
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
	
   $("#mem_id").change(function(){
	   var regMsg = /^[A-Za-z0-9+]{4,10}$/
       if(!regMsg.test($('#mem_id').val())){
          $('#confirmMemberId').css('color','red').val('아이디는 영문,숫자 4자이상 10자이하로 입력하세요');
          $('#mem_id').focus();
          return;
	   } else{
	      $('#confirmMemberId').css('color','black').val('ID 중복체크');//메시지 초기화
	   }
	   
	   $.ajax({
	       url:'isMemberId.do',
	       type:'post',
	       data:{mem_id:$('#mem_id').val()},
	       dataType:'json',
	       cache:false,
	       timeout:30000,
	       success:function(data){
	          if(data.result == 'fail'){
	        	  $('#confirmMemberId').css('color','red').val('ID 중복체크 결과 | 사용중인 ID, 다른 ID를 입력해주세요');
	              $('#mem_id').val('').focus();
	          }else if(data.result == 'ok'){
	        	  $('#confirmMemberId').css('color','green').val('ID 중복체크 결과 | 사용가능ID');
	          }
	       },
	       error:function(){
	          checkId = 0;
	          $('#loading').hide();//로딩 이미지 감추기
	          alert('네트워크 오류 발생');
	       }
	    });
       
   });
   
   $("#mem_pwd").change(function(){
	   var mem_pwd = $("#mem_pwd").val();
	   var mem_pwd_chk = $("#mem_pwd_chk").val();
       if(mem_pwd == mem_pwd_chk ){
          $('#confirmMemberpwd').css('color','green').val('비밀번호가 같습니다.');
	   } else{
          $('#confirmMemberpwd').css('color','red').val('비밀번호를 확인해주세요');
          $('#mem_pwd').focus();
          return;
	   }
       
   });
   
   $("#mem_pwd_chk").change(function(){
	   var mem_pwd = $("#mem_pwd").val();
	   var mem_pwd_chk = $("#mem_pwd_chk").val();
       if(mem_pwd == mem_pwd_chk ){
          $('#confirmMemberpwd').css('color','green').val('비밀번호가 같습니다.');
	   } else{
          $('#confirmMemberpwd').css('color','red').val('비밀번호를 확인해주세요');
          $('#mem_pwd').focus();
          return;
	   }
   });
});
</script>
</body>
</html>