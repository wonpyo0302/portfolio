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

th {
	width: 10%;
	text-align : center;
}
</style>

<script> 
	function goSave(){
		editor.getById['gboard_content'].exec('UPDATE_CONTENTS_FIELD',[]); // getById -> jindo라는 프레임워크에서 사용하는 것	
		frm.submit();
	}
	var editor; // 변수를 밖에 쓴 이유: 전역변수로 사용하기 위해서
	$(function(){
		editor = setEditor('gboard_content'); // textarea id= content
	});
	
	function goBack(){
		history.back();
	}
</script>



</head>
<body>
	<br>
	<br>
	<div class="sub">
		<div class="size">
			<h3 class="sub_title" style="text-align: left">Q&A</h3>
			<br>
		
			<h3 class="sub_title" style="text-align: left">문의글 수정</h3>
			<br>
			<div class="bbs">
				<form method="post" name="frm" id="frm" action="edit.do" enctype="multipart/form-data">
					<input type="hidden" name="gboard_no" value="${data.gboard_no}">
					<table class="board_write">
						<tbody>
							<div class="container">
								<ul class="list">
									<li class="item">
									<th>문의유형</th>
								
									<td class="choose"><span class="srchSelect"> 
									<select	id="stype" name="gboard_type" class="dSelect" title="검색분류 선택">
												<option value="1"
													<c:if test="${data.gboard_type==1 }">selected</c:if>>
													예약 문의</option>
												<option value="2"
													<c:if test="${data.gboard_type==2 }"> selected</c:if>>
													결제 문의</option>
												<option value="3"
													<c:if test="${data.gboard_type==3 }"> selected</c:if>>
													숙소 문의</option>
												<option value="4"
													<c:if test="${data.gboard_type==4 }"> selected</c:if>>
													포인트/쿠폰 문의</option>
												<option value="5"
													<c:if test="${data.gboard_type==5 }"> selected</c:if>>
													이용/기타 문의</option>
										</select>
											</li>
							<tr>
								<th>이메일</th>
								<td><input type="text" name="guest_email" id="email" value="" placeholder="선택사항입니다."></td>
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
								<td><textarea name="gboard_content" id="gboard_content" style="width: 90%" >${data.gboard_content}</textarea></td>
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