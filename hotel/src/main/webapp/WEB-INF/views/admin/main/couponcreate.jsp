<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/views/admin/include/headHtml.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<style>
	.list{
		display: inline-block;
  		overflow: auto;
  		height:210px;
  		border-spacing: 0;
  		border: 1px solid black;
  		margin-right: 10px;
	}
	th {
		position: sticky;
		background-color : gray;
    	top: 0px;
	}
	.list2{
		display: inline-block;
  		overflow: auto;
  		height:210px;
  		border-spacing: 0;
  		border: 1px solid black;
	}
	.div1{
		clear:both;
		width:620px; 
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
	var data=$('#sword').val();
	$.ajax({
		url : "/hotel/coupon/idList.do?sword="+data,
		cache:false,
		success: function(res){
			$("#test").empty();
			$("#test").append(res);
			
		}
	});
}
</script>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>
		<div id="container" style="text-align: center;">
			<div id="content">
				<div class="con_tit" style="padding: 0 0 4% 1%">
					<h2>쿠폰발급 - [생성 및 발급]</h2>
				</div>
				
				<div style="padding: 0 0 0 20%">
				<form id="frm" method="post" action="/hotel/coupon/create.do" >
					<table border="1" class="list" style="float:left;">
						<tr>
							<th style="width: 450px;height: 30px">ID</th>
						</tr>
						<tr id="test" style="text-align: center;">
								
						</tr>
					</table>
					<table border="1" class="list2" style="float:left; width: 450px">
						<tr>
							<th style="width: 225px; height: 30px">쿠폰 종류</th>
							<th style="width: 225px; height: 30px">쿠폰 수량</th>
						</tr>
						<tr height="59px">
							<td ><input type="checkbox" name="coupon_price" value="1000">1000원</td>
							<td><input type="number" name="amount" >개</td>
						</tr>
						<tr height="59px">	
								<td ><input type="checkbox" name="coupon_price" value="5000">5000원</td>
								<td><input type="number" name="amount" >개</td>
							</tr>
						<tr height="59px">
							<td><input type="checkbox" name="coupon_price" value="10000">10000원</td>
							<td><input type="number" name="amount" >개</td>
						</tr>
					</table>
					<div class="div1">
						 <input type="text" style="width: 370px" id="sword" name="sword" value="${param.sword}"><input type="button"  style="width: 100px" value="검색" onclick="search();">
					</div>
					<div class="div2" align="right">
						<input type="submit" style="width: 150px; height:30px " id="sumbit" value="쿠폰생성"	>
					</div>
				</form>
					</div>
				
			</div>
		</div>
	</div>
</div>
</body>
</html>