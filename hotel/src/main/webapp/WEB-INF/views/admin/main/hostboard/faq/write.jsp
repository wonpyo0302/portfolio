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
    <title>FAQ</title>
    
    <!-- 아래부분 공통이니까 include -->
    <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
    
    <script src="/hotel/smarteditor/js/HuskyEZCreator.js"></script><!-- 22.08.03 추가 -->
    <script src="/hotel/js/function.js"></script><!-- 22.08.03 추가 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script><!-- 22.08.03 추가 -->
    
    <style>
    .title{
    		width : 80%;
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
	
    	
     function goBack(){
    		history.back();
    	};
    </script>
    
</head>
<body>
    <div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>호스트 관리 ▶ FAQ ▶ 등록</h2>
				</div>
			</div>
	</div>
        <div class="sub">
            <div class="size">
                <div class="bbs">
                <form method="post" name="frm" id="frm" action="write.do"  enctype="multipart/form-data" > 
                    <table class="board_write">
						<tbody>
							<tr>
								<th>분류</th>
								<td class="choose"> <span class="srchSelect"> 
									<select id="stype" name="hfaq_type" class="dSelect" title="검색분류 선택">
											<option name="hfaq_type" value="6">입점</option>
											<option name="hfaq_type" value="7">광고/제휴</option>
											<option name="hfaq_type" value="8">이용회원</option>
											<option name="hfaq_type" value="9">이용/기타</option>
									</select>
								</td>
							</tr>
							<tr>
							<tr>
								<th>제목</th>
								<td><input type="text" name="hfaq_title" id="title" value="" style="width: 90%"/>
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="hfaq_content" id="hfaq_content" style="width: 90%"></textarea></td>
							</tr>

						</tbody>
					</table>
                    <div class="btnSet"  >
                        <a class="btn" style="align:left; background-color:grey; border:2px solid grey " href="javascript:goBack();" >이전 </a>
                        <a class="btn" style="align:right;" href="javascript:goSave();">저장 </a>
                    </div>
                
                    
                    </form>
                </div>
            </div>
        </div>
        
</body>
</html>