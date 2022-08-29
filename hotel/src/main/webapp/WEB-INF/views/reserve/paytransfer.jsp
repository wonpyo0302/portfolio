<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/G_header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table{
	border: 1px solid black;
	margin : 200px auto ;
	width: 700px;
	height: 200px
}

th, td{
	text-align: center;
	width : 200px;
	border: 1px solid black;
}

</style>

<body>
<table border="1">
	<tr>
		<th class="totalproce">결제금액</th>
		<td><fmt:formatNumber value="${reserveinfo.total_price}" pattern="##,###"/> </td>
	</tr>
	<tr>
		<th class="name">계좌주</th>
		<td> ${hostinfo.host_name}</td>
	</tr>
	<tr>
		<th class="banktype">입금은행</th>
		<td> ${hostinfo.host_bank}</td>
	</tr>
	<tr>
		<th class="account">입금계좌</th>
		<td>${hostinfo.host_accountno}</td>
	</tr>
</table>

</body>
</html>