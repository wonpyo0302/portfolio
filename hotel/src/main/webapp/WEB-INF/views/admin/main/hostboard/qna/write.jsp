<%@ page language="java"  	pageEncoding="UTF-8"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<style>
.dSelect {
	height : 100%;
	text-align : left;
}
</style>

<script>
    	function goSave(){
    		frm.submit();
    	};
    	</script>



</head>
<body>
  <div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>호스트 관리 ▶ Q&A ▶ 등록</h2>
				</div>
			</div>
	</div>
	<div class="sub">
		<div class="size">
			<div class="bbs">
				<form method="post" name="frm" id="frm" action="../hostboard/insert.do" enctype="multipart/form-data">
					<input type="hidden" name="host_no" value="${loginInfo2.host_no}">
					<table class="board_write">
						<tbody>
							<div class="container">
								<ul class="list">
									<li class="item">
										<th>문의유형</th>
										</span>
										<td class="choose">
										<span class="srchSelect"> <select id="stype" name="hboard_type" class="dSelect" title="검색분류 선택">
												<option name="hboard_type" value="6">입점 문의</option>
												<option name="hboard_type" value="7">결제 문의</option>
												<option name="hboard_type" value="8">이용회원 문의</option>
												<option name="hboard_type" value="9">이용/기타 문의</option>
										</select>
									</li>
									<tr>
										<th>이메일</th>
										<td><input type="text" id="" value="" placeholder="선택사항입니다.">@<input type="text" id="" value=""></td>
									</tr>
							<tr>
								<th>제목</th>
								<td><input name="hboard_title" id="hboard_title" type="text" style="width: 90%"></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${loginInfo.host_name}</td>
							</tr>
							<tr>
								<th>문의내용</th>
								<td><textarea name="hboard_content" id="hboard_content" style="width: 90%"></textarea></td>
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