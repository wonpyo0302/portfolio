<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/headHtml.jsp" %>
<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>



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
    
    <script src="/hotel/smarteditor/js/HuskyEZCreator.js"></script>
    <script src="/hotel/js/function.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
        
<style>
th {
	width: 10%;
	text-align: center;
}
</style>

    <script>
   	function goSave(){
		editor.getById['gnotice_content'].exec('UPDATE_CONTENTS_FIELD',[]); // getById -> jindo라는 프레임워크에서 사용하는 것	
		frm.submit();
	}
	var editor; // 변수를 밖에 쓴 이유: 전역변수로 사용하기 위해서
	$(function(){
		editor = setEditor('gnotice_content'); // textarea id= content
	});
    	
    	function goBack(){
    		history.back();
    	};

    </script>
</head>
<body>
    <div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>게스트 관리 ▶ NOTICE ▶ 등록</h2>
				</div>
			</div>
	</div>
        <div class="sub">
            <div class="size">
                <div class="bbs">
                <form method="post" name="frm" id="frm" action="write.do"  enctype="multipart/form-data" > 
                    <table class="board_write">
                    	<tbody>
							<div class="container">
								<ul class="list">
									<li class="item">
										<th>분류</th>
										</span>
										<td class="choose">
										<span class="srchSelect"> 
										<select id="stype" name="gnotice_type" class="dSelect" title="검색분류 선택">
												<option name="gnotice_type" value="1">안내</option>
												<option name="gnotice_type" value="2">공지</option>
												<option name="gnotice_type" value="3">이벤트</option>
												<option name="gnotice_type" value="4">발표</option>
										</select>
									</li>
							<tr>
								<th>중요</th>
								<td>중요 공지 <input type="checkbox" name="fix" id="fix" value="1" ></td>
							</tr>
									
							<tr>
								<th>제목</th>
								<td><input name="gnotice_title" id="gnotice_title" type="text" style="width: 90%"></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>관리자</td>
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
                    <div class="btnSet"  >
                        <a class="btn" style="align:left; background-color:grey; border:2px solid grey " href="javascript:goBack();" >이전 </a>
                        <a class="btn" style="align:right;" href="javascript:goSave();">저장 </a>
                    </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
</body>
</html>