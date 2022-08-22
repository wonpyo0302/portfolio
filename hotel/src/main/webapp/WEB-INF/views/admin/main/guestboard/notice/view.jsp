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
<title>게시판 등록</title>

<!-- 아래부분 공통이니까 include -->
<link rel="stylesheet" href="/hotel/css/reset.css" />
<link rel="stylesheet" href="/hotel/css/contents.css" />

<script src="/hotel/smarteditor/js/HuskyEZCreator.js"></script>
<script src="/hotel/js/function.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
	// 목록가기
	function goList() {
		location.href = "list.do";
	}
	// 수정하기
	function goEdit() {
		location.href = "edit.do";
	}
</script>

</head>
<body>
    <div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>게스트 관리 ▶ NOTICE ▶ 상세보기</h2>
				</div>
			</div>
	</div>
	<div class="sub">
		<div class="size">

			<div class="bbs">
				<form method="get" name="frm" id="frm" action="edit.do" enctype="multipart/form-data">
					<input type="hidden" name="gnotice_no" value="${data.gnotice_no}">
					<input type="hidden" name="guest_no" value="${loginInfo.guest_no}">
					<table class="board_write">
						<div class="title">
						<tr>
							<th>제목</th>
							<td>${data.gnotice_title }</td>
							<th>등록일자</th>
							<td class="date"  style="width: 35%"><fmt:formatDate
									value="${data.gnotice_regdate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>관리자</td>
							<th>수정일자</th>
							<td class="date" style="width: 150px"><fmt:formatDate
									value="${data.gnotice_regdate}" pattern="yyyy/MM/dd hh:mm:ss" /></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3" style="width: 600px">${data.gnotice_content}</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="3">
							<a href ="/hotel/download.jsp?oName=${URLEncoder.encode(data.filename_org, 'UTF-8')}&sName=${data.filename_real}" target="_blank">
									${data.filename_org }
								</a>
								</td>
						</tr>
						</div>
					</table>
					<div class="btnSet" style="text-align: right;">
						<a class="btn" href="javascript:goEdit();">수정 </a>
						<a class="btn" href="javascript:goList();">목록 </a>
					</div>
					<div class="pagebox">
						<div>
							<p><a href="view.do?gnotice_no=${prev.rownum}">이전글 | ${prev.gnotice_title }</a></p>							
						</div>
						<div>
							<p><a href="view.do?gnotice_no=${next.rownum}">다음글 | ${next.gnotice_title }</a></p>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>