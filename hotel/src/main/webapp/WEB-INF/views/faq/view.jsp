<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/G_header.jsp"%>

<%-- <!DOCTYPE html>
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
<script>
$(document).ready(function(){
	$(".q1").click(function(){
		$(".a1").toggle("slow");
	})
});
</script>
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
			<div class="q1" style="display: block">오예
				<!-- <span id="q1">[이용문의] 고객센터 연결 지연 시 어떻게 하나요?? --> <img
					src="/hotel/image/down.png" id="downbtn" width="18px"><!-- </span>  -->
			</div>
			<div class="a1">
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
</html> --%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>title</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="faq list">
		<div class="size">
			<br> <br> <br> 
			<h3 class="sub_title" style="text-align: left">FAQ</h3>
			<br> <br>
			<h6 class="sub_content" style="text-align: left">
				<img src="/hotel/image/faq.png" width="40px"> 게스트 전용 자주 묻는 질문
				게시판입니다.
			</h6>
			<br> <br> 
			<div class="container-fluid" style="min-height: calc(100vh - 136px);">
				<div class="panel-group" id="accordion" role="tablist"
					aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab">
							<a role="button" data-toggle="collapse" data-parent="#accordion"
								href="#collapse1" aria-expanded="false"> [이용문의] 고객센터 연결 지연 시 어떻게 하나요?? <img
								src="/hotel/image/down.png" id="downbtn" width="18px"></a>
						</div>
						<div id="collapse1" class="panel-collapse collapse"
							role="tabpanel">
							<div class="panel-body">일부 시간대에는 통화량이 많아
							상담사 연결이 지연될 수 있습니다. 연결 지연 시, 문의사항을 남겨주시면 감사하겠습니다.</div>
						</div>
					</div>
					<!-- -->

					<div class="panel panel-default">
						<div class="panel-heading" role="tab">
							<a role="button" data-toggle="collapse" data-parent="#accordion"
								href="#collapse2" aria-expanded="false"> [이용문의] 고객센터 연결 지연 시 어떻게 하나요?? <img
								src="/hotel/image/down.png" id="downbtn" width="18px">
							</a>
						</div>
						<div id="collapse2" class="panel-collapse collapse"
							role="tabpanel">
							<div class="panel-body">일부 시간대에는 통화량이 많아
							상담사 연결이 지연될 수 있습니다. 연결 지연 시, 문의사항을 남겨주시면 감사하겠습니다.</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab">
							<a role="button" data-toggle="collapse" data-parent="#accordion"
								href="#collapse3" aria-expanded="false"> [이용문의] 고객센터 연결 지연 시 어떻게 하나요?? <img
								src="/hotel/image/down.png" id="downbtn" width="18px"></a>
						</div>
						<div id="collapse3" class="panel-collapse collapse"
							role="tabpanel">
							<div class="panel-body">일부 시간대에는 통화량이 많아
							상담사 연결이 지연될 수 있습니다. 연결 지연 시, 문의사항을 남겨주시면 감사하겠습니다.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

