<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <head>
    <meta charset="utf-8" />
    <title>Hotel Detail</title>
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"
    />
    <link href="/hotel/css/swiperHotel.css" rel="stylesheet" type="text/css">
    <style type="text/css">
    .detail_full_screen{
    	margin-top: 20px;
    }
    .detail_full_screen img{
    	margin: 20px 0px 20px 100px;
    	width: 400px;
    	height: 300px;
    }
    .middleBox {
    	border: 1px solid black;
    	margin: 0 100px 0 100px;
    }
    .hotelName {
    	width : 400px;
    	border : 1px solid black;
    	font-size: 20px;
    	font-weight: bold;
    	padding-left: 150px;
    	margin-left: 100px;
    }
    .room_Screen img {
    	width: 200px;
    	height: 200px;
    }
    #roomInfo {
    	float: right;
    }
    
    </style>
  </head>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <%@ include file="/WEB-INF/views/includes/G_header.jsp"  %>
  <body>

	<div class ="detail_full_screen">
		<div class="hotel_screen">
	  		<div class="hotelName">${hotel.hotel_name}</div>
	  			<img alt="사진없음" src="/hotel/image/hotel/${filename}">
	  		<div class="middleBox" style="width: 80%; text-align: center;">
	  			<span>객실 안내/예약</span>
	  		</div>
  		</div>
  		
  		<!-- 객실리스트 1번 room -->
  		<div class="room_Screen">
  			<c:forEach var="roomList" items="">
			<div class="roomOne">
				<c:forEach var="roomImage" items="">
				<div id ="imgBox">
				
				</div>
				</c:forEach>
				<div id="infoBox">
				
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
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