<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/includes/G_header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>게시판 등록</title>
    
    <!-- 아래부분 공통이니까 include -->
    <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
    
    <script src="/hotel/smarteditor/js/HuskyEZCreator.js"></script><!-- 22.08.03 추가 -->
    <script src="/hotel/js/function.js"></script><!-- 22.08.03 추가 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script><!-- 22.08.03 추가 -->
    
    <script>
    	function goSave(){
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
    <br><br>
        <div class="sub">
            <div class="size">
                <h3 class="sub_title" style="text-align:left">새 문의글 작성</h3>
    
                <div class="bbs">
                <form method="post" name="frm" id="frm" action="insert.do"  enctype="multipart/form-data" > 
                <!--  <input type="hidden" name="member_no" value="${loginInfo.no}"> -->
                <!-- 작성자가 누구인지 저장/전송하기 위한 처리
                session에 loginInfo라는 이름으로 저장했기 때문에 loginInfo이름으로 꺼내야 한다. 
                그리고 loginInfo안에 MemberVO vo객체가 들어있는 것이고 member테이블에서는 member_no가 아니라 no!!!-->
                    <table class="board_write">
                        <tbody>
                        <div class="container">
                        	<ul class="list">
                        	<li class="item">
                         <tr>
                            <th>문의유형</th>
                            <td class="choose">
                            		<text type="text" name="text"/><img src="/hotel/image/smile.png" style="width:20px"> 문의유형을 선택하시면 빠른 답변을 받을 수 있습니다.<br><br>
                                <input type="radio" name="type" class="type" value="예약 문의"/> 예약 문의 <br>
                                <input type="radio" name="type" class="type" value="결제 문의"/> 결제 문의 <br>
                                <input type="radio" name="type" class="type" value="숙소 문의"/> 숙소 문의 <br>
                                <input type="radio" name="type" class="type" value="포인트/쿠폰 문의"/> 포인트/쿠폰 문의 <br>
                                <input type="radio" name="type" class="type" value="이용/기타 문의"/> 이용/기타 문의
                            </td>
                        </tr>
                        </li>
                        <tr>
                            <th>이메일</th>
                            <td>
                                 <input type="text" id="" value="" placeholder="선택사항입니다.">@<input type="text" id="" value="">
                            </td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td>
                                 <input type="text" style="width:90%" >
                            </td>
                        </tr>
                        <tr>
                            <th>문의내용</th>
                            <td>
                                <textarea name="content" id="content" style="width:90%"></textarea>
                            </td>
                        </tr>
                        <tr>
                        	<th>첨부파일</th>
                        	<td>
                        		<input type="file" name="filename">
                        	</td>
                        </tr>
                        </ul>
                        </div>
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