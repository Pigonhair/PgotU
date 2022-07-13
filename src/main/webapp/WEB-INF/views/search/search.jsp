<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String btnAddress = request.getParameter("btnAddress");
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="../main/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link rel="stylesheet" href="${path}/resources/css/Search.css" />
<link rel="stylesheet" href="${path}/resources/css/Search2.css" />
<link rel="stylesheet" href="${path}/resources/css/parkingList.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ea3e2f82fb9c5912cadde111de5341d3&libraries=services,clusterer,drawing"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<meta charset="utf-8" />

<style>
</style>
<title>Kakao 지도 시작하기</title>
</head>
<body>

	<div id="wrap">
		<div class="wrapper">
			<form class="form-wrapper">
				<ul class="steps">
					<li class="is-active">Step 1</li>
					<li class="listword"><h1>주차장예약</h1></li>
				</ul>
			</form>
		</div>
		<div id="main_container">
			<form class="form-wrapper" id="form_id" name="form_id"
				action="${pageContext.request.contextPath}/project/reserveInsert.do"
				method="post">
				<div id="sub_content">
					<h2
						style="color: #000000; font-family: 'jua'; font-size: 30px; margin-bottom: 50px"
						id="destination">
						목적지 :
						<%=btnAddress%></h2>
					<div id="map_content">
						<div id="map"
							style="width: 1000px; height: 500px; position: relative; overflow: hidden;"></div>
						<!-- 지도타입 컨트롤 div 입니다 -->
						<div class="custom_typecontrol radius_border">
							<span id="btnRoadmap" class="selected_btn"
								onclick="setMapType('roadmap')">지도</span> <span id="btnSkyview"
								class="btn" onclick="setMapType('skyview')">스카이뷰</span>
						</div>
						<!-- 지도 확대, 축소 컨트롤 div 입니다 -->
						<div class="custom_zoomcontrol radius_border">
							<span onclick="zoomIn()"><img
								src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png"
								alt="확대"></span> <span onclick="zoomOut()"><img
								src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png"
								alt="축소"></span>
						</div>
					</div>
					<div class="information_container">
						<div class="wrapper">
							<!--                      <form class="form-wrapper"> -->

							<fieldset class="section is-active">

								<h3
									style="color: #000000; font-family: 'jua'; font-size: 30px; margin-bottom: 50px">
									예약정보입력
									<p>
										(주차요금은 <span style="color: #a70737;">10분</span>당 <span
											style="color: #a70737;">1000원</span>입니다)
									</p>
								</h3>
								<div class="sel sel--black-panther">
									<select name="select-profession" id="select-profession">
										<option value="">주차장선택</option>
										<c:forEach var="parking" items="${list}">
											<option id="park_id" value="${parking.park_id}"
												value2="${parking.park_name}">${parking.park_id},
												${parking.park_name}, ${parking.park_type},
												${parking.detailAddr}, ${parking.park_public}</option>
											<br>
										</c:forEach>
									</select>
								</div>
								<br> <input type="hidden" name="parkReserve"
									id="parkReserve" value=""> <input type="hidden"
									id="parking_id_selected" name="parking_id_selected" value="">
								<input type="hidden" id="parking_name_selected"
									name="parking_name_selected" value="">
								<div class="frow">
									<label class="label"> <span class="star">*</span> 예약
										입차일시
									</label> <input type="text" id="start_time" name="start_time"
										class="timepicker" placeholder="입차시간을 선택하세요">
								</div>
								<div class="frow">
									<label class="label"> <span class="star">*</span> 예약
										출차일시
									</label> <input type="text" id="end_time" name="end_time"
										class="timepicker" placeholder="출차시간을 선택하세요">
								</div>
								<div class="frow">
									<label class="label"> <span class="star">*</span> 차 번호
									</label> <input type="text" id="car_num" name="car_num"
										placeholder="차 번호를 입력하세요">
								</div>
								<div class="frow">
									<label class="label"> <span class="star">*</span>예약가능여부
									</label> <input type="text" name="reserve" id="reserve"
										placeholder="예약 가능여부" style="display: inline" readonly>
									<input type="button" name="reserveOKBtn" id="reserveOKBtn"
										value="여부 클릭"> <input type="hidden" name="res_hid"
										id="res_hid" value="">
								</div>
							</fieldset>

							<!--                      </form> -->
						</div>
					</div>
					<h3 class="stitle01"
						style="margin-left: 100px; font-family: 'jua'; font-size: 25px;">주차예약
						이용안내</h3>
					<div class="scroll_box" style="margin-left: 100px">
						[예약 기본정보]<br> (예약 기간) 최소 2시간부터 최장 1개월까지 예약이 가능합니다.<br>
						(예약 대기) 예약신청 일자 중 예약이 불가한 일정이 있을 경우 예약대기가 가능하며, 예약 가능 시 자동 예약 후
						예약확정 안내가 휴대폰 문자 및 이메일로 통보됩니다.<br> (예약 안내) 예약 시 예약일정 및 예약정보를
						포함한 안내사항은 휴대폰 문자 및 이메일로 통보됩니다.<br> (예약 변경) 입차 후에도 예약출차시간 변경이
						가능하며, 예약 변경은 최대 2회 가능합니다.<br> (예약 취소) 예약 입차시간 이후 2시간까지 예약 취소가
						가능하며, 이에 따른 페널티 부과는 없습니다.<br> (페널티) 최근 1년간 예약부도 2회 이상 시 예약
						출차일로부터 3개월간 주차 예약 서비스의 이용이 불가합니다.<br> (예약문의) 예약관련 문의는
						1661-2626 또는 051-974-3718로 가능합니다.<br> <br> [예약 입출차]<br>
						(입차 시간) 예약 입차 시간 2시간 전부터 입차 가능합니다.<br> (지연 입차) 예약 입차 시간 이후
						2시간까지 지연입차가 가능하며, 출차 시 실제 입차 시간을 기준으로 주차요금이 부과됩니다.<br> (예약부도)
						예약 입차 시간 이후 2시간 내 미입차시, 예약은 자동 취소되며 예약부도(No-Show) 처리됩니다.<br>
						<br> [예약주차장 이용]<br> (주차장 위치) 예약주차장은 P2 국제선 주차빌딩 3,4층입니다.<br>






						(주차요금) 주차요금은 예약 입출차시간이 아닌 실제 입출차 시간을 기준으로 부과됩니다.<br> (할인적용)
						저공해차량, 장애인, 국가유공상이자, 다자녀가정, 경차 할인은 출차(유인, 무인) 정산 시 적용(자세한 할인내용은
						주차장 운영관리 예규 참조)<br> (이용 불가 차량) 미니버스, 화물차 등 대형차량 및 2.3m 이상의
						차량은 입차가 불가능함에 따라 예약이 제한됩니다.<br> (입차방법) 예약 후 P2 국제선 주차빌딩 3층
						예약존(Zone)입구에서 차량번호 확인 후 입차<br> (출차방법) 예약존(Zone) 출구를 지나 무인정산기
						또는 출구 정산소를 이용하여 요금정산 후 출차
					</div>
					<div class="agree_chk"
						style="margin-left: 100px; margin-top: 15px;">
						<input type="checkbox" id="agree1" name="agree1" value="Y"
							aria-required="true"> <label for="agree1"
							style="font-family: 'jua'; font-size: 18px;">주차예약 이용안내 모든
							내용을 읽고 동의합니다.</label>
					</div>
					<div style="margin-bottom: 10px">
						<br>
					</div>
					<h3 class="stitle01"
						style="margin-left: 100px; font-family: 'jua';">
						개인정보처리방침
						<button id="btnPrivacy" class="btn" onclick="#">개인정보처리방침</button>
					</h3>
					<div class="agree_chk" style="margin-left: 100px">
						<input type="checkbox" id="agree2" name="agree2" value="Y"
							aria-required="true"> <label for="agree2"
							style="font-family: 'jua'; font-size: 18px;">개인정보처리방침 모든
							내용을 읽고 동의합니다.</label>
						<div class="btn_area">
							<input type="submit" id="btnNext" class="btn wine" value="예약하기" />
						</div>
					</div>
			</form>
		</div>
	</div>

	<script
		src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

	<script>
   
