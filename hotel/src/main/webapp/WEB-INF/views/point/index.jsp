<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>포인트 사용 내역</title>
    <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
</head>

<body>
    
        <div class="sub">
            <div class="size">
                <h3 class="sub_title"></h3>
                <p class="sub_title">MY POINT :  <fmt:formatNumber value="${totalpoint }" pattern="#,###"></fmt:formatNumber>P</p>
    
                <div class="bbs">
                    <table class="list">
                    <p><span><strong>총 ${point.totalCount}개</strong>  |  ${pointVO.page}/${point.totalPage}페이지</span></p>
                        <caption>게시판 목록</caption>
                        <colgroup>
                            <col width="80px" />
                            <col width="*" />
                            <col width="*" />
                            <col width="*" />
                        </colgroup>
                        <thead style="text-align:center;">
                            <tr>
                                <th>번호</th>
                                <th>사용일</th>
                                <th>사용처</th>
                                <th>사용포인트</th>
                            </tr>
                        </thead>
                        <tbody>
							
							<c:if test="${empty point.list}">
	                            <tr>
	                                <td class="first" colspan="5">포인트 내역이 없습니다.</td>
	                            </tr>
							</c:if>
							
								
							<c:forEach items="${point.list}" var="row" varStatus="loop">
	                            <tr><!-- 글번호 총갯수 - 인덱스 -(현재페이지 번호 - 1)*페이지당 갯수///다시보자-->
	                                <td>${point.totalCount - loop.index -(pointVO.page-1)*pointVO.pageRow}</td>
	                                
	                                <td>
	                                   <fmt:formatDate value="${row.date }" pattern="yyyy-MM-dd"/><!-- 시간 포멧 -->
	                                </td>
	                                
	                                <td>
	                                    ${row.hotel_name}
	                                </td>
	                                
	                                <td>
	                                   <c:if test="${row.pointtype==1 }">
	                                    -${row.io_point}
	                                   </c:if> 
	                                   <c:if test="${row.pointtype==0 }">
	                                    +${row.io_point}
	                                   </c:if> 
	                                  
	                                </td>
	                                
	                            </tr>
							</c:forEach>
					
							
						
                        </tbody>
                    </table>
               
                     <div class="pagenate clear">
		               <ul class='paging'>
			               <c:if test="${point.prev ==true }">
			               		<li><a href ="/hotel/point/index.do?page=${point.startPage-1}&stype=${param.stype}&sword=${param.sword}"><</a>
			               </c:if>
			               
			               	<c:forEach var="page" begin="${point.startPage}" end="${point.endPage}">
			               		<li><a href ='/hotel/point/list.do?page=${page}&stype=${param.stype}&sword=${param.sword}' <c:if test="${pointVO.page == page}">class='current'</c:if>>${page}</a></li></a>
			               	</c:forEach>
			               	
			               	<c:if test="${point.next ==true }">
			               		<li><a href = "/hotel/point/index.do?page=${point.endPage+1}&stype=${param.stype}&sword=${param.sword}">></a></li>
			               	</c:if>
		               </ul>
		            </div>
                
                </div>
            </div>
        </div>
        
</body>
</html>