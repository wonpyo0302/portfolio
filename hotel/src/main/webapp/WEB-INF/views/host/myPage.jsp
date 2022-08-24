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
					
					
						<tbody style="background-color: green;">
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
									<button onclick="location.href=''">button1</button>
									<button onclick="location.href=''"><p>text</p><br><h1>text</h1></button><br>
									<button onclick="location.href=''">button1</button>
									<button onclick="location.href=''">button1</button>
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