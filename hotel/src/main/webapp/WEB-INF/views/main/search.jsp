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

<script type="text/javascript">
$(function() {
	
})
</script>

  </head>

  <body>
  <%@ include file="/WEB-INF/views/includes/G_header.jsp"  %>
  <div class="search_box">
	<form class="search_box_form" action="/hotel/search.do">
		<input type="text" size="50%" height="40px" id="searchWord" name="searchWord" value="" placeholder="호텔이름을 입력하세요" ><br>
		
		<div class ="location_box">
			<div class ="location_box_select">
				<select name ="state_code" id="selectbox_state" onchange="optionChange()">
					<c:forEach var ="state" items="${state}">
					<option value ="${state.state_code}" <c:if test="${state.state_code == param.selectbox_state}">selected</c:if>>${state.state_name}</option>
					</c:forEach>
				</select>
				
				<select name ="district_code" id="selectbox_district" >
					<c:forEach var="district" items="${district}" >
					<option value ="${district.district_code }"<c:if test="${district.district_code == param.selectbox_district}">selected</c:if>>${district.district_name }</option>
					</c:forEach> 
				</select>
				
				<input type="submit" value="검색">
				</div>
	
			</div>
	</form><br>
	</div>
	<select name="soltType" id="soltType" onchange="soltList()">
		<option value="3" selected>---</option>
		<option value="score">평점순</option>
		<option value="balance">낮은 가격순</option>
		<option value="review">리뷰순</option>
		<option value="like">좋아요순</option>
	</select>
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
</body>