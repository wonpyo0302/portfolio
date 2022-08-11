<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/includes/H_header.jsp" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>게시판목록</title>
    <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
</head>



<body>


	   <!-- hotel 정보  -->
        <div class="sub">
                   <div class="size">
                <h3 class="sub_title">호텔 등록 신청</h3>
    
                <div class="bbs">
                    <table class="list">
                        <caption>게시판 목록</caption>
                        <colgroup>
                            <col width="*" />
                            <col width="*" />
                            <col width="*" />
                            <col width="*" />
                        </colgroup>
                        <thead style="text-align:center;">
                            <tr>
                                <th>호텔명</th>
                                <th>사업주명</th>
                                <th>호텔주소</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
							
							<c:if test="${empty Hdata}">
	                            <tr>
	                                <td class="first" colspan="5">등록된 글이 없습니다.</td>
	                            </tr>
							</c:if>
							
								
	                            <tr>
	                                <td class="txt_l">
	                                   ${Hdata.hotel_name}
	                                   <input type="hidden" name="host_no" value="${loginInfo.host_no }">
	                                </td>
	                                
	                                <td>
	                                	${loginInfo.host_name } 
	                                </td>
	                                
	                                
	                                <td class="writer">
	                                    ${Hdata.addr}
	                                </td>
	                                
	                                <td class="date">
	                               
	                                </td><!-- 시간 포멧 -->
	                                
	                                <td>
	                                	<strong><a href="../myhotel/view.do?hotel_no=${Hdata.hotel_no}" onmouseover=""> [상세보기] </a></strong> <br>
	                                	<strong><a href="../myhotel/edit.do?hotel_no=${Hdata.hotel_no}"> [수정하기] </a></strong>
	                                </td>
	                            </tr>
	                            
						
					
							
						
                        </tbody>
                    </table>
                    <!-- host 1명당 hotel 1개, hotel 정보가 있으면 버튼이 안보임 -->
                </div>
                    <div class="btnSet"  style="text-align:right;">
                    <c:if test="${empty Hdata}">
	                        <a class="btn" href="../myhotel/write.do"> 호텔 등록 + </a>
                    </c:if>
                    </div>
            </div>
            
            
            
    <!-- room 정보  -->
            <div class="size">
                <h3 class="sub_title">객실 등록 신청</h3>
    
                <div class="bbs">
                    <table class="list">
                    <p><span><strong>총 ${data.totalCount}개</strong>  |  ${roomVO.page}/${data.totalPage}페이지</span></p>
                        <caption>게시판 목록</caption>
                        <colgroup>
                            <col width="*" />
                            <col width="*" />
                            <col width="*" />
                            <col width="*" />
                            <col width="*" />
                        </colgroup>
                        <thead style="text-align:center;">
                            <tr>
                                <th>번호</th>
                                <th>객실명 | 객실번호</th>
                                <th>수용 인원</th>
                                <th>객실 가격</th>
                                <th>체크인/아웃</th>
                            </tr>
                        </thead>
                        <tbody>
							
							<c:if test="${empty data.list}">
	                            <tr>
	                                <td class="first" colspan="5">등록된 글이 없습니다.</td>
	                            </tr>
							</c:if>
							
								
							<c:forEach items="${data.list}" var="row" varStatus="loop">
							
	                            <tr><!-- 글번호 총갯수 - 인덱스 -(현재페이지 번호 - 1)*페이지당 갯수///다시보자-->
	                                <td>
	                                	${data.totalCount - loop.index -(roomVO.page-1)*roomVO.pageRow}
	                                </td>
	                                
	                                <td class="txt_l">
	                                   ${row.room_name} | ${row.number}
	                                </td>
	                                
	                                <td>
	                                	2 명 
	                                </td>
	                                
	                                
	                                <td class="writer">
	                                    ${row.room_price}
	                                </td>
	                                <td class="date">
	                                	13:00 / 11:00
	                                </td><!-- 시간 포멧 -->
	                                
	                                <td>
	                                	<strong><a href="view.do?room_no=${row.room_no}" onmouseover=""> [상세보기] </a></strong> <br>
	                                	<strong><a href="edit.do?room_no=${row.room_no}"> [수정하기] </a></strong>
	                                </td>
	                            </tr>
	                            
							</c:forEach>
					
							
						
                        </tbody>
                    </table>
                    <!-- 로그인한 사람만 글쓰기 버튼을 눌를 수 있도록 -->
                    
                    <div class="btnSet"  style="text-align:right;">
	                        <a class="btn" href="write.do"> 객실 등록 + </a>
                    </div>
                    
                     <div class="pagenate clear">
		               <ul class='paging'>
			               <c:if test="${data.prev ==true }">
			               		<li><a href ="index.do?page=${data.startPage-1}&stype=${param.stype}&sword=${param.sword}"><</a>
			               </c:if>
			               
			               	<c:forEach var="page" begin="${data.startPage}" end="${data.endPage}">
			               		<li><a href ='index.do?page=${page}&stype=${param.stype}&sword=${param.sword}' <c:if test="${roomVO.page == page}">class='current'</c:if>>${page}</a></li></a>
			               	</c:forEach>
			               	
			               	<c:if test="${data.next ==true }">
			               		<li><a href = "index.do?page=${data.endPage+1}&stype=${param.stype}&sword=${param.sword}">></a></li>
			               	</c:if>
		               </ul>
		            </div>
                
                    <!-- 페이지처리 -->
                    
                 
                </div>
            </div>
        </div>
        
</body>
</html>