$(document).ready(function() {	
	
	$('.timepicker').timepicker({
	    timeFormat: 'HH:mm ',
	    interval: 10,
	    minTime: '0',
	    maxTime: '11:50pm',
	    defaultTime: '',
	    startTime: '00:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
	});
	
	$('#reserveOKBtn').click(function() {   
	      if ($('#parking_id_selected').val()!='' && $('#start_time').val()!='' && $('#end_time').val()!='') {
	          $.ajax({
	               url:'../confirmParkingList.do',
	               type:'post',
	               data:{parkID:$('#parking_id_selected').val(), startTime:$('#start_time').val(), endTime:$('#end_time').val()},
	               dataType:'json',
	               cache:false,
	               timeout:30000,
	               success:function(data){
	            	   $('#res_hid').val("버튼눌렀음");
	                  if(data.result == 'Available'){
	                     $('#reserve').css('color','blue').val('예약가능 여부 결과 | 예약가능');
	                  }else if(data.result == 'NotAvailable'){
	                     $('#reserve').css('color','red').val('예약가능 여부 결과 | 예약불가능, 다른 시간을 입력해주세요');
	                     $('#res_hid').val("예약불가능");
	                  }
	               },
	               error:function(){
	                  alert('네트워크 오류 발생');
	               }
	            });
	        } else {
	         alert('주차장, 입차시간, 출차시간을 선택해주세요.');
	      }
	   });
});
</script>

	<script>
