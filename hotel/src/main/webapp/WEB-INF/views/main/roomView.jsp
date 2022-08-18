<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  		<!-- 객실리스트 1번 room -->
  		<div class="room_Screen">
  			<div class="swiper mySwiper_r">
				<div class="swiper-wrapper">
		  			<c:forEach var="roomList" items="${roomOne}">
		  			<div class="swiper-slide" >
		  				<div id="roomImage">
		  					<img alt="객실사진" src="${roomList.filename_org}">
		  				</div>
		  			</div>
		  			</c:forEach>
  				</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			</div>
			<div id="roomInfo">
		  		<span>객실명: ${roomOneA.room_name }</span>
		  		<span>객실가격: ${roomOneA.room_price }</span>
		  		<span>객실설명: ${roomOneA.room_content }</span>
		  	</div>			
		</div>
		<!-- 객실리스트 2번 room -->
  		<div class="room_Screen">
  			<div class="swiper mySwiper_r">
				<div class="swiper-wrapper">
		  			<c:forEach var="roomList" items="${roomTwo}">
		  			<div class="swiper-slide" >
		  				<div id="roomImage">
		  					<img alt="객실사진" src="${roomList.filename_org}">
		  				</div>
		  			</div>
		  			</c:forEach>
  				</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			</div>
			<div id="roomInfo">
		  		<span>객실명: ${roomTwoA.room_name }</span>
		  		<span>객실가격: ${roomTwoA.room_price }</span>
		  		<span>객실설명: ${roomTwoA.room_content }</span>
		  	</div>
		</div>
		<!-- 객실리스트 3번 room -->		
  		<div class="room_Screen">
  			<div class="swiper mySwiper_r">
				<div class="swiper-wrapper">
		  			<c:forEach var="roomList" items="${roomThr}">
		  			<div class="swiper-slide" >
		  				<div id="roomImage">
		  					<img alt="객실사진" src="${roomList.filename_org}">
		  				</div>
		  			</div>
		  			</c:forEach>
		  			
  				</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			</div>
			<div id="roomInfo">
		  		<span>객실명: ${roomThrA.room_name }</span>
		  		<span>객실가격: ${roomThrA.room_price }</span>
		  		<span>객실설명: ${roomThrA.room_content }</span>
		  	</div>
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
</html>