<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${loginInfo2.host_no }
	<a href="/hotel/hostReserve/index.do?host_no=${loginInfo2.host_no }"><input type="button"value="클릭"></a>
</body>
</html>