$('#form_id').submit(function(){
    if($(agree1).is(":checked")==false){
       alert("이용 약관 이용에 대한 안내 동의해주세요 ") 
       return false;
    }   
    if($(agree2).is(":checked")==false){
       alert("개인정보처리방침 이용에 대한 안내 동의해주세요")
       return false;
    }
    var res =$('#res_hid').val();
    if(res ==''){
       alert("예약가능여부를 확인하세요")
       return false;
    }
    if(res =='예약불가능'){
    	Swal.fire({
    		icon: 'error',
    		title: '예약 불가능',
    		text: '다른 시간대를 선택해주세요'
    	})
    	return false;
    }
    
    else{
    }
      
});

</script>

	<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

//내 위치,이름 설정
var dest_name = '목적지';
var dest_position = '<%=btnAddress%>';
console.log('목적지 : ' + dest_position);

//주차장 map만들기
var parking_position_Map = new Map()
var parking_parkid_Map = new Map()

//DB에서 받아온 주차장 이름 및 위치 넣기
<c:forEach var="parking" items="${list}">
var parkinglot_name = '${parking.park_name}';
var parkinglot_addr = '${parking.detailAddr}';
var parkinglot_id = '${parking.park_id}';
//map에 주차장 key(이름),value(번호) 넣기
parking_parkid_Map.set(parkinglot_name,parkinglot_id)
//map에 주차장 key(이름),value(주소) 넣기
parking_position_Map.set(parkinglot_name, parkinglot_addr);
</c:forEach>

var dest_position_Map = new Map()
//목적지map에 key,value 넣기
dest_position_Map.set(dest_name, dest_position)

console.log(parking_position_Map)
console.log(dest_position_Map)

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
function setMapType(maptype) { 
    var roadmapControl = document.getElementById('btnRoadmap');
    var skyviewControl = document.getElementById('btnSkyview'); 
    if (maptype === 'roadmap') {
        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
        roadmapControl.className = 'selected_btn';
        skyviewControl.className = 'btn';
    } else {
        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
        skyviewControl.className = 'selected_btn';
        roadmapControl.className = 'btn';
    }
}

// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// ****************************지도위에 Toolbar****************************************
// 도형 스타일을 변수로 설정합니다
var strokeColor = '#39f',
   fillColor = '#cce6ff',
   fillOpacity = 0.5,
   hintStrokeStyle = 'dash';

var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
    map: map, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
    drawingMode: [
        kakao.maps.Drawing.OverlayType.MARKER
    ]
};

// 위에 작성한 옵션으로 Drawing Manager를 생성합니다
var manager = new kakao.maps.Drawing.DrawingManager(options);

// Toolbox를 생성합니다. 
// Toolbox 생성 시 위에서 생성한 DrawingManager 객체를 설정합니다.
// DrawingManager 객체를 꼭 설정해야만 그리기 모드와 매니저의 상태를 툴박스에 설정할 수 있습니다.
var toolbox = new kakao.maps.Drawing.Toolbox({drawingManager: manager});

// 지도 위에 Toolbox를 표시합니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOP은 위 가운데를 의미합니다.

map.addControl(toolbox.getElement(), kakao.maps.ControlPosition.TOP);
// ****************************지도위에 Toolbar****************************************


