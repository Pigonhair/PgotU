<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
   display: inline-block;
   margin: 30px 0 0 10px;
   color: #000000;
   font-family: "jua";
   font-size: 50px;
}
</style>
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
<h1 class="reviewtitle">주차장리뷰</h1>
<a class="btn btn-primary" href="${pageContext.request.contextPath}/review/reviewInsert.do" style="float:right;">리뷰쓰기</a>
<div>
<div class="review">
<div id="output">
<!-- ajax 영역 -->
</div>
</div>
<div>
</div>
</section>
</div>
<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javaScript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script>

$(document).ready(function(){
	var ctx = '<%=request.getContextPath()%>';
	var currentPage;
	var count;
	var rowCount;
	
	//목록호출
	function selectData(pageNum){
		currentPage = pageNum;
		
		if(pageNum==1){
			//처음 호출시 해당 ID의 div 내부 내용물 제거
			$('#output').empty();
		}
		
		//로딩 이미지 노출
		$('#loading').show();
		
		$.ajax({
			type:'post',
			data:{pageNum:currentPage},
			url:'reviewListAjax.do',
			dataType:'json',
			cache:false,
			timeout:10000,
			success:function(data){

				$('#loading').hide();
				curmem_num = data.mem_num;
				count = data.count;
				rowCount = data.rowCount;
				var list = data.list;
				

				if(count<0 || list==null){
					alert('목록 호출 오류 발생!');
				}else{
					$(list).each(function(index,item){
						if(item.mem_num == curmem_num){
							var img = item.img; 
							var output='<div class="container">';
							output = '<h1 class="my-4"></h1>';
							output += '<div class="row">';
							output += '<div class="col-md-7">';
							/* output += '<a href="#">'; */
	 						output += '<img class="img-fluid rounded mb-3 mb-md-0" src="${pageContext.request.contextPath}/resources/images/lion.jpg" alt="">';  
// 	 						output += '<img class="img-fluid rounded mb-3 mb-md-0" src="<spring:url value = "/images/'+img+'"/> ">'; 
							/* output += '</a>'; */
							output += '</div>';
							output += '<div class="col-md-5">';
							output += '<button type="button" id="review_update" name="review_update" class="btn btn-primary" style="float:right; color: #fff;" value="'+item.review_num+'" >수정하기</button>'
							output += '<h1>'+item.park_name+'</h1>';
							output += '<h3>'+item.review_title+'</h3>'; 
							output += '<p>'+item.review_content+'</p>'; 
							output += '</div>';
							output += '</div>';
							output += '<hr>';
							//문서 객체에 추가
							$('#output').append(output);								
						} else {
							var img = item.img; 
							var output='<div class="container">';
							output = '<h1 class="my-4"></h1>';
							output += '<div class="row">';
							output += '<div class="col-md-7">';
							/* output += '<a href="#">'; */
	 						output += '<img class="img-fluid rounded mb-3 mb-md-0" src="${pageContext.request.contextPath}/resources/images/lion.jpg" alt="">'; 
// 	 						output += '<img class="img-fluid rounded mb-3 mb-md-0" src="<spring:url value = "/images/'+img+'"/> ">'; 
							/* output += '</a>'; */
							output += '</div>';
							output += '<div class="col-md-5">';
							output += '<h1>'+item.park_name+'</h1>';
							output += '<h3>'+item.review_title+'</h3>'; 
							output += '<p>'+item.review_content+'</p>'; 
							output += '</div>';
							output += '</div>';
							output += '<hr>';
							//문서 객체에 추가
							$('#output').append(output);	
						}
					
					});
				}
			},
			error:function(){
				//로딩 이미지 숨김
				$('#loading').hide();
				alert('네트워크 오류');
			}
		});		
	}
	//스크롤시 데이터 추가
	$(window).scroll(function(){
		
		var scrollTop = $(document).scrollTop();
		var docHeight = $(document).height();
		var winHeight = $(window).height();
		
		if(scrollTop >= docHeight - winHeight){
			if(currentPage>=Math.ceil(count/rowCount)){
				//다음페이지 없을때
				return;
			}else{
				//다음페이지 있을때
				var pageNum = currentPage +1;
				selectData(pageNum);
			}
		}
		
	});
	
	//1페이지 호출
	selectData(1);
	
});

//리뷰 수정하기
$(document).on("click", "#review_update", function(){
	var ctx = '<%=request.getContextPath()%>';
	var review_num = $("#review_update").val();
	location.href= ctx +"/review/reviewupdatepage.do?review_num="+review_num;
});
</script>
</body>
</html>