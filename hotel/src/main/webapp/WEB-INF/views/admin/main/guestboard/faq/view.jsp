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

.container {
	background-color: light grey;
	padding: 50px;
	border: 15px solid mistyrose;
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
				$(".downbtn").attr("src", "/hotel/image/boardPic/down.png"); 
				$(this).find(".downbtn").attr("src", "/hotel/image/boardPic/up.png");
				
			} else {
				$(this).find(".text").slideUp("fast"); 
				$(".downbtn").attr("src", "/hotel/image/boardPic/down.png"); 
			}
		})
	});
</script>

<script>
	function goWrite() {
		<c:if test="${!empty loginInfo_admin}">
			frm.submit();
			location.href= "write.do";
		</c:if>
		<c:if test="${empty loginInfo_admin}">
			alert("관리자 로그인 바랍니다.");
			location.href="/hotel/admin/login.do";
		</c:if>
	};
</script>



</head>
<body>
	<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>게스트 관리 ▶ FAQ ▶ 보기</h2>
				</div>
			</div>
	</div>
	<div class="sub">
		<div class="size">
			<form method="get" name="frm" id="frm" action="view.do">
				<section id="wrapper">
					<div class="container">
						<ul class="list">
							<c:forEach items="${data }" var="faq" varStatus="status">
								<!-- [예약 문의] -->
								<c:if test="${faq.gfaq_type == 1}">
									<li class="item">
										<h5 class="Title">
											[예약] &nbsp; ${faq.gfaq_title } <img
												src="/hotel/image/boardPic/down.png" class="downbtn">
											<span class="accIcon"></span>
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
											[결제] &nbsp; ${faq.gfaq_title } <img
												src="/hotel/image/boardPic/down.png" class="downbtn">
											<span class="accIcon"></span>
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
											[숙소] &nbsp; ${faq.gfaq_title } <img
												src="/hotel/image/boardPic/down.png" class="downbtn">
											<span class="accIcon"></span>
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
											[포인트/쿠폰] &nbsp; ${faq.gfaq_title } <img
												
												
												src="/hotel/image/boardPic/down.png" class="downbtn">
											<span class="accIcon"></span>
										</h5> <br>
										<div>
											<pre><input type="text" class="text" id="text" value="${faq.gfaq_content}" readonly="readonly" style="width:100%;"></pre>
										</div>
									</li>
								</c:if>

								<!-- [이용/기타 문의] -->
								<c:if test="${faq.gfaq_type == 5}">
									<li class="item">
										<h5 class="Title">
											[이용/기타] &nbsp; ${faq.gfaq_title } <img
												src="/hotel/image/boardPic/down.png" class="downbtn">
											<span class="accIcon"></span>
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




