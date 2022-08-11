<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalabel=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>객실 상세 수정</title>
    <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script type="text/javascript">
    function del(room_no){
    	if(confirm('삭제하시겠습니까?')){
    		location.href='delete.do?room_no='+room_no
    	}
    }
    
    
    </script>
		
	<style type="text/css">
		
	</style>
</head>
<body>
    
        <div class="sub">
            <div class="size">
            
            	
                <h3 class="sub_title"> 객실 정보 수정 </h3>
    
                <div class="bbs">
                	<form method="get" name="frm" id="frm" action="update.do" enctype="multipart/form-data" > <!-- enctype="multipart/form-data" -->
	                   <input type="hidden" name = "room_no" value="${data.room_no }"/>
	                    <table class="board_write">
	                        <tbody>
	                        <tr>
	                            <th>객실명</th>
	                            <td>
	                            	<input type="text" name="room_name" id="room_name" class="wid100" value="${data.room_name}"/>
	                               
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>객실 번호</th>
	                            <td>
	                            	<input type="number" name="number" id="number" class="wid100" value="${data.number}"/>
	                                 
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>객실 가격</th>
	                            <td>
	                            	<input type="number" step='10000' name="room_price" id="room_price" class="wid100" value="${data.room_price}"/>
	                                 
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>수용인원(demo)</th>
	                            <td>
	                                 2 명
								</td>
	                        </tr>
	                        <tr>
	                            <th>편의시설 & 서비스(demo)</th>
	                            <td>
		                             <input type="checkbox" name="comfors" id="comfors1" value="gym" > <label for="comfors1">GYM</label> |&nbsp; 
		                             <label><input type="checkbox" name="comfors" value="parking" > 주차장 |&nbsp; </label>
		                             <label><input type="checkbox" name="comfors" value="cvs" > 편의점 |&nbsp;  </label>
		                             <label><input type="checkbox" name="comfors" value="wifi" > WIFI |&nbsp; </label>
		                             <label><input type="checkbox" name="comfors" value="roomservice" > 룸서비스&nbsp; </label>          
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>객실 상세</th>
	                            <td>
	                             <textarea name="room_content" id="room_content">${data.room_content}</textarea>
	                            </td>
	                        </tr>
	                        <tr>
	                        	<th> 객실 사진</th>
	                        	<td>
	                        		<c:forEach items="${imgList }" var="img" varStatus="idx">
		                        			<img src="/hotel/upload/${img.filename_real }" id="drag<c:out value='${idx.count }'/>"  width="128" height="128">
	                        		</c:forEach>
	                        	
	                        </tr>
	                        </tbody>
	                    </table>
	                    
	                    <div class="btnSet"  style="text-align:right;">
                       		<a href="index.do" class="btn">목록으로</a>
                      		<input type="submit" class="btn" value="수정하기">
	                    </div>
                    </form>
                </div>
            </div>
        </div>
        
</body>
</html>