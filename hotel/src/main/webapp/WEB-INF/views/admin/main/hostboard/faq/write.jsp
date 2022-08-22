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
    		
    		frm.submit();
    	}
 
    	});

    </script>
    
</head>
<body>
    	<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>게스트 관리 ▶ 공지사항 ▶ 등록</h2>
				</div>
			</div>
	</div>
        <div class="sub">
            <div class="size">
                <div class="bbs">
                <form method="post" name="frm" id="frm" action="insert.do"  enctype="multipart/form-data" > 
                <!--  <input type="hidden" name="member_no" value="${loginInfo.no}"> -->
                <!-- 작성자가 누구인지 저장/전송하기 위한 처리
                session에 loginInfo라는 이름으로 저장했기 때문에 loginInfo이름으로 꺼내야 한다. 
                그리고 loginInfo안에 MemberVO vo객체가 들어있는 것이고 member테이블에서는 member_no가 아니라 no!!!-->
                    <table class="board_write">
                        <tbody>
                        <tr>
                            <th>문의유형</th>
                            <td>
                                <input type="radio" name="type" id="type" value="예약 문의"/> 예약 문의 <br>
                                <input type="radio" name="type" id="type" value="결제 문의"/> 결제 문의 <br>
                                <input type="radio" name="type" id="type" value="숙소 문의"/> 숙소 문의 <br>
                                <input type="radio" name="type" id="type" value="포인트/쿠폰 문의"/> 포인트/쿠폰 문의 <br>
                                <input type="radio" name="type" id="type" value="이용/기타 문의"/> 이용/기타 문의
                            </td>
                        </tr>
                        <tr>
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" name="title" id="title"  value=""/>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="content" id="content" style="width:90%"></textarea>
                            </td>
                        </tr>
                       
                        </tbody>
                    </table>
                    <div class="btnSet"  style="text-align:right;">
                        <a class="btn" href="javascript:goSave();">저장 </a>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        
</body>
</html>