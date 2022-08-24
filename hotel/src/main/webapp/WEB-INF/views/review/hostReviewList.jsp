<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/H_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 리뷰 목록</title>
</head>
<link rel="stylesheet" href="/hotel/css/reset.css"/>
<link rel="stylesheet" href="/hotel/css/contents.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
	
	function getReview(){
		$.ajax({
			type:"GET",
			url : "../host_review/list.do",
			async:false,
			data : {
				hotel_no : ${loginInfo2.hotel_no}
			},
			error:function(er){
				alert("에러");
			},
			success : function(res){
				
				$("#reviewArea").html(res);
			}
		});
	}
		
	$(function() {
		getReview();
		
		})
		
	
	

</script>
<body style="padding:50px;">
	<div class="container"style="text-align: center; padding:75px;">
		<h1>우리 호텔 리뷰s</h1>
	</div>	
		<div >
			<div id="reviewArea"></div>
		</div>

	
	

</body>
</html>