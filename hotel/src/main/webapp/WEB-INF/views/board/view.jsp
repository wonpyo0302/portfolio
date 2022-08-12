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
	background-color: pink;
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

<script>
	// 목록가기
	function goList() {
		location.href = "/board/list.do";
	}
</script>

</head>
<body>
	<div class="sub">
		<div class="size">
			<br> <br> <br>
			<h3 class="sub_title" style="text-align: left">Q&A</h3>
			<br>
			<h6 class="sub_content" style="text-align: left">
				<img src="/hotel/image/qna.png" width="40px"> 게스트 전용 문의사항
				게시판입니다.
			</h6>
			<br> 
			<br> 
			<br> 
			<br>
			<div class="bbs">
				<form method="get" name="frm" id="frm" action="view.do"
					enctype="multipart/form-data">
					<input type="hidden" name="gboard_no" value="${data.gboard_no}">
					<input type="hidden" name="guest_no" value="${loginInfo.guest_no}">
					<table class="board_write">
						<div class="title">
						<tr>
							<th>제목</th>
							<td>${data.gboard_title }</td>
							<th>등록일자</th>
							<td class="date" style="width: 150px"><fmt:formatDate
									value="${data.gboard_regdate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${loginInfo.guest_no}${data.gboard_writer}</td>
							<th>수정일자</th>
							<td class="date" style="width: 150px"><fmt:formatDate
									value="${data.gboard_regdate}" pattern="yyyy/MM/dd hh:mm:ss" /></td>
						</tr>
						<tr>
							<th>내용</th>
							<td style="width: 600px">${data.gboard_content}</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td>첨부파일 다운 받을 수 있게</td>
						</tr>
						</div>
					</table>
					<div class="btnSet" style="text-align: right;">
						<a class="btn" href="javascript:goList();">목록 </a>
				</form>
			</div>
			
		</div>
	</div>
</head>
</body>
</html>




