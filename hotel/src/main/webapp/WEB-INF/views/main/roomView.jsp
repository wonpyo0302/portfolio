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
    <link href="/hotel/css/roomView.css" rel="stylesheet" type="text/css">

  </head>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

  <%@ include file="/WEB-INF/views/includes/G_header.jsp"  %>
  <body>

	<div class ="detail_full_screen">
		<div id="room_screen" style="vertical-align: middle;">
	  		<div class="roomName">${roomInfo.room_name}</div>
		  	<div class="swiper mySwiper" id="Low" style="display: inline-block; height: 350px">
		  		<div class="swiper-wrapper" >
				  	<c:forEach var="roomImage" items="${roomImage}">
				  		<div class="swiper-slide" id="imgBox"><img alt="사진없음" src="/hotel/image/hotel/${roomImage.filename_org}"></div>
				  	</c:forEach>
		  		</div>
		  		<div class="swiper-button-next"></div>
			    <div class="swiper-button-prev"></div>
			    <div class="swiper-pagination"></div>
	  		</div>
	  	<div class="middleBox" style="text-align: center;">
	  		<span>객실 안내/예약</span>
	  	</div>
		</div>
  	</div>
  	<div class="roomInfoDiv">
	  	<div class="contentBox" >
	  		<pre>${roomInfo.room_content}</pre>
	  	</div>
	  	<div class="serviceBox" style="display: inline-block;">
	  		<div id="roomInfoBox price">
	  			가격 : ${roomInfo.room_price }
	  		</div>
	  		<div id="roomInfoBox review">
	  			가격 : ${roomInfo.room_price }
	  		</div>
	  	</div>
  	</div>
  	
  	
  	
  	
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        cssMode: true,
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        pagination: {
          loop: true,
          el: ".swiper-pagination",
        },
        mousewheel: true,
        keyboard: true,
      });
    </script>

  </body>