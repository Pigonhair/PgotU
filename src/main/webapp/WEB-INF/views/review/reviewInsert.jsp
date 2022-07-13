<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${path}/resources/css/Search.css" />
<link rel="stylesheet" href="${path}/resources/css/Search2.css" />
<link rel="stylesheet" href="${path}/resources/css/parkingList.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${path}/resources/css/custom.css">

<script src="js/bootstrap.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c59597a942774a145bf6ea568ac28488&libraries=services,clusterer,drawing"></script>
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
  max-width: 1300px;
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
.reviewtitle {
   margin: 30px 0 0 10px;
   color: #000000;
   font-family: "jua";
   font-size: 50px;
}
.reviewInsertForm{
	width: 100%;
}
</style>
<meta charset="utf-8" />
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<body>
<div id="wrap" class="input">
  <header class="input-header">
    <a href="${pageContext.request.contextPath}/project/main.do"><h1>Home</h1></a>
  </header>
  <!-- CSS only -->
  <section class="input-content">
<div class="page_reviewList">
<h1 class="reviewtitle" style="text-align: center;" >주차장 사용 후기를 작성해 주세요 :)</h1>
<div>

		<div class="container">
		<div class="row">
			<form:form class="reviewInsertForm"
				action="/project/review/reviewInsert.do" commandName="reviewVO">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">
							<form:select name="select-profession" id="select-profession" path="park_id">
									<form:option value="0">주차장선택</form:option>
									<c:forEach var="parking" items="${list}">
										<form:option value="${parking.park_id}">
											${parking.park_name}, ${parking.park_type}, ${parking.detailAddr}, 
											${parking.park_public}</form:option>
										<br>
									</c:forEach>
							</form:select></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><form:input type="text" class="form-control"
									placeholder="리뷰 제목" path="review_title" name="review_title" /></td>
						</tr>
						<tr>
							<td><form:input type="textarea" class="form-control"
									placeholder="리뷰 내용" name="review_content" path="review_content"
									style="height:400px;" /></td>
						</tr>
					</tbody>
				</table>				
				<input type="submit" class="btn btn-primary pull-right" style="margin-left: 20px;" value="등록">
				<input type="button" id="btnReview" class="btn btn-primary pull-right" value="뒤로가기" onClick="location.href='${pageContext.request.contextPath}/review.do'">
			</form:form>

		</div>
	</div>

<div>
</div>
</section>
</div>
<script>

</script>
</body>

</html>