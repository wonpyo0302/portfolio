<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>호텔 정보</title>
    <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	   <script type="text/javascript">
    function del(hotel_no){
    	if(confirm('삭제하시겠습니까?')){
    		location.href='../myhotel/delete.do?hotel_no='+hotel_no
    	}
    }
  
    </script>
</head>
<body>
    
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">호텔 정보</h3>
    			
    			
                <div class="bbs">
                	<form method="post" name="frm" id="frm" action="insert.do" enctype="multipart/form-data" > <!-- enctype="multipart/form-data" -->
	                   <%--  <input type="hidden" name = "memberno" value="${loginInfo.no }"/> --%>
	                    <table class="board_write">
	                        <tbody>
	                        <tr>
	                            <th>*호텔명</th>
	                            <td>
	                            	${data.hotel_name }
	                            </td>
	                        </tr>
	                        <tr>
	                            <th></th>
	                            <td>
	                                
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>*호텔 전화번호</th>
	                            <td>
	                            	${data.tel }
	                            </td>
	                        </tr>
	                            <th>*주소</th>
	                            <td>
	                            	${data.addr }
	                            </td>
	                        <tr>
	                            <th>호텔 공지 사항</th>
	                            <td>
	                                ${data.hotel_content }
	                            </td>
	                        </tr>
	                        <tr>
	                        	<th>호텔 사진</th>
	                        	<td>
	                        		<c:forEach items="${imgList }" var="img" varStatus="loop">
	                        			
	                        			<img src="/hotel/upload/${img.filename_real }" style="width:100px; height:100px; padding: 5px 5px 5px 5px; boarder='1';">
	                        			
	                        		</c:forEach>
	                        	</td>
	                        </tr>
	                        </tbody>
	                    </table>
	                    
	                    <div class="btnSet"  style="text-align:right;">
	                        <a href="../room/index.do" class="btn">목록으로</a>
                      		<a href="edit.do?hotel_no=${data.hotel_no }" class="btn">수정</a>
                         	<a class="btn" onclick="del(${data.hotel_no})" >삭제</a>
	                    </div>
                    </form>
                </div>
            </div>
        </div>
        
</body>
</html>