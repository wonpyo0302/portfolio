<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>HOST MYPAGE</title>
    <link rel="stylesheet" href="/hotel/css/host_mypage.css"/>
    <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/includes/H_header.jsp" %>
<th> <a href="myinfo.do">내정보관리</a></th>
		<div class="sub">
			<div class="size">
				<h1 class="sub_title">마이페이지<br>HOST</h1>
					
					<table>
					
					
						<tbody>
							<tr class="tr-head" >
								<th colspan="2">
								
									<div class="user-name">${loginInfo2.host_name } 님</div>
									<div class="user-email">${loginInfo2.host_email }</div>
									<div class="d-grid gap-2 col-3 mx-auto">
									  <button class="btn btn-warning" type="button" onclick="location.href='myinfo.do'">
									  	<img src="/hotel/image/mypage/confidential.png" width="50px;">
									  	호스트 정보 관리
									  </button>
									</div>
								</th>
							</tr>
							
							<tr class="tr-head-test" >
								<th>
									<div onclick="location.href='myinfo.do'">호스트 정보 관리</div>
									<div onclick="location.href=''">button1</div>
									<div onclick="location.href=''">button1</div>
									<div onclick="location.href=''">button1</div>
								</th>
								<td>
									<button onclick="location.href='../host_review/index.do'">평점/리뷰<br><p>${map.avgScore }점 / ${map.totalReview }개</p></button>
									<button onclick="location.href='../host/sales.do'">당일 매출<br><p><fmt:formatNumber pattern="#,###" value="${map.daily_sales }"/>￦</p></button><br>
									<button onclick="location.href='../room/index.do'">등록된 객실 현황<br><p>${room_count } 개</p></button>
									<button onclick="location.href='../hostReserve/index.do'">예약현황<br><p>${map.reserve_count } 개</p></button>
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