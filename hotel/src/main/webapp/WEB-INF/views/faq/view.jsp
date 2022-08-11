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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>

* {
 	box-sizing:border-box;
}

.container{
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
	background-color: pink;
}

#downbtn {
	width: 25px;
	height: 25px;
	float : right;
}

.slide  img{    
        display: block;
        width: 1280px;
        height: 450px;  
        

</style>

<!-- 질문 클릭시 답변 보여주기 -->
<script>
	$(function() {
		$(".item").click(function() {
			$(".text").slideUp("fast");
			$(this).find(".text").slideDown("fast");            
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
			<h6 class="sub_content" style="text-align: left">
				<img src="/hotel/image/faq.png" width="40px"> 게스트 전용 자주 묻는 질문
				게시판입니다.
			</h6>
			<br> 
			<br>
			<br>
			<br>
			<section id="wrapper">
				<div class="container">
					<ul class="list">
						<li class="item">
							<h5 class="Title">
								[이용문의] 고객센터 연결 지연 시 어떻게 하나요?? 
								<img src="/hotel/image/down.png"	id="downbtn"><span class="accIcon"></span>
							</h5> 
							<br>
							<div>
							<div class="text" id="text">일부 시간대에는 통화량이 많아 상담사 연결이 지연될 수
								있습니다.</div>
							<div> <span class="text" id="text">연결 지연 시, 문의사항을 남겨주시면 감사하겠습니다.</span></div>
							<div class="text" id="text">일부 시간대에는 통화량이 많아 상담사 연결이 지연될 수
								있습니다.</div>
							</div>

						</li>
						<br>
						<li class="item">
							<h5 class="Title">
								[이용문의] 고객센터 연결 지연 시 어떻게 하나요?? <img src="/hotel/image/down.png"
									id="downbtn"><span class="accIcon"></span>
							</h5> 
							<br>
							<div class="text" id="text">일부 시간대에는 통화량이 많아 상담사 연결이 지연될 수
								있습니다. 연결 지연 시, 문의사항을 남겨주시면 감사하겠습니다.</div>
						</li>
						<br>
						<li class="item">
							<h5 class="Title">
								[이용문의] 고객센터 연결 지연 시 어떻게 하나요?? <img src="/hotel/image/down.png"
									id="downbtn"><span class="accIcon"></span>
							</h5> 
							<br>
							<div class="text" id="text">일부 시간대에는 통화량이 많아 상담사 연결이 지연될 수
								있습니다. 연결 지연 시, 문의사항을 남겨주시면 감사하겠습니다.</div>
						</li>
						<br>
						<li class="item">
							<h5 class="Title">
								[이용문의] 고객센터 연결 지연 시 어떻게 하나요?? <img src="/hotel/image/down.png"
									id="downbtn"><span class="accIcon"></span>
							</h5> 
							<br>
							<div class="text" id="text">일부 시간대에는 통화량이 많아 상담사 연결이 지연될 수
								있습니다. 연결 지연 시, 문의사항을 남겨주시면 감사하겠습니다.</div>
						</li>
						<br>
						<li class="item">
							<h5 class="Title">
								[이용문의] 고객센터 연결 지연 시 어떻게 하나요?? <img src="/hotel/image/down.png"
									id="downbtn"><span class="accIcon"></span>
							</h5> 
							<br>
							<div class="text" id="text">일부 시간대에는 통화량이 많아 상담사 연결이 지연될 수
								있습니다. 연결 지연 시, 문의사항을 남겨주시면 감사하겠습니다.</div>
						</li>
					</ul>
				</div>
			</section>
		</div>
	</div>
</head>
</body>
</html>




