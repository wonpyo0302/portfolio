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
        <style>
      html,
      body {
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

      
      .hotel01 {
        background-size: cover;
        height: 150px;
       }
    </style>

  </head>

  <body>
  <%@ include file="/WEB-INF/views/includes/G_header.jsp"  %>
  <div>
	<form class="search_box" action="/hotel/search.do">
		<input type="text" size="50%" height="40px" id="searchWord" name="searchWord" >호텔이름을 입력하세요<br>
		<input type="submit" value="검색">
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
	</div>

    <!-- Swiper seoul -->
	<h2 align="center">서울상품</h2>
	<div class="swiper mySwiper_s">
		<div class="swiper-wrapper">
			<c:forEach var="SH" items="${data.listSeoul }">
			<div class="swiper-slide">
				<a href="">
					<c:forEach var="SI" items="${image.imageSeoul }">
						<div class="hotel01" style="background-image: url(https://yaimg.yanolja.com/v5/2022/08/04/10/640/${SI.filename});">
						</div>
					</c:forEach>
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
					<c:forEach var="II" items="${image.imageIncheon }">
						<div class="hotel01" style="background-image: url(https://yaimg.yanolja.com/v5/2022/08/04/10/640/${II.filename});">
						</div>
					</c:forEach>
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
					<c:forEach var="KI" items="${image.imageKyeonggi }">	
						<div class="hotel01" style="background-image: url(https://yaimg.yanolja.com/v5/2022/08/04/10/640/${KI.filename});">
						</div>
					</c:forEach>
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

    <!-- Initialize Swiper -->
   <script>
   document.addEventListener("DOMContentLoaded", function(){
	   
      var swiper = new Swiper(".mySwiper_s", {
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
      var swiper = new Swiper(".mySwiper_i", {
    	  siledsPerView: 3,
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
        	720: {
        		slidesPerView: 1,
        		slidesPerGroup: 1,
        	}
        }
      });
      var swiper = new Swiper(".mySwiper_k", {
    	  siledsPerView: 3,
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
        	720: {
        		slidesPerView: 1,
        		slidesPerGroup: 1,
        	}
        }
      });
   });
    </script>
  </body>
</html>
