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
    <title>게시판 등록</title>
    <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script type="text/javascript">
    function goSave(){
    	frm.submit();
    }

  
    </script>

	<style type="text/css">
	

	</style>
</head>
<body>
    
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">객실 등록</h3>
    
                <div class="bbs">
                	<form method="post" name="frm" id="frm" action="insert.do" enctype="multipart/form-data" > <!-- enctype="multipart/form-data" -->
	                   <%--  <input type="hidden" name = "memberno" value="${loginInfo.no }"/> --%>
	                    <table class="board_write">
	                        <tbody>
	                        <tr>
	                            <th>객실명</th>
	                            <td>
	                                <input type="text" name="room_name" id="room_name" class="wid100" value=""/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>객실 번호</th>
	                            <td>
	                                <input type="number" name="number" id="number" class="wid100" value=""/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>객실 가격</th>
	                            <td>
	                                <input type="number" step='10000' name="room_price" id="room_price" class="wid100" value=""/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>수용인원(demo)</th>
	                            <td>
	                                <select name='people'>
										<option value=''selected>-- 선택 --</option>
										<option value='1' label='1명'></option>
										<option value='2' label='2명'></option>
										<option value='3' label='3명'></option>
									</select>
								</td>
	                        </tr>
	                        <tr>
	                            <th>편의시설 & 서비스(demo)</th>
	                            <td>
		                             <lable><input type="checkbox" name="comfors" value="gym" > GYM |&nbsp; </lable>
		                             <lable><input type="checkbox" name="comfors" value="parking" > 주차장 |&nbsp; </lable>
		                             <lable><input type="checkbox" name="comfors" value="cvs" > 편의점 |&nbsp;  </lable>
		                             <lable><input type="checkbox" name="comfors" value="wifi" > WIFI |&nbsp; </lable>
		                             <lable><input type="checkbox" name="comfors" value="roomservice" > 룸서비스&nbsp; </lable>          
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>객실 상세</th>
	                            <td>
	                                <textarea name="room_content" id="room_content"></textarea>
	                            </td>
	                        </tr>
	                        <tr>
	                        	<th>첨부파일</th>
	                        	<td>
	                        		<input type="file" name="filename" multiple>
	                        		
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