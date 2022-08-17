<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/G_header.jsp" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5d133f411d7216df47f409d9f8b79bd"></script>

<style>

</style>

<script>
$(function() {
    	 $( "#startdate" ).datepicker({
    		 dateFormat: 'yy-mm-dd' //Input Display Format 변경
                 ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                 ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                 ,changeYear: true //콤보박스에서 년 선택 가능
                 ,changeMonth: true //콤보박스에서 월 선택 가능                
                 ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                 ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                 ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                 ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                 ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                 ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                 ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                 ,minDate: 0 //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                 ,maxDate: "+30Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
    	 });
    	
    	 $('#startdate').datepicker('setDate', 'today');
    	 
    	 $( "#enddate" ).datepicker({
    		 dateFormat: 'yy-mm-dd' //Input Display Format 변경
                 ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                 ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                 ,changeYear: true //콤보박스에서 년 선택 가능
                 ,changeMonth: true //콤보박스에서 월 선택 가능                
                 ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                 ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                 ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                 ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                 ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                 ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                 ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                 ,minDate: "+1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                 ,maxDate: "+30Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
    	 });
    	 
    	 $('#enddate').datepicker('setDate', 'today+1');
    	 $('#enddate').val().replace("-","");
    	 //console.log(typeof((Number)($('#enddate').val().replace(/-/g,""))));
    	  var startdate=(Number)($('#startdate').val().replace(/-/g,""))
    	 var enddate=(Number)($('#enddate').val().replace(/-/g,""))
    	 console.log(startdate < enddate);
    	 reservecheck();
});

//페이지 이동시 중복체크
 function reservecheck(){
	 $.ajax({
		url : "reservecheck.do",
		type : "post",
		data : {
			room_no : 1, //${param.room_no}
			hotel_no : 2, //${param.hotel_no}
			startdate : $('#startdate').val(),
			enddate : $('#enddate').val()
		}
	 }).done(function (res){
		 console.log (res);
		 var startdate=(Number)($('#startdate').val().replace(/-/g,""))
    	 var enddate=(Number)($('#enddate').val().replace(/-/g,""))
    	 console.log(startdate < enddate);
		 if(res !=0){
			 $("#submit").val("예약 불가");
	    	 $("#submit").attr("disabled", true);
		 }
		 else{
			 if(startdate <= enddate){
			 	$("#submit").val("예약");
			 	$("#submit").attr("disabled", false);
			 }
			 else{
				 $('#enddate').val("");
				 $("#submit").val("예약 불가");
		    	 $("#submit").attr("disabled", true);
			 }
		 }
	})
}



$(function(){
	$("#point").on("focusout", function(res){
    	if(${loginInfo.totalpoint} < $("#point").val()){
    		alert("포인트가 부족합니다. 다시입력하세요");
			$("#point").val('');
    	}
    	if(($("#total_price").val() - $("#point").val()- $("#coupon_price").val()) < 100){
    		alert("최소 결제금액은 100원입니다.");
    		$("#point").val('');
    	}
	});
});
	
    function reserve(){
    	var con = true;
    	console.log(typeof(Date($("#startdate"))));
    	var IMP = window.IMP;      
    	IMP.init('imp74083745');                 
    	IMP.request_pay({            
    		pg: 'html5_inicis',
    		pay_method: 'card',//select 박스에서 선택한것
    		merchant_uid: 'merchant_' + new Date().getTime(),
    		name: '주문명:결제테스트',//상품페이지에서 있는 객실이름
    		amount: $("#total_price").val()-$("#point").val()-$("#coupon_price").val(), //상품페이지에서 있는 금액
    		buyer_email: "${loginInfo.guest_email}",//로그인 세션에 저장되어있는 이메일
    		buyer_name: "${loginInfo.guest_name}",//로그인 세션에 저장되어있는 이름
    		buyer_tel: "${loginInfo.guest_hp}",//로그인 세션에 저장되어있는 전화번호
    		buyer_addr: "${loginInfo.guest_addr1}",//로그인 세션에 저장되어있는 주소
    		buyer_postcode: '123-456',////로그인 세션에 저장되어있는 우편번호(생략할 생각)
    		},function (rsp) { 
    			console.log(rsp)
    					   if (rsp.success) {
    					    $.ajax({
    					           url: "reserveinsert.do",
    					           type : "POST",
    					           async : false,
    					           data : 
    					           {imp_uid: rsp.imp_uid,
    					        	total_price : String($("#total_price").val() - $("#point").val()-$("#coupon_price").val()),
    					        	startdate : $("#startdate").val(),
    					        	enddate : $("#enddate").val(),
    					        	room_no : 142,
    					        	hotel_no : 3,
    					        	guest_no : ${loginInfo.guest_no},
    					        	guest_hp : "${loginInfo.guest_hp}",
    					        	rev_name : $("#rev_name").val(),
    					        	rev_hp : $("#rev_hp").val(),
    					        	used_point : $("#point").val(),
    					        	coupon_no : $("#coupon_no").val(),
    					        	totalpoint : ${loginInfo.totalpoint}-$("#point").val()
    					           }
    					       }).done(function (data) {
    					          alert("결제 완료");
    					       })
    					     } else {
    					       alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
    					      con =false;
    					     }
    		});
    	 }  
function showPopup(data) { 
	window.open("couponlist.do?guest_no="+data, "coupon_list", "width=500, height=500, left=200, top=200"); 
}

function resetcoupon(){
	$("#coupon_price").val("");
}
    
</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id=hotelname>
	호텔이름이 들어가는곳
</div>
<div id="imgspace">
	사진이 들어가는곳 [리스트로 받아서 사진 오른쪽 왼쪽 슥슥슥]		
</div>
<form id ="frm" action="reserve.do" method="POST" >
<table border="1">
	<tr>
		<th>시작날짜</th>
		<td><input type="text" name="startdate" id="startdate" style="float:left;" onchange="reservecheck()" autocomplete="off"></td>
	</tr>
	<tr>
		<th>끝날짜</th>  
		<td><input type="text" name="enddate" id="enddate" style="float:left;" onchange="reservecheck()" autocomplete="off"></td>
	</tr>
	<tr>
		<th>가격</th>  
		<td><input type="text" name="total_price" id="total_price" value="600" readonly="readonly"></td>
	</tr>
	<tr>
		<th>예약자 이름</th>
		<td><input type="text" name="rev_name" id="rev_name"></td>
	</tr>
	<tr>
		<th>예약자 전화번호</th>
		<td><input type="text" name="rev_hp" id="rev_hp"></td>
	</tr>
	<tr>
		<th>포인트 사용 ${loginInfo.totalpoint}P</th>
		<td>사용할 포인트 : <input type="text" id="point" name="point"></td>
	</tr>
	<tr>
		<th><button type="button" id="btn" onclick="showPopup(${loginInfo.guest_no});">보유 쿠폰 보기</button> </th>
		<td> 
			적용된쿠폰 : <input type="text" name="coupon_price" id="coupon_price" readonly="readonly" value="">
			<input type="button" id="reset" onclick="resetcoupon();" value="쿠폰취소">
			<input type="hidden" name="coupon_no" id="coupon_no" value="">
			
		</td>
	</tr>
	<tr>
		<th colspan="2"><input type="button" id="submit" value="예약" onclick="reserve();"></th>
	</tr>
</table>
</form>

<div id="map" style="width:500px;height:400px;"></div>
<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.5125720000, 127.1026060000),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		var markerPosition  = new kakao.maps.LatLng(37.5125720000, 127.1026060000); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>	

</body>
</html>