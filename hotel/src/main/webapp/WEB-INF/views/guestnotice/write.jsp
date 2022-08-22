<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/includes/G_header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>NOTICE</title>
    
    <!-- 아래부분 공통이니까 include -->
    <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
    
    <script src="/hotel/smarteditor/js/HuskyEZCreator.js"></script><!-- 22.08.03 추가 -->
    <script src="/hotel/js/function.js"></script><!-- 22.08.03 추가 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script><!-- 22.08.03 추가 -->
    
    <script>
    	function goSave(){
    		location.href="write.do";
    		frm.submit();
    	}
    	});
    </script>
</head>
<body>
        <div class="sub">
            <div class="size">
            <br> <br>
        	<h3 class="sub_title" style="text-align: left">NOTICE</h3>
			<br>
			<h6 class="sub_content" style="text-align: left">
				<img src="/hotel/image/boardPic/qna.png" width="40px"> 게스트 전용 공지사항
				게시판입니다.
			</h6>
			<br>
			<h3 class="sub_title" style="text-align: left">새 글 작성</h3>
			<br>
                <div class="bbs">
                <form method="post" name="frm" id="frm" action="insert.do"  enctype="multipart/form-data" > 
       		    <input type="hidden" name="admin_no" value="${loginInfo2.admin_no}"> 
                    <table class="board_write">
                    	<tbody>
							<div class="container">
								<ul class="list">
									<li class="item">
										<th>분류</th>
										</span>
										<td class="choose">
										<span class="srchSelect"> 
										<select id="stype" name="gboard_type" class="dSelect" title="검색분류 선택">
												<option name="gboard_type" value="1">안내</option>
												<option name="gboard_type" value="2">공지</option>
												<option name="gboard_type" value="3">이벤트</option>
												<option name="gboard_type" value="4">발표</option>
										</select>
									</li>
							<tr>
								<th>제목</th>
								<td><input name="gnotice_title" id="gnotice_title" type="text" style="width: 90%"></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${loginInfo2.admin_no}</td>
							</tr>
							<tr>
								<th>문의내용</th>
								<td><textarea name="gnotice_content" id="gnotice_content" style="width: 90%"></textarea></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td><input type="file" name="filename"></td>
							</tr>
							</ul>
							</div>
						</tbody>
                    </table>
                    <div class="btnSet"  style="text-align:right;">
                        <a class="btn" href="javascript:goSave();">작성완료 </a>
                    </div>
                    </form>
                </div>
            </div>
        </div>
</body>
</html>