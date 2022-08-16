<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/includes/G_header.jsp" %>

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
* {
	box-sizing: border-box;
}

.container {
	background-color: light grey;
	padding: 50px;
	border: 20px solid purple;
	margin: 20px;
}

.Title {
	font-style: bold;
}

#text {
	display: none;
	font-size: 20px;
	background: rgba(0,0,0,0.08);
	font-style: bold;
	margin-bottom: 0;
	padding: 35px 32px;
	border-radius : 1px;
	font-size: 20px;
	line-height : 26px;
}

.downbtn {
	width: 25px;
	height: 25px;
	float: right;
}

.slide  img {
	display: block;
	width: 1280px;
	height: 450px;
}
</style>

<!-- 질문 클릭시 답변 보여주기 -->
<script>
	$(function() {
		$(".item").click(function() {
			if ($(this).find(".text").css('display') == 'none') {
				$(".text").slideUp("fast");
				$(this).find(".text").slideDown("fast");  
				$(".downbtn").attr("src", "/hotel/image/down.png"); 
				$(this).find(".downbtn").attr("src", "/hotel/image/up.png");
			} else {
				$(this).find(".text").slideUp("fast"); 
				$(".downbtn").attr("src", "/hotel/image/down.png"); 
			}
		})
	});
</script>
</head>
<body>
	<br>
	<br>
	<br>
	<div class="sub">
		<div class="size">
			<br>
			<h3 class="sub_title" style="text-align: left">FAQ</h3>
			<br>
			<form method="get" name="frm" id="frm" action="view.do">
				<h6 class="sub_content" style="text-align: left">
					<img src="/hotel/image/faq2.png" width="40px"> 게스트 전용 자주 묻는 질문
					게시판입니다.
				</h6>
				<br> <br> <br> <br>
				<section id="wrapper">
					<div class="container">
						<ul class="list">
							<c:forEach items="${data }" var="faq" varStatus="status">
							<!-- [예약 문의] -->
								<c:if test="${faq.gfaq_type == 1}">
									<li class="item">
										<h5 class="Title">
											[예약] &nbsp; ${faq.gfaq_title } <img src="/hotel/image/down.png" class="downbtn"> <span class="accIcon"></span>
										</h5> <br>
										<div>
											<div class="text" id="text">${faq.gfaq_content}</div>
										</div>
									</li>
								</c:if>
								
								<!-- [결제 문의] -->
								<c:if test="${faq.gfaq_type == 2}">
									<li class="item">
										<h5 class="Title">
											[결제] &nbsp; ${faq.gfaq_title } <img src="/hotel/image/down.png" class="downbtn"> <span class="accIcon"></span>
										</h5> <br>
										<div>
											<div class="text" id="text">${faq.gfaq_content}</div>
										</div>
									</li>
								</c:if>
								
								<!-- [숙소 문의] -->
								<c:if test="${faq.gfaq_type == 3}">
									<li class="item">
										<h5 class="Title">
											[숙소] &nbsp; ${faq.gfaq_title } <img src="/hotel/image/down.png" class="downbtn"> <span class="accIcon"></span>
										</h5> <br>
										<div>
											<div class="text" id="text">${faq.gfaq_content}</div>
										</div>
									</li>
								</c:if>
								
								<!-- [포인트/쿠폰 문의] -->
								<c:if test="${faq.gfaq_type == 4}">
									<li class="item">
										<h5 class="Title">
											[포인트/쿠폰] &nbsp; ${faq.gfaq_title } <img src="/hotel/image/down.png" class="downbtn"> <span class="accIcon"></span>
										</h5> <br>
										<div>
											<div class="text" id="text">${faq.gfaq_content}</div>
										</div>
									</li>
								</c:if>
								
								<!-- [이용/기타 문의] -->
								<c:if test="${faq.gfaq_type == 5}">
									<li class="item">
										<h5 class="Title">
											[이용/기타] &nbsp; ${faq.gfaq_title } <img src="/hotel/image/down.png" class="downbtn"> <span class="accIcon"></span>
										</h5> <br>
										<div>
											<div class="text" id="text">${faq.gfaq_content}</div>
										</div>
									</li>
								</c:if>
								
								<br>
							</c:forEach>
						</ul>
					</div>
				</section>
			</form>
		</div>
	</div>
</head>
</body>
</html>




