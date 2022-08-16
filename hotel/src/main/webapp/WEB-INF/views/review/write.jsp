<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="/WEB-INF/views/includes/G_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/hotel/css/reset.css"/>
<link rel="stylesheet" href="/hotel/css/contents.css"/>

</head>
<body>
<input type="hidden" name="reserv_no" value="${reviewVO.reserv_no }">
<input type="hidden" name="guest_no" value="${reviewVO.guest_no }">
<input type="hidden" name="hotel_no" value="${reviewVO.hotel_no }">
<input type="hidden" name="room_no" value="${reviewVO.room_no }">


        <div class="sub">
            <div class="size">
                <h3 class="sub_title">객실 등록</h3>
    
                <div class="bbs">
                	<form method="post" name="frm" id="frm" action="insert.do" enctype="multipart/form-data" > <!-- enctype="multipart/form-data" -->
	                    <table class="board_write">
	                        <tbody >
	                        <tr >
	                            <th >호텔명</th>
	                            <td>
	                            	${rev.hotel_name }
	                            </td>
	                            <th>객실</th><!-- 객실번호 -->
	                            <td>
	                            	${rev.number }
	                            </td>
	                        </tr>
	                        
	                        <tr>
	                            <th>투숙기간</th>
	                            <td colspan="3">
	                                ${rev.startdate } ~ ${rev.enddate }
	                            </td>
	                        </tr>
	                        
	                        <tr>
	                            <th>평점</th>
	                            <td colspan="3">
	                                <div class="form-floating">
									  <select class="form-select" id="floatingSelect" aria-label="Floating label select example">
									    <option selected>⭐점을 채워주세요</option>
									    <option value="1">⭐ 😱</option>
									    <option value="2">⭐⭐ 😨</option>
									    <option value="3">⭐⭐⭐ 😯</option>
									    <option value="4">⭐⭐⭐⭐ 😉</option>
									    <option value="5">⭐⭐⭐⭐⭐ 😆</option>
									  </select>
									  <label for="floatingSelect">평점</label>
									</div>
								</td>
	                        </tr>
	                     
	                        <tr>
	                            <th>나의 후기</th>
	                            <td colspan="3">
	                                <textarea name="review_content" id="review_content"></textarea>
	                            </td>
	                        </tr>
	                        <tr>
	                        	<th>첨부파일</th>
	                        	<td colspan="3">
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