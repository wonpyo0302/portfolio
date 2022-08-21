<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/G_header.jsp" %>
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
			url : "../review/list.do",
			async:false,
			data : {
				guest_no : ${loginInfo.guest_no}
			},
			success : function(res){
				$("#reviewArea").html(res);
			}
		});
	}
		
	$(function() {
		getReview();
		
		
	})//$(function(){})-end

</script>
<body style="padding:50px;">
	<div style="text-align: center; padding:75px;">
		<h1>내가 쓴 리뷰s</h1>
	</div>
	<div id="reviewArea"></div>
	

</body>
</html>