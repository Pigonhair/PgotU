<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/myparking.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#wrap {
  width: 100%;
  max-width: 1800px;
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
  background: #E9EDF1;
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
  background: #474544;
  z-index: 10;
}
.input-content h2 {
  padding-bottom: 10px;
  font-size: 1.625em;
  font-weight: bold;
  vertical-align: middle;
  color:#ffffff;
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

table.memberlist { 
	border-collapse: separate;
	border-spacing: 1px; 
	text-align: center; 
	line-height: 1.5; 
	margin: 20px 10px;
	width:100%;
	}
table.memberlist th { width: 155px; padding: 10px; font-weight: bold; vertical-align: top; color: #fff; background: #ce4869 ;}
table.memberlist td { width: 155px; padding: 10px; vertical-align: top; border-bottom: 1px solid #ccc; background: #eee;}



</style>
</head>
<body>
<div id="wrap" class="input">
  <header class="input-header">
    <a href="${pageContext.request.contextPath}/project/main.do"><h1>Home</h1></a>
  </header>
  <section class="input-content">
      <div>
    	<h2>내 주차장 관리</h2>
    	 <form id="excelForm" action="${pageContext.request.contextPath}/parking/excelDown.do" method = "post">
    	 <div class="excelbutton" onclick="document.getElementById('excelForm').submit();">
<!--     	 <input type = "submit" id ="excelBtn" value = '예약목록 excel로 다운로드'> -->
        </div>
    	 </form>
    	 <button id="insertparking"style="float:right;">주차장 추가하기</button>
   	 </div>
    <div>
    <form class="form-memberlist" id="parkinglist" name="parkinglist" method="post">
	<table class="memberlist">
      <thead>
      <tr>
            <th scope="cols">주차장번호</th>
            <th scope="cols">주차장이름</th>
            <th scope="cols">주차장수용가능 대수(대)</th>
            <th scope="cols">주차장구분</th>
            <th scope="cols" colspan="4">주소</th>            
            <th scope="cols">공용/사설</th>
            <th scope="cols">수정하기</th>
            <th scope="cols">삭제하기</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="myparking" items="${parkinglist}"> 
      <tr>
            <td>${myparking.park_id}</td>
            <td>${myparking.park_name}</td>
            <td>${myparking.park_capacity}</td>
            <td>${myparking.park_type}</td>
            <td colspan="4">${myparking.detailAddr}</td>
            <td>${myparking.park_public}</td>
            <td><button type="submit" id="btn_parking_update" name="btn_parking_update" value="${myparking.park_id}">수정</button></td>
            <td><button type="submit" id="btn_parking_remove" name="btn_parking_remove" value="${myparking.park_id}" formaction="${pageContext.request.contextPath}/parking/DeleteparkingByAdmin.do">삭제</button></td>
	  </tr>
	  </c:forEach>
      </tbody>
	</table>
	</form>
	</div>
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
	
	//수정하기
   $('#btn_parking_update').click(function(){
	   
	});
	
 	//삭제하기
   $('#btn_parking_remove').click(function(){

	});
	
	$('#insertparking').click(function(){
		location.href=ctx+"/parking/parkingInserpage.do";
	});
});
</script>
</body>
</html>