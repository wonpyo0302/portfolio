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
	
	<style type="text/css">
	</style>
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
	                                <input type="text" name="hotel_name" id="hotel_name" class="wid100" value="" />
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
	                                <input type="number" name="tel" id="tel" class="wid100" value=""/>
	                            </td>
	                        </tr>
		                        <tr>
		                           <tr>
		                            <th rowspan="2">*주소</th>
		                            <td>
		                                <input type="text" name="zipcode" id="zipcode" class="inNextBtn" style="float:left;" readonly>
		                                <span class="email_check"><a href="javascript:zipcode();"  class="btn bgGray" style="float:left; width:auto; clear:none;">우편번호</a></span>
		                            </td>
		                        </tr>
	                            <tr>
		                            <td>
		                            	<input type="text" name="addr" id="addr1" style="width:80%" readonly>
		                            </td>
	                            </tr>
	                            
	                        </tr>
	                        <tr>
	                            <th>*지역코드 입력</th>
	                            <td>
	                            	<select name='state_code' id="selectbox_state" onchange="optionChange()">
										<option value='1' label='시 / 도' selected></option>
										<option value='11' label='서울특별시'></option>
										<option value='21' label='부산광역시'></option>
										<option value='22' label='대구광역시'></option>
										<option value='23' label='인천광역시'></option>
										<option value='24' label='광주광역시'></option>
										<option value='25' label='대전광역시'></option>
										<option value='26' label='울산광역시'></option>
										<option value='29' label='세종특별자치시'></option>
										<option value='31' label='경기도'></option>
										<option value='32' label='강원도'></option>
										<option value='33' label='충청북도'></option>
										<option value='34' label='충청남도'></option>
										<option value='35' label='전라북도'></option>
										<option value='36' label='전라남도'></option>
										<option value='37' label='경상북도'></option>
										<option value='38' label='경상남도'></option>
										<option value='39' label='제주특별자치도'></option>
									</select>
									
									<select name='district_code' id="selectbox_district">
										<option value='2' label='시/군/구' selected></option>
									</select>
		                                  
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>호텔 공지 사항</th>
	                            <td>
	                                <textarea name="hotel_content" id="hotel_content" placeholder=""></textarea>
	                            </td>
	                        </tr>
	                        <tr>
	                        	<th>호텔 사진</th>
	                        	<td>
	                        		<input type="file" name="filename2" multiple>
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