<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.util.Calendar" %>

<%
request.setCharacterEncoding("UTF-8");
%>

<%
Calendar cal = Calendar.getInstance();
%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.7.js"></script>
<!-- 결제 -->
<link rel="stylesheet" href="${path}/resources/css/Search.css" />
<link rel="stylesheet" href="${path}/resources/css/Search2.css" />
<link rel="stylesheet" href="${path}/resources/css/pay.css" />


<script>
	/* $(document).ready(function(){ */
	IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	/* var IMP = window.IMP; */

	function pay() {
// 		alert("버튼눌림");

		var IMP = window.IMP;

		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문명:결제테스트',
			amount : ${payprice},
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
			m_redirect_url : '${pageContext.request.contextPath}/pay/payok.do'
		},

		function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});

	};

	//결제페이지

	/* }) */
</script>


<meta charset="utf-8" />
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<div class="wrapper">
			<form class="form-wrapper">
				<ul class="steps">
					<li class="is-active">Step 2</li>
					<li class="listword">결제하기</li>
				</ul>
			</form>
		</div>
		<div id="main_container">
			<div id="sub_content">
			<div class="t_center" style="margin:10px;font-size:28px;font-weight:bold;color:#a70737;">주차 예약이 완료되었습니다.</div>
			<h3 class="stitle01">예약 요약<span>예약하신 내용은 문자와 메일로도 확인하실 수 있습니다.</span></h3>
			<table class="table01">
					
					<colgroup>
						<col style="width:25%">
						<col style="width:20%">
						<col>
					</colgroup>
					<tbody>
					<tr>
						<th scope="row" rowspan="2">예약 일시 <br>(Dates and times)</th>
						<td class="t_center fc_gray02">차량 입차</td>
						<td class="fc_gray01"><div id="entvhclResveDt"><%= cal.get(Calendar.YEAR) %>-<%= cal.get(Calendar.MONTH)+1 %>-<%= cal.get(Calendar.DATE)+1 %>  
						   &nbsp;${start_time}</div></td>
					</tr>
					<tr>
						<td class="t_center fc_gray02">차량 출차</td>
						<td class="fc_gray01"><div id="lvvhclResveDt"><%= cal.get(Calendar.YEAR) %>-<%= cal.get(Calendar.MONTH)+1 %>-<%= cal.get(Calendar.DATE)+1 %>  
						   &nbsp;${end_time}</div></td>
					</tr>
					<tr>
						<th scope="row" rowspan="3">주차 <br>(Parking)</th>
						<td class="t_center fc_gray02">주차장</td>
						<td class="fc_gray01"><div id="airportLotArea"> ${park_name}</div></td>
					</tr>
					<tr>
						<td class="t_center fc_gray02">차량번호</td>
						<td class="fc_gray01"><div id="acPlate">${car_num}</div></td>
					</tr>
					<tr>
						<td class="t_center fc_gray02">예약 상태</td>
						<td class="fc_gray01"><div id="resveSttusName">예약완료</div></td>
					</tr>
					<tr>
						<th scope="row" rowspan="3">신청 정보 <br>(Information)</th>
						<td class="t_center fc_gray02">가격</td>
						<td class="fc_gray01"><div id="resveNo">${payprice}원</div></td>
					</tr>
					<tr>
						<td class="t_center fc_gray02">전화번호</td>
						<td class="fc_gray01"><div id="acCttpc">010-1234-1234</div></td>
					</tr>
					</tbody>
				</table>
			
				<input type="button" id ="payBtn" value="결제하기" onclick="pay();" />
				<input type="button" id ="payBtn1" onclick="location.href='${pageContext.request.contextPath}/project/main.do'" value="홈으로">
				
			</div>
		</div>
	</div>
</body>
</html>