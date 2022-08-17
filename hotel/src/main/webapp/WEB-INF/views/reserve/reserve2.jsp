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
.hr1{
	width:300px;
	margin:30px 0 0 400px;
	border-width: 1px;
}

.hr2{
	width:300px;
}
.insertdiv{
	display:inline-block;
	width : 130px;
}
.insertdiv2{
	display:inline-block;
	width : 30px;
}
.div1{
	width: 300px;
}

.leftdiv{
	
	width: 800px;
	float: left;
}
.rightdiv{
	display: inline-block;
	margin:200px 0 0 200px;
	
	float: left;
}

</style>
<script>
function totalpricepoint(){
	$("#totalprice").val(total-$("#point").val());
}

function totalpricecoupon(){
	$("#totalprice").val(${loginInfo.totalpoint}-$("#coupon_price").val());
	if($("#totalprice").val()<0){
		$("#totalprice").val(0)
	}
}

function showPopup(data) { 
	window.open("/hotel/reserve/couponlist.do?guest_no="+data, "coupon_list", "width=500, height=500, left=200, top=200"); 
}

function resetcoupon(){
	$("#coupon_price").val("");
}

</script>
<head>
<meta charset="UTF-8">
<title>예약 확인</title>
</head>
<body>

<div class="leftdiv">
	<div style="margin:200px 0 0 400px"> 
		<h4>예약자 정보</h4>
	</div>
	
	<div style="margin:30px 0 0 400px">
		예약자 이름 <br>
		<input type="text" name="rev_name" style="width:300px;" id="rev_name" placeholder="체크인시 필요한 정보입니다.">
	</div>
	
	<div style="margin:30px 0 0 400px">
		예약자 전화번호 <br>
		<input type="text" name="rev_name" style="width:300px;" id="rev_name" placeholder="체크인시 필요한 정보입니다">
	</div>
	
	<hr class="hr1">
	
	<div style="margin:40px 0 0 400px"> 
		<h4>할인수단 선택</h4>
	</div>
	
	<div class="div1" style="margin:30px 0 0 400px" >
		<div>구매총액
			<div class="insertdiv">
		</div>
			<b>총금액적기</b><br>
			<button type="button" id="btn" onclick="showPopup(${loginInfo.guest_no});">보유 쿠폰 보기</button>
			<div class="insertdiv2"></div>
			<input type="text" name="coupon_price" style="width:130px;" id="coupon_price" onchange="totalpricecoupon()"  value="">
			<input type="button" id="reset" onclick="resetcoupon();" value="쿠폰취소">
			<input type="hidden" name="coupon_no" id="coupon_no" value=""><br><br>
			포인트 사용 ${loginInfo.totalpoint}P
			<input type="text" id="point" name="point" style="width: 153.55px" onchange="totalpricepoint()">
		</div>
	</div>
	
	<hr class="hr1">
	
	<div style="margin:40px 0 0 400px"> 
		<h4>결제 수단</h4>
		<select>
				<option value="1" selected="selected">카드</option>
				<option value="2">무통장입금</option>
		</select>
	</div>
</div>
<div class="rightdiv">
	숙소이름
	<h4>숙소이름 가져오기</h4><br>
	객실이름
	<h4>객실이름 가져오기</h4><br>
	체크인
	<h4>날짜 15:00</h4><br>
	체크아웃
	<h4>날짜 12:00</h4><br>
	
	<hr class="hr2">
	
	<b>총 결제 금액</b><br>
	총가격 &nbsp;<input type="text" id="totalprice" style="border:none" readonly="readonly" value="5000">
	<br>
	<input type="button" id="submit" value="예약" onclick="reserve();">
</div>
</body>
</html>