//지도위에 parking poisition marker만들기
for(let item of parking_position_Map){
   // 주소로 좌표를 검색합니다
   geocoder.addressSearch(item[1], function(result, status) {
       // 정상적으로 검색이 완료됐으면 
        if (status === kakao.maps.services.Status.OK) {

           var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

           // 결과값으로 받은 위치를 마커로 표시합니다
           var marker = new kakao.maps.Marker({
               map: map,
               position: coords
           });


           var infowindow = new kakao.maps.InfoWindow({
               content: '<div style="width:150px;text-align:center;padding:6px 0;">'+item[0]+'</div>'
           });
           // 인포윈도우로 장소에 대한 설명을 표시합니다
           infowindow.open(map, marker);
           
           // 마커에 click 이벤트를 등록합니다
           kakao.maps.event.addListener(marker, 'click', function() {
				Swal.fire('클릭하신 주차장은 "' + item[0] + '" 입니다' );
				var park_id =  parking_parkid_Map.get(item[0]);
				map.setCenter(coords);
				
				$.ajax({
		            url:'../searchParkingbyId.do',
		            type:'post',
		            data:{park_id : park_id},
		            dataType:'json',
		            cache:false,
		            timeout:30000,
		            success:function(obj){
		      txt =   obj.park_id + ",   " +
		    	      obj.park_name + ",   " +
        			  obj.park_type + ",   " +
        			  obj.detailAddr + ",   " +
        			  obj.park_public;
		              var $currentSel = $('.sel__box__options').closest('.sel');
		              $currentSel.children('.sel__placeholder').text(txt);	
// 	            	  $('#pakring_Selected').val(txt);
	            	  $("#pakring_Selected").attr("readonly",true);
	            	  $('#parking_id_selected').val(obj.park_id);
	            	  $('#parking_name_selected').val(obj.park_name);
// 	            	  alert(obj.park_id);

		            },
		            error:function(){
		               alert('네트워크 오류 발생');
		            }
		         });
           });
       } 
   });
}



//지도위에 목적지 marker만들고 거기로 이동하기
for(let item of dest_position_Map){
   // 주소로 좌표를 검색합니다
   geocoder.addressSearch(item[1], function(result, status) {
       // 정상적으로 검색이 완료됐으면 
        if (status === kakao.maps.services.Status.OK) {
     	
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

           // 결과값으로 받은 위치를 마커로 표시합니다
           var marker = new kakao.maps.Marker({
               map: map,
               position: coords
           });


           var infowindow = new kakao.maps.InfoWindow({
               content: '<div style="width:150px;text-align:center;padding:6px 0;">'+item[0]+'</div>'
           });
           

           // 인포윈도우로 장소에 대한 설명을 표시합니다
           infowindow.open(map, marker);

           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
           map.setCenter(coords);
           
           // 마커에 click 이벤트를 등록합니다
           kakao.maps.event.addListener(marker, 'click', function() {
				alert('고객님의 목적지는 "'+dest_position+'" 입니다' );
				map.setCenter(coords);
           });
       } 
   });
} 



/* ===== Logic for creating fake Select Boxes ===== */
$('.sel').each(function() {
  $(this).children('select').css('display', 'none');
  
  var $current = $(this);
  
  $(this).find('option').each(function(i) {
    if (i == 0) {
      $current.prepend($('<div>', {
        class: $current.attr('class').replace(/sel/g, 'sel__box')
      }));
      
      var placeholder = $(this).text();
      $current.prepend($('<span>', {
        class: $current.attr('class').replace(/sel/g, 'sel__placeholder'),
        text: placeholder,
        'data-placeholder': placeholder
      }));
      
      return;
    }
    
    $current.children('div').append($('<span>', {
      class: $current.attr('class').replace(/sel/g, 'sel__box__options'),
      text: $(this).text()
    }));
  });
});

// Toggling the `.active` state on the `.sel`.
$('.sel').click(function() {
  $(this).toggleClass('active');
});

// Toggling the `.selected` state on the options.
$('.sel__box__options').click(function() {
  var txt = $(this).text();
  var index = $(this).index();
  
  $(this).siblings('.sel__box__options').removeClass('selected');
  $(this).addClass('selected');
  
  var $currentSel = $(this).closest('.sel');
  var park_id = $currentSel.children('select').prop('selectedIndex', index + 1).val();
  $currentSel.children('.sel__placeholder').text(txt);
  $currentSel.children('select').prop('selectedIndex', index + 1);
  var s = document.getElementById("select-profession");
//   var selectParkID = s.options[s.selectedIndex].value;
//   var selectParkName = s.options[s.selectedIndex].value2;
  var selectParkID = $("#select-profession > option:selected").attr("value"); //지정 value2 값
  var selectParkName = $("#select-profession > option:selected").attr("value2"); //지정 value2 값
  $('#parking_id_selected').val(selectParkID); 
  $('#parking_name_selected').val(selectParkName);
});
</script>


</body>
</html>