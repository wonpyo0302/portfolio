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
	
	function del(review_no){
		$.ajax({
			type:"post",
			url:"../review/del.do",
			data:{review_no:review_no},
			error:function(er){
				alert("ERROR");
			},
			success:function(){
				alert(review_no+"가 삭제되었습니다");
				window.location.reload();
			}
		})
	}
	
	function modi(review_no){
		$("#"+review_no).hide();
		$("#modi"+review_no).show();
		
		temp_html="<div>수정 area </div>"
		
	$("#html"+review_no).html(temp_html);
	}

</script>
<body style="padding:50px;">
	<div class="container"style="text-align: center; padding:75px;">
		<h1>내가 쓴 리뷰s</h1>
	</div>	
		<div >
			<div id="reviewArea"></div>
		</div>

	
	

</body>
</html>