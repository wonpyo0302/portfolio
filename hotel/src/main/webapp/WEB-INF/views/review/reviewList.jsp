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
		
		
		$(".score img").hover(function(){
			var idx = $(this).index(".score img"); //오버한 객체의 인덱스값
			for(var i=0; i<$(".score img").length;i++){
				if(i<=idx){
					$(".score img").attr("src","/hotel/image/mypage/star_icon.png")			
				}else{
					$(".score img")
				}
			}
			
			
			
			
			var idxStar = $(".starVal").val(idx+1);
			
		})
		
		
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
		$(".outer-div").show();
		$("#outer-div"+review_no).hide();
		$(".outer-div-modi").hide();
		$("#outer-div-modi"+review_no).show();
		
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