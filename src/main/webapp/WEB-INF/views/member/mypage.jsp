<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@include file="../main/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>

$(document).ready(function() {	
	var ctx = '<%=request.getContextPath()%>';
	
	function goupdate(){
		location.href = ctx + "/member/memberdetail.do"
	}
	function godelete(){
		var choice = window.confirm('회원을 탈퇴하시겠습니까?');
		if(choice){
			$("#memberDelete").submit();
			alert('회원탈퇴 되셨습니다.');
			location.href = ctx + "/member/memberdelete.do"
		}else{
			location.href = ctx + "/member/mypage.do"
		}
	}
	function myparking(){
		location.href = ctx + "/parking/myparking.do"
	}
$("#update").click(function(){
	if($('#mem_pwd').val()==''){
		alert('비밀번호를 입력하세요');
		$('#mem_pwd').focus();
	}else{
		$.ajax({
			 url:'../confirmMemberId.do',
	            type:'post',
	            data:{mem_id:$('#mem_id').val(), mem_pwd:$('#mem_pwd').val() },
	            dataType:'json',
	            cache:false,
	            timeout:30000,
	            success:function(data){
	            	if(data.result == 'ok'){
	            		goupdate();
	            	}else if(data.result =='fail'){
	            		alert("비밀번호가 틀렸습니다.");
	            		$('mem_pwd').val('');
	            	}
	            },
	            error:function(){
	            	alert('네트워크 오류 발생');
	            }
		});
	}
});
$("#delete").click(function(){
	if($('#mem_pwd').val()==''){
		alert('비밀번호를 입력하세요');
		$('#mem_pwd').focus();
	}else{
		$.ajax({
			 url:'../confirmMemberId.do',
	            type:'post',
	            data:{mem_id:$('#mem_id').val(), mem_pwd:$('#mem_pwd').val()},
	            dataType:'json',
	            cache:false,
	            timeout:30000,
	            success:function(data){
	            	if(data.result == 'ok'){
	            		godelete();
	            	}else if(data.result =='fail'){
	            		alert("비밀번호가 틀렸습니다.");
	            		$('mem_pwd').val('');
	            	}
	            },
	            error:function(){
	            	alert('네트워크 오류 발생');
	            }
		});
	}
});

$("#myparking").click(function(){
	if($('#mem_pwd').val()==''){
		alert('비밀번호를 입력하세요');
		$('#mem_pwd').focus();
	}else{
		$.ajax({
			 url:'../confirmMemberId.do',
	            type:'post',
	            data:{mem_id:$('#mem_id').val(), mem_pwd:$('#mem_pwd').val()},
	            dataType:'json',
	            cache:false,
	            timeout:30000,
	            success:function(data){
	            	if(data.result == 'ok'){
	            		myparking();
	            	}else if(data.result =='fail'){
	            		alert("비밀번호가 틀렸습니다.");
	            		$('mem_pwd').val('');
	            	}
	            },
	            error:function(){
	            	alert('네트워크 오류 발생');
	            }
		});
	}
});
});
</script>
<style>
@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,700);

body {
	background: #ffffff;
	font-family: 'Open Sans', sans-serif;
}

.mypage {
	width: 800px;
	margin: 16px auto;
	font-size: 16px;
}

/* Reset top and bottom margins from certain elements */
.mypage-header, .mypage p {
	margin-top: 0;
	margin-bottom: 0;
}

.mypage-header {
	background: #424242;
	padding: 20px;
	font-size: 1.4em;
	font-weight: normal;
	text-align: center;
	text-transform: uppercase;
	color: #fff;
}

.mypage-container {
	background: #ebebeb;
	padding: 12px;
}

/* Every row inside .login-container is defined with p tags */
.mypage p {
	padding: 12px;
}

.mypage input {
	box-sizing: border-box;
	display: block;
	width: 100%;
	border-width: 1px;
	border-style: solid;
	padding: 16px;
	outline: 0;
	font-family: inherit;
	font-size: 0.95em;
}

.mypage input[type="text"], .mypage input[type="password"] {
	background: #fff;
	border-color: #bbb;
	color: #555;
}

/* Text fields' focus effect */
.mypage input[type="text"]:focus, .mypage input[type="password"]:focus {
	border-color: #888;
}

.mypage input[type="button"] {
	background: #565656;
	border-color: transparent;
	color: #fff;
	cursor: pointer;
}

.mypage input[type="button"]:hover {
	background: #000000;
}

/* Buttons' focus effect */
.mypage input[type="button"]:focus {
	border-color: #05a;
}
</style>
<meta charset="UTF-8">
<title>my page</title>
</head>
<body>
	<div class="mypage">
		<h2 class="mypage-header">My Page</h2>
		<form id="memberDelete"name = "mypage" method="post" class="mypage-container" >
			<p>
				<input id="mem_id" type="text" value="${memberVO.mem_id}"
					name="mem_id" placeholder="아이디" required readonly />
			</p>
			<p>
				<input type="password" id="mem_pwd" class="mem_pwd" name="mem_pwd"
					placeholder="Password">
			</p>
			<p>
				<input type="button" id="update" class="user_update" value="회원정보 수정">
			</p>
			<p>
				<input type="button" id="myparking" class="user_parking" value="내 주차장">
			</p>
			<p>
				<input type="button" id="delete" class="user_delete" value="회원탈퇴">
			</p>
			
		</form>
	</div>
	</body>
</html>