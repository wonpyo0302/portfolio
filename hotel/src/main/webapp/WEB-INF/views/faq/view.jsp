<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/G_header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
<meta name="format-detection"
	content="telephone=no, address=no, email=no">
<meta name="keywords" content="">
<meta name="description" content="">
<title>게시판 등록</title>

<!-- 아래부분 공통이니까 include -->
<link rel="stylesheet" href="/hotel/css/reset.css" />
<link rel="stylesheet" href="/hotel/css/contents.css" />

<script src="/hotel/smarteditor/js/HuskyEZCreator.js"></script>
<script src="/hotel/js/function.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<srcipt>

</srcipt>
<body>
	<div class="faq list">
		<div class="size">
			<br> <br> <br> <br> <br> <br>
			<h3 class="sub_title" style="text-align: left">FAQ</h3>
			<br> <br>
			<h6 class="sub_content" style="text-align: left">
				<img src="/hotel/image/faq.png" width="40px"> 게스트 전용 자주 묻는 질문
				게시판입니다.
			</h6>
			<br> <br> <br> <br>
			<div class="q1" style="display: block">
			 <span>[이용문의] 고객센터 연결 지연 시 어떻게 하나요?? <img src="/hotel/image/down.png" id="downbtn" width="18px"></span>
			 	<ul class="a1">
				 	<li>
				 		<font face="arial"> 
							<span style="font-size: 13px; display: none;">일부 시간대에는 통화량이 많아 상담사 연결이 지연될 수 있습니다. </span>
					 		<span style="font-family: arial; font-size: 10pt;">&nbsp;연결 지연 시, 문의사항을 남겨주시면 감사하겠습니다.</span>
					 	</font>
					 </li> 
				</ul>
			</div>
			
			<div class="a2">
				<p>
					<font face="arial"> 
					<span style="font-size: 13px; display: none;">일부 시간대에는 통화량이 많아
							상담사 연결이 지연될 수 있습니다. 연결 지연 시, 문의사항을 남겨주시면 감사하겠습니다.</span>
					</font> <span style="font-family: arial; font-size: 10pt;">&nbsp;</span>
			</div>
		</div>
	</div>
</head>
</body>
</html> 