<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>HOST SALES</title>
    <link rel="stylesheet" href="/hotel/css/host_sales.css"/>
    <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
   <script src="/hotel/script/sales.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/includes/H_header.jsp" %>

		<div class="sub">
			<div class="size">
				<h1 class="sub_title">매출현황</h1>
					
					<table>
					
						<tbody>
							<tr class="tr-head" >
								<th colspan="2">
								
								</th>
							</tr>
							
							<tr class="tr-head-test" >
								<th>
									<div onclick="">최근 일주일 매출현황</div>
									<div onclick="">button1</div>
									<div onclick="">button1</div>
									<div onclick="">button1</div>
								</th>
								<td>
									<div>
										<canvas id="bar-chart" width="800" height="450"></canvas>
										<c:forEach var="sale" items="${map.ary}" varStatus="idx">
											<input type="hidden" id="sale${idx.count}" value="${sale}">
										</c:forEach>
									</div>
								</td>
							</tr>
							
							
							<tr>
								<th>게시판</th>
								<th>게시판</th>
								
							</tr>
						</tbody>
						
						

					</table>
			</div>
		</div>
	
</body>
 
</html>