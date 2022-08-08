<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/project/css/reset.css"/>
<link rel="stylesheet" href="/project/css/contents.css"/>
<link rel="stylesheet" href="/hotel/css/hotel.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js" /></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function getValue() {
		var result = $("#selectbox_state").val();
		
		console.log(result);
	}
	function getValue2() {
		var result = $("#selectbox_district").val();
		
		console.log(result);
	}
	function getValue3() {
		var result = $("#soltType").val();
		
		console.log(result);
	}
</script>
<body>
<div>
	<form class="search_box" action="/board/search.do">
		<input type="text" size="50%" height="40px" id="searchWord" name="searchWord" >호텔이름을 입력하세요<br>
		<input type="submit">
		<div class ="location_box">
			<div class ="location_box_select">
				<select name ="selectbox_state" id="selectbox_state" onchange="getValue()">
					<option value ="" selected>시/도</option>
					<option value ="11" >서울</option>
					<option value ="incheon" >인천</option>
					<option value ="kyeonggi" >경기</option>
					<option value ="kangwon" >강원</option>
					<option value ="chungcheong" >충청</option>
					<option value ="jeonra" >전라</option>
					<option value ="kyeongsang" >경상</option>
					<option value ="jeju" >제주</option>
				</select>
				
				<select name ="selectbox_district" id="selectbox_district" onchange="getValue2()" >
					<option value ="" selected>시/군/구</option>
					<option value ="11130" >서초구</option>
				</select>
				
				<select name ="soltType" id="soltType" onchange="getValue3()" >
					<option value ="" selected>---</option>
					<option value ="score" >평점순</option>
					<option value ="balance" >낮은 가격순</option>
					<option value ="review" >리뷰순</option>
					<option value ="like" >좋아요순</option>
				</select>
				
				</div>
	
			</div>
	</form><br>
	<section class="RecommendSwipe_container__2z8gh swiper-loaded">
	    <header class="SubHeader_container__mMQq5">
	        <div class="SubHeader_titleWrap__3g5at">
	            <h4 class="SubHeader_title__seoul">서울상품</h4>
	        </div>
	    </header>
	        <div class="list_container_seoul">
	            <div class="list_seoul">
	            <c:forEach var="SH" items="${ Seoul }">
	            <a href="">
	            	<div class="SeoulHotel" style= "background-image: url("/hotel/img/admin/counsel_regist_off.png")"></div>
	            </div>
	            <div class="RecommendSwipeItem_body__3s4QZ">
	                <p class="Seoul_name">${SH.hotel_name}</p>
	                   <span class="seoulA_sal">최저가:  ${SH.lowPrice } ~</span>
	            </div>
	            </a>
	            </c:forEach>
	            <p>---------------------------------------------------</p>
	         </div>
	    <header class="SubHeader_container__mMQq5">
	        <div class="SubHeader_titleWrap__3g5at">
	            <h4 class="SubHeader_title__seoul">인천상품</h4>
	        </div>
	    </header>
	         <div class="list_container_incheon">   
	            <div class="list_Incheon">
	            <c:forEach var="IC" items="${Incheon}">
	            <a href="">
	            	<div class="IncheonHotel" style= "background-image: url("D:\kdigital\java\workspace\hotel\src\main\webapp\img\admin\counsel_regist_off.png")"></div>
	            </div>
	            <div class="RecommendSwipeItem_body__3s4QZ">
	                <p class="Incheon_name">${IC.hotel_name}</p>
	                   <span class="Incheon_sal">최저가:  ${IC.lowPrice } ~</span>
	            </div>
	            </a>
	            </c:forEach>
	            <p>---------------------------------------------------</p>
	          </div>
	    <header class="SubHeader_container__mMQq5">
	        <div class="SubHeader_titleWrap__3g5at">
	            <h4 class="SubHeader_title__seoul">경기상품</h4>
	        </div>
	    </header>	          
	          <div class="list_container_kyeonggi"> 
	            <div class="list_Kyeonggi">
	            <c:forEach var="KY" items="${Kyeonggi}">
	            <a href="">
	            	<div class="KyeonggiHotel" style= "background-image: url("D:\kdigital\java\workspace\hotel\src\main\webapp\img\admin\counsel_regist_off.png")"></div>
	            </div>
	            <div class="RecommendSwipeItem_body__3s4QZ">
	                <p class="Kyeonggi_name">${KY.hotel_name }</p>
	                   <span class="Kyeonggi_sal">최저가:  ${KY.lowPrice } ~</span>
	            </div>
	            </a>
	            </c:forEach>
	        </div>
	</section>
</div>
</body>
</html>