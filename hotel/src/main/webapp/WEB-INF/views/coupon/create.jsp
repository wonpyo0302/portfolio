<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.list{
		display: inline-block;
  		overflow: auto;
  		height:200px;
  		border-spacing: 0;
	}
	th {
		position: sticky;
		background-color : gray;
    	top: 0px;
	}
	.list2{
		display: inline-block;
  		overflow: auto;
  		height:200px;
  		border-spacing: 0;
	}
	.div1{
		clear:both;
		width:250px; 
		height:150px;
		float:left;
	}
	.div2{
		width:50px; 
		height:150px;
		float:left;
	}
</style>
<script>
$(function() {
	search();
})

function search(){
	var data=$('#idsearch').val();
	$.ajax({
		url : "idList.do?idsearch="+data,
		cache:false,
		success: function(res){
			$("#test").empty();
			$("#test").append(res);
			
		}
	});
}

function submit2(){
	console.log(".coupon_price").val();
	return false;
}
</script>
<body>
<h1>쿠폰생성</h1>

<form id="frm" method="post" action="create.do" onsubmit="return submit2();" >
	<table border="1" class="list" style="float:left">
		<tr>
			<th>ID</th>
		</tr>
		<tr id="test">
				
		</tr>
	</table>
	<table border="1" class="list2" style="float:left">
			<tr>
				<th>쿠폰 종류</th>
				<th>쿠폰 수량</th>
			</tr>
			<tr >
				<tr>
					<td height="52px"><input type="checkbox" class="coupon_price" name="coupon_price" value="1000">1000원</td>
					<td><input type="number" name="amount" >개</td>
				</tr>
				<tr>
					<td height="52px"><input type="checkbox" class="coupon_price" name="coupon_price" value="5000">5000원</td>
					<td><input type="number" name="amount" >개</td>
				</tr>
				<tr>
					<td height="52px"><input type="checkbox" class="coupon_price" name="coupon_price" value="10000">10000원</td>
					<td><input type="number" name="amount" >개</td>
				</tr>
			</tr>
	</table>
	<div class="div1">
		 <input type="text" id="idsearch" name="idsearch" value="${param.idsearch}"><input type="button" value="검색" onclick="search();">
	</div>
	<div class="div2" align="right">
		<input type="submit" id="sumbit" value="쿠폰생성"	>
	</div>
</form>
</body>
</html>