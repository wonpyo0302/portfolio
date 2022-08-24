<%@ page language="java" 	pageEncoding="UTF-8"%>
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
<title>Q&A</title>

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

	function goBack() {
		history.back();
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
   <div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>호스트 관리 ▶ Q&A ▶ 수정</h2>
				</div>
			</div>
	</div>
	<div class="sub">
		<div class="size">
			<div class="bbs">
				<form method="post" name="frm" id="frm" action="edit.do"
					enctype="multipart/form-data">
					<input type="hidden" name="hboard_no" value="${data.hboard_no}">
					<table class="board_write">
						<tbody>
							<div class="container">
								<ul class="list">
									<li class="item">
									<th>문의유형</th>
									</span>
									<td class="choose"><span class="srchSelect"> 
									<select id="stype" name="stype" class="dSelect" title="검색분류 선택">
												<option value="reservation"
													<c:if test="${data.hboard_type==1}">selected</c:if>>예약</option>
												<option value="pay"
													<c:if test="${data.hboard_type==2}">selected</c:if>>결제</option>
												<option value="hotel"
													<c:if test="${data.hboard_type==3}">selected</c:if>>숙소</option>
												<option value="pointAndCoupon"
													<c:if test="${data.hboard_type==4}">selected</c:if>>포인트/쿠폰</option>
												<option value="etc"
													<c:if test="${data.hboard_type==5}">selected</c:if>>이용/기타</option>
										</select>
											</li>
							<tr>
								<th>이메일</th>
								<td><input type="text" name="host_email" id="email" value="" placeholder="선택사항입니다.">@<input type="text" id="" value=""></td>
							</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" name="hboard_title" style="width: 90%" value="${data.hboard_title }"></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${loginInfo.host_name}</td>
							</tr>
							<tr>
								<th>문의내용</th>
								<td><textarea name="hboard_content" id="content" style="width: 90%" >${data.hboard_content}</textarea></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td><input type="file" name="filename"></td>
							</tr>
							</ul>
							</div>
						</tbody>
					</table>
				<div class="btnSet" >
					   <a class="btn" style="align:left; background-color:grey; border:2px solid grey " href="javascript:goBack();" >이전 </a>
                        <a class="btn" style="align:right;" href="javascript:goSave();">저장 </a>
					</div>
				</form>
			</div>

		</div>
	</div>

</body>
</html>