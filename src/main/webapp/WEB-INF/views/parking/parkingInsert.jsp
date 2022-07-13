<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
request.setCharacterEncoding("UTF-8");
String parkngAr = request.getParameter("parkngAr");
String btnAddress = request.getParameter("btnAddress");
%>
<script type="text/javaScript"
   src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
   $(document).ready(function() {
      //주소찾기 daum api
      //주소찾기 daum api
      $("#btnAddress").click(function() {
         new daum.Postcode({
            oncomplete : function(data) {
               var addr = data.address; // 최종 주소 변수
               // 주소 정보를 해당 필드에 넣는다.
               document.getElementById("btnAddress").value = addr;

            }
         }).open();
      });

   });
</script>


<html>
<head>

<link rel="stylesheet" href="${path}/resources/css/sajang.css">



<style>
</style>
<title>주차장추가하기</title>
</head>
<body>
   <%
   request.setCharacterEncoding("UTF-8");
   %>

   <div class="wrapper">
      <form
         action="${pageContext.request.contextPath}/parking/parkingInsert.do"
         method="post">

         <hr class="sep" />
         <div class="group">
            <input type="text" required="required" name="parking_name_selected" /><span
               class="highlight"></span><span class="bar"></span> <label>주차장
               이름을 입력해 주세요</label>
         </div>
         <div class="group">
            <input type="text" required="required" id="btnAddress"
               name="detailAddr" style="display: inline" /> <span
               class="highlight"></span><span class="bar"></span> <label>상세
               주소를 입력해 주세요</label>
         </div>
         <div class="group">
            <input type="number" required="required" name="park_capacity" /><span
               class="highlight"></span><span class="bar"></span> <label>총
               주차 가능대수</label>
         </div>


         <div>
            <h5>주차장 타입을 골라주세요</h5>
            <input type="checkbox" class="option-input radio" name="toggle"
               value="1" /> 야외주차장 <input type="checkbox"
               class="option-input radio" name="toggle" value="2" /> 실내주차장

         </div>

         <h5>-------------------------------------------</h5>
         <div>

            <input type="radio" class="option-input radio" id="option-one"
               name="selector" /> 공용 <input type="radio"
               class="option-input radio" id="option-two" name="selector" /> 사설

         </div>
         <div class="btn-box">
            <button class="btn btn-submit" type="submit">submit</button>
            <button class="btn btn-cancel" type="button">cancel</button>

         </div>
      </form>
   </div>
</html>