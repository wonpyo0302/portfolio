<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/admin/include/headHtml.jsp"%>
<%@ include file="/WEB-INF/views/admin/include/top.jsp"%>




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

	function goSave(){
		editor.getById['hfaq_content'].exec('UPDATE_CONTENTS_FIELD',[]); // getById -> jindo라는 프레임워크에서 사용하는 것	
		frm.submit();
	}
	var editor; // 변수를 밖에 쓴 이유: 전역변수로 사용하기 위해서
	$(function(){
		editor = setEditor('hfaq_content'); // textarea id= content
	});
		
	function goBack() {
		history.back();
	}
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
				<h2>호스트 관리 ▶ FAQ ▶ 수정</h2>
			</div>
		</div>
	</div>
	<div class="sub">
		<div class="size">
			<div class="bbs">
				<form method="post" name="frm" id="frm" action="edit.do"
					enctype="multipart/form-data">
					<input type="hidden" name="hfaq_no" value="${data.hfaq_no }">
					<table class="board_write">
						<tbody>
							<tr>
								<th>분류</th>
								<td class="choose"><span class="srchSelect"> <select
										id="stype" name="hfaq_type" class="dSelect" title="검색분류 선택">
											<option name="hfaq_type" value="6"
												<c:if test="${data.hfaq_type == 6 }">selected</c:if>>
												입점</option>
											<option name="hfaq_type" value="7"
												<c:if test="${data.hfaq_type == 7 }">selected</c:if>>
												광고/제휴</option>
											<option name="hfaq_type" value="8"
												<c:if test="${data.hfaq_type == 8 }">selected</c:if>>
												이용회원</option>
											<option name="hfaq_type" value="8"
												<c:if test="${data.hfaq_type == 9 }">selected</c:if>>
												이용/기타</option>
									</select>
										</li></td>
							</tr>
							<tr>
							<tr>
								<th>제목</th>
								<td><input type="text" name="hfaq_title" id="title"
									 style="width: 90%" value="${data.hfaq_title }" /></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="hfaq_content" id="hfaq_content"
										style="width: 90%">${data.hfaq_content}</textarea></td>
							</tr>

						</tbody>
					</table>
							<div class="btnSet">
						<a class="btn"
							style="align: left; background-color: grey; border: 2px solid grey"
							href="javascript:goBack();">이전 </a> <a class="btn"
							style="align: right;" href="javascript:goSave();">저장 </a>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>