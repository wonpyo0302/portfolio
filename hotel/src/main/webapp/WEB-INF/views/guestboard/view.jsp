<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/G_header.jsp"%>
<%@ page import="java.net.*" %>

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
<title>Q&A</title>

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
		location.href = "/hotel/guestboard/list.do";
	}
	// 삭제하기
	function goDel(gboard_no){
		if (confirm ('정말 삭제하시겠습니까?')){
			location.href='delete.do?gboard_no='+gboard_no;
		}	
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
				<img src="/hotel/image/boardPic/qna.png" width="40px"> 게스트 전용 문의사항
				게시판입니다.
			</h6>
			<br> 
			<br> 
			<br> 
			<br>
			<div class="bbs">
				<form method="get" name="frm" id="frm" action="view.do" enctype="multipart/form-data">
					<input type="hidden" name="gboard_no" value="${data.gboard_no}">
					<input type="hidden" name="guest_no" value="${loginInfo.guest_no}">
					<table class="board_write">
						<div class="title">
							<tr>
								<th style="width: 5%">제목</th>
								<td>${data.gboard_title }</td>
								
								<th style="width: 5%">문의유형</th>
								<td style="text-align:left" colspan='2'>
									<c:if test="${data.gboard_type==1 }">[예약]</c:if>
									<c:if test="${data.gboard_type==2 }">[결제]</c:if>
									<c:if test="${data.gboard_type==3 }">[숙소]</c:if>
									<c:if test="${data.gboard_type==4 }">[포인트/쿠폰]</c:if>
									<c:if test="${data.gboard_type==5 }">[이용/기타]</c:if>
								</td>
							</tr>
						<tr>
							<th>등록일자</th>
							<td  class="date" style="width: 30%"><fmt:formatDate value="${data.gboard_regdate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
							<th>수정일자</th>
							<td colspan='2'  class="date" style="width: 30%"><fmt:formatDate value="${data.gboard_updatedate}" pattern="yyyy/MM/dd hh:mm:ss" /></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${loginInfo.guest_name}</td>
							<th>첨부파일</th>
							<td colspan="2">
								<a href ="/hotel/download.jsp?oName=${URLEncoder.encode(data.filename_org, 'UTF-8')}&sName=${data.filename_real}" target="_blank">
									${data.filename_org }
								</a>
							
							</td>
						</tr>
						
						<tr>
							<th>내용</th>
							<td colspan="3">${data.gboard_content}</td>
						</tr>
						</div>
					</table>
					<div class="btnSet" style="text-align: right;">
						<a href="edit.do?gboard_no=${data.gboard_no }" class="btn">수정</a>
						<a href="javascript:goDel(${data.gboard_no});" class="btn">삭제</a>
						<a href="javascript:goList();" class="btn" style="text-align:right">목록 </a>
					</div>
					<div class="pagebox">
						<div>
							<p>이전글</p>
							<p>
								<a href="">${data.gboard_no}</a>
							</p>							
						
						</div>
						<div>
							<p>다음글</p>
							<p>
								<a href=""></a>
							</p>							
						
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</head>
</body>
</html>




