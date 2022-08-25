<%@ page language="java" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/admin/include/headHtml.jsp" %>
<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>

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
<title>FAQ</title>

<!-- 아래부분 공통이니까 include -->
<link rel="stylesheet" href="/hotel/css/reset.css" />
<link rel="stylesheet" href="/hotel/css/contents.css" />

<script src="/hotel/smarteditor/js/HuskyEZCreator.js"></script>
<script src="/hotel/js/function.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
* {
	box-sizing: border-box;
}
.item {
	font-size: 20px;
	line-height : 26px;
}
.container {
	background-color: light grey;
	padding: 50px;
	border: 15px solid lightpink;
	margin: 20px;
}

.Title {
	font-style: bold;
	font-size: 20px;
}

.hfaq_content {
	display: none;
	font-size: 20px;
	background: rgba(0,0,0,0.08);
	font-style: bold;
	margin-bottom: 0;
	padding: 35px 30px 30px 35px;
	border-radius : 1px;
	font-size: 20px;
	line-height : 26px;
	position: relative;
}

.hfaq_content2 {
	width : 90%;
	display : block;
	border : 0.1px solid #949690;
	padding: 10px 10px 10px 10px;
	
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
.content_btn {
	position:absolute;
	right:10px;top:38px;
}
.content_btn > input {
	height:40px;
	width:50px;
	background-color:black;
	color:white;
	border-radius : 5px;
	line-height : 26px;
}
</style>

<!-- 질문 클릭시 답변 보여주기 -->
<script>
	$(function() {
		$(".item").click(function() {
			if ($(this).find(".hfaq_content").css('display') == 'none') {
				$(".hfaq_content").slideUp("fast");
				$(this).find(".hfaq_content").slideDown("fast");  
				$(".downbtn").attr("src", "/hotel/image/boardPic/down.png"); 
				$(this).find(".downbtn").attr("src", "/hotel/image/boardPic/up.png");
			} else {
				$(this).find(".hfaq_content").slideUp("fast"); 
				$(".downbtn").attr("src", "/hotel/image/boardPic/down.png"); 
			}
		})
	});
</script>


<script>
	function goWrite() {
		frm.submit();
	};
</script>



</head>
<body>
	<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>호스트 관리 ▶ FAQ ▶ 보기</h2>
				</div>
			</div>
	</div>
	<div class="sub">
		<div class="size">
			<form method="get" name="frm" id="frm" action="write.do">
				<section id="wrapper">
					<div class="container">
						<ul class="list">
							<c:forEach items="${data }" var="faq" varStatus="status">
								<li class="item">
										<h5 class="Title" name ="hfaq_title">
										<c:if test="${faq.hfaq_type == 6}">
											[입점] 
										</c:if>
										<c:if test="${faq.hfaq_type == 7}">
											[광고/제휴] 
										</c:if>
										<c:if test="${faq.hfaq_type == 8}">
											[이용회원] 
										</c:if>
										<c:if test="${faq.hfaq_type == 9}">
											[이용/기타] 
										</c:if>
										&nbsp; ${faq.hfaq_title } 
										<img src="/hotel/image/boardPic/down.png" class="downbtn">
											<span class="accIcon"></span>
										</h5> <br>
										<div class="hfaq_content">
											<div class="hfaq_content2">
												<tr><td>${faq.hfaq_content}</tr></td>
											</div>
											<div class="content_btn">
												<input type="button" value="수정" onclick="location.href='edit.do?hfaq_no=${faq.hfaq_no}';">
												<input type="button" value="삭제" onclick="location.href='delete.do?hfaq_no=${faq.hfaq_no}';">
											</div>
										</div>
									</li>
								<br>
							</c:forEach>
						</ul>
					</div>
					<div class="btnSet" style="text-align: right;">
						<a class="btn" href="javascript:goWrite();">등록 </a>
					</div>
				</section>
			</form>
		</div>
	</div>
</head>
</body>
</html>




