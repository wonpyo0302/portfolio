<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
	div{
		clear:both;
		width:403.74px;
		height:200px;
	}
	
</style>
<body>
<h1>쿠폰생성</h1>

<form id="frm" method="post" action="create.do" >
	<table border="1" class="list" style="float:left">
		<tr>
			<th>ID</th>
		</tr>
		<tr>
			<c:forEach var="list" items="${data}">
				<tr>
					<td><input type="checkbox" name="guest_id" value="${list.guest_id}">${list.guest_id}</td>
				</tr>
			</c:forEach>
		</tr>
	</table>
	<table border="1" class="list2" style="float:left">
			<tr>
				<th>쿠폰 종류</th>
				<th>쿠폰 수량</th>
			</tr>
			<tr >
				<tr>
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
			</tr>
	</table>
	<div align="right">
		<input type="submit" id="sumbit" value="쿠폰생성"	>
	</div>
</form>
</body>
</html>