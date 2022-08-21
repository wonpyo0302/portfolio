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
<!-- 카카오톡 공유하기 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
	// 목록가기
	function goList() {
		location.href = "list.do";
	}


	// 카카오톡 공유
	Kakao.init('7316461b564393db0543f1e130e426e9'); // 앱 키
	function share() {
		Kakao.Share
				.createDefaultButton({
					container : '#create-kakaotalk-sharing-btn',
					objectType : 'feed',
					content : {
						title : '${gnotice_title}',
						description : '${gnotice_content}',
						imageUrl : 'http://localhost:8080/hotel/image/boardPic/notice.png',
						link : {
							mobileWebUrl : 'http://localhost:8080/hotel/guestboard/view.do?gnotice_no=${gnotice_no}',
							webUrl : 'http://localhost:8080/hotel/guestboard/view.do?gnotice_no=${gnotice_no}',
						},
					}
				})
	}
</script>

</head>
<body>
	<div class="sub">
		<div class="size">
			<br> <br> <br>
			<h3 class="sub_title" style="text-align: left">공지사항</h3>
			<br>
			<h6 class="sub_content" style="text-align: left">
				<img src="/hotel/image/boardPic/notice.png" width="60px"> 게스트
				전용 공지사항 게시판입니다.
			</h6>
			<br> <br> <br> <br>
			<div class="bbs">
				<form method="get" name="frm" id="frm" action="edit.do"
					enctype="multipart/form-data">
					<input type="hidden" name="gnotice_no" value="${data.gnotice_no}">
					<input type="hidden" name="guest_no" value="${loginInfo.guest_no}">
					<table class="board_write">
						<div class="title">
							<tr>
								<th>제목</th>
								<td>${data.gnotice_title }</td>
								<th>등록일자</th>
								<td class="date" style="width: 35%"><fmt:formatDate
										value="${data.gnotice_regdate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
							</tr>
							<div class="btnSet" style="text-align: right;">
								<a id="create-kakaotalk-sharing-btn" href="javascript:share();">
									<img
									src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png"
									width="30px" alt="카카오톡 공유 보내기 버튼" />
								</a>
							</div>
							<tr>
								<th>작성자</th>
								<td>관리자</td>
								<th>수정일자</th>
								<td class="date" style="width: 150px"><fmt:formatDate
										value="${data.gnotice_regdate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3" style="width: 600px">${data.gnotice_content}</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="3"><a
									href="/hotel/download.jsp?oName=${URLEncoder.encode(data.filename_org, 'UTF-8')}&sName=${data.filename_real}"
									target="_blank"> ${data.filename_org } </a></td>
							</tr>
						</div>
					</table>
					<div class="btnSet" style="text-align: right;">
						<a class="btn" href="javascript:goList();">목록 </a>
					</div>
					
					<br><br><br><br>
					<hr>
					<div class="pagebox">
						<div>
							<p>
								<a href="view.do?gnotice_no=${next.gnotice_no}"><img
									src="/hotel/image/boardPic/up.png" width="20px"> 다음글 |
									${next.gnotice_title }</a>
							</p>
						</div>
						<hr>
						<div>
							<p>
								<a href="view.do?gnotice_no=${prev.gnotice_no}"><img
									src="/hotel/image/boardPic/down.png" width="20px"> 이전글 |
									${prev.gnotice_title }</a>
							</p>
						</div>
						<hr>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>