<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <head>
    <meta charset="utf-8" />
    <title>Swiper demo</title>
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    />
      <!-- Link Swiper's CSS  -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"
    />
    <!-- Demo styles -->
    <style>
<
style>html, body {
	align-content: center;
	position: relative;
	height: auto;
	width: auto;
}

body {
	background: #eee;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding-top: 60px;
}

.swiper {
	width: 50%;
	height: 30%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide img {
	display: block;
	width: 50%;
	height: 50%;
	object-fit: cover;
}

.search_box {
	text-align: center;
}

#searchWord {
	color: inherit;
	text-decoration: none;
	font-size: 1.4rem;
	font-weight: 400;
	height: 3.6rem;
	padding-left: 1.6rem;
	margin-left: auto;
	border-radius: 0.4rem;
	border: 1px solid #e6e6e6;
	background-color: #f8f8f8;
	color: #919191;
	line-height: 3.6rem;
}

.hotel01 {
	background-size: 150px;
	height: 150px;
}
</style>

  </head>

  <body>
  <%@ include file="/WEB-INF/views/includes/G_header.jsp"  %>
  <div class="search_box">
	<form class="search_box_form" action="/hotel/main/search.do" method="get">
		<input type="text" size="50%" height="40px" id="searchWord" name="searchWord" value="" placeholder="호텔이름을 입력하세요" ><br>
		
		<div class ="location_box">
			<div class ="location_box_select">
				<span style="align-items: flex-end;">지역 카테고리를 선택하세요.</span>
				<select name ="selectbox_state" id="selectbox_state" onchange="optionChange()">
					<option value ="" selected>시/도</option>
					<c:forEach var ="state" items="${list}">
					<option value ="${state.state_code}" >${state.state_name}</option>
					</c:forEach>
				</select>
				
				<select name ="selectbox_district" id="selectbox_district" >
					<option value ="2" selected>시/군/구</option>
				</select>
				
				<input type="submit" value="검색">
				</div>
			</div>
	</form><br>
	</div>

    <!-- Swiper seoul -->
	<h2 align="center">서울상품</h2>
	<div class="swiper mySwiper_s">
		<div class="swiper-wrapper">
			<c:forEach var="SH" items="${data.listSeoul }">
			<div class="swiper-slide">
				<a href="">
						<div class="hotel01" style="background-image: url(/hotel/image/hotel/${SH.filename}.jpg);">
						</div>
					<div><p>${SH.hotel_name}</p></div>
					<span>최저가:  ${SH.lowPrice } ~</span>
				</a>
			</div>
			</c:forEach>
		</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>
	
	<h2 align="center">인천상품</h2>
    <!-- Swiper incheon -->
	<div class="swiper mySwiper_i ">
		<div class="swiper-wrapper">
			<c:forEach var="IH" items="${data.listIncheon }">
			<div class="swiper-slide">
				<a href="">
						<div class="hotel01" style="background-image: url(/hotel/image/hotel/${IH.filename}.jpg);">
						</div>
					<div><p>${IH.hotel_name}</p></div>
					<span>최저가:  ${IH.lowPrice } ~</span>
				</a>
			</div>
			</c:forEach>
		</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>
	
	<h2 align="center">경기상품</h2>
    <!-- Swiper kyeonggi -->
	<div class="swiper mySwiper_k">
		<div class="swiper-wrapper">
			<c:forEach var="KH" items="${data.listKyeonggi }">
			<div class="swiper-slide">
				<a href="">
						<div class="hotel01" style="background-image: url(/hotel/image/hotel/${KH.filename}.jpg);">
						</div>
					<div><p>${KH.hotel_name}</p></div>
					<span>최저가:  ${KH.lowPrice } ~</span>
				</a>
			</div>
			</c:forEach>
		</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>
	<!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- 동적셀렉트 -->
	<script>
	function optionChange() {
		$.ajax({
			url : "district.do",
			type : "POST",
			data : {
					state_code : $("#selectbox_state").val()
				},
			success : function(result) {
				var str = "<option value =" + 2 + " selected>시/군/구</option>";
				if($("#selectbox_state").val() != ""){
					$.each(result, function(i){
	                   str += "<option value = ";
	                   str +=  + result[i].district_code +""; 
	                   str +=  ">" +result[i].district_name+"</option>"
	                });
				} else {
						str = "<option value =" + 2 + " selected>시/군/구</option>";
					}
					$("#selectbox_district").empty($("#selectbox_district").val());
                    $("#selectbox_district").append(str);
				}
		})
	}
	</script>
	
    <!-- Initialize Swiper -->
   <script>
   document.addEventListener("DOMContentLoaded", function(){
	   
      var swiper = new Swiper(".swiper", {
    	  sildesPerView: 3,
    	  slidesPerGroup: 3,
    	  spaceBetween: 24,
          navigation: {
	          nextEl: ".swiper-button-next",
	          prevEl: ".swiper-button-prev",
        },
        breakpoints: {
        	1280: {
        		slidesPerView: 3,
        		slidesPerGroup: 3,
        	},
        }
      });
   });
    </script>
  </body>
</html>
