<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

table.memberlist { border-collapse: separate; border-spacing: 1px; text-align: center; line-height: 1.5; margin: 20px 10px;}
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
    <h2>회원관리</h2>
    <form class="form-memberlist" id="memberlist" name="memberlist" action="${pageContext.request.contextPath}/member/DeletememberByAdmin.do" method="post">
	<table class="memberlist">
      <thead>
      <tr>
            <th scope="cols">회원번호</th>
            <th scope="cols">회원아이디</th>
            <th scope="cols">회원구분</th>
            <th scope="cols">회원이름</th>
            <th scope="cols">전화번호</th>
            <th scope="cols">차량번호</th>            
            <th scope="cols">차량모델</th>
            <th scope="cols">차량구분</th>
            <th scope="cols">삭제하기</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="member" items="${memberlist}"> 
      <tr>
            <td>${member.mem_num}</td>
            <td>${member.mem_id}</td>
            <td>${member.mem_auth}</td>
            <td>${member.mem_name}</td>
            <td>${member.mem_phone}</td>
            <td>${member.car_id}</td>
            <td>${member.car_model}</td>
            <td>${member.category}</td>
            <td><button type="submit" id="btn_member_remove" name="btn_member_remove" value="${member.mem_num}">삭제</button></td>
	  </tr>
	  </c:forEach>
      </tbody>
	</table>
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

	$('#memberlist').submit(function(){
		var choice = window.confirm('삭제하시겠습니까?');
		if(choice){
			alert('삭제완료!');
		}else{
			return false;
		}
	});
});
</script>
</body>
</html>