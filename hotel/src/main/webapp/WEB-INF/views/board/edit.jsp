<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.dSelect {
	height: 100%;
	text-align: left;
}
</style>

<script> 
	// 글작성 완료 후 내가 쓴글 상세보기 이동
	function goSave() {
		frm.submit();
		
	};
</script>

<script>
	$(function() {
		$(".choose").click(function() {
			if ($(this).find(".type").css('display') == 'none') {
				$(".type").slideUp("fast");
				$(this).find(".type").slideDown("fast");
				$(".downbtn").attr("src", "/hotel/image/down.png");
				$(this).find(".downbtn").attr("src", "/hotel/image/up.png");
			} else {
				$(this).find(".type").slideUp("fast");
				$(".downbtn").attr("src", "/hotel/image/down.png");
			}
		})
	});
</script>

</head>
<body>
	<br>
	<br>
	<div class="sub">
		<div class="size">
			<h3 class="sub_title" style="text-align: left">Q&A</h3>
			<br>
			<h6 class="sub_content" style="text-align: left">
				<img src="/hotel/image/qna.png" width="40px"> 게스트 전용 문의사항
				게시판입니다.
			</h6>
			<br>
			<h3 class="sub_title" style="text-align: left">문의글 수정</h3>
			<br>
			<div class="bbs">
				<form method="post" name="frm" id="frm" action="edit.do"
					enctype="multipart/form-data">
					<input type="hidden" name="gboard_no" value="${data.gboard_no}">
					<table class="board_write">
						<tbody>
							<div class="container">
								<ul class="list">
									<li class="item">
									<th>문의유형</th>
									</span>
									<td class="choose"><span class="srchSelect"> <select
											id="stype" name="stype" class="dSelect" title="검색분류 선택">
												<option value="reservation"
													<c:if test="${data.gboard_type==1 }">selected</c:if>>
													예약문의</option>
												<option value="pay"
													<c:if test="${data.gboard_type==2 }"> selected</c:if>>
													결제 문의</option>
												<option value="hotel"
													<c:if test="${data.gboard_type==3 }"> selected</c:if>>
													숙소 문의</option>
												<option value="pointAndCoupon"
													<c:if test="${data.gboard_type==4 }"> selected</c:if>>
													포인트/쿠폰 문의</option>
												<option value="etc"
													<c:if test="${data.gboard_type==5 }"> selected</c:if>>
													이용/기타 문의</option>
										</select>
											</li>
							<tr>
								<th>이메일</th>
								<td><input type="text" name="guest_email" id="email" value="" placeholder="선택사항입니다.">@<input type="text" id="" value=""></td>
							</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" name="gboard_title" style="width: 90%" value="${data.gboard_title }"></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${loginInfo.guest_name}</td>
							</tr>
							<tr>
								<th>문의내용</th>
								<td><textarea name="gboard_content" id="content" style="width: 90%" >${data.gboard_content}</textarea></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td><input type="file" name="filename"></td>
							</tr>
							</ul>
							</div>
						</tbody>
					</table>
					<div class="btnSet" style="text-align: right;">
						<a class="btn" href="javascript:goSave();">작성완료 </a>
					</div>
				</form>
			</div>

		</div>
	</div>

</body>
</html>