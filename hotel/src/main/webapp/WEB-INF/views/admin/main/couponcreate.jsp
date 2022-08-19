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
	var data=$('#sword').val();
	$.ajax({
		url : "idList.do?sword="+data,
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
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>쿠폰발급 - [생성 및 발급]</h2>
				</div>
				<form id="frm" method="post" action="create.do" >
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
							<td height="52px"><input type="checkbox" name="coupon_price" value="1000">1000원</td>
							<td><input type="number" name="amount" >개</td>
						</tr>
						<tr>	
								<td height="52px"><input type="checkbox" name="coupon_price" value="5000">5000원</td>
								<td><input type="number" name="amount" >개</td>
							</tr>
						<tr>
							<td height="52px"><input type="checkbox" name="coupon_price" value="10000">10000원</td>
							<td><input type="number" name="amount" >개</td>
						</tr>
					</table>
					<div class="div1">
						 <input type="text" id="sword" name="sword" value="${param.sword}"><input type="button" value="검색" onclick="search();">
					</div>
					<div class="div2" align="right">
						<input type="submit" id="sumbit" value="쿠폰생성"	>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>