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
    <title>예약내역</title>
    <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
</head>



<body>  
    <!-- room 정보  -->
            <div class="size">
                <h3 class="sub_title">객실 등록 신청</h3>
    
                <div class="bbs">
                    <table class="list">
                    <p><span><strong>총 ${data.totalCount}개</strong>  |  ${roomVO.page}/${data.totalPage}페이지</span></p>
                        <caption>my rooms</caption>
                        <colgroup>
                            <col width="*" />
                            <col width="300px" />
                            <col width="*" />
                            <col width="*" />
                            <col width="*" />
                            <col width="*" />
                            <col width="*" />
                        </colgroup>
                        <thead style="text-align:center;">
                            <tr>
                                <th>번호</th>
                                <th>예약일자</th>
                                <th>호텔</th>
                                <th>객실</th>
                                <th>결제금액</th>
                                <th>예약상태</th>
                                <th>이용상태</th>
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
		                                  ${row.startdate} ~ ${row.enddate }
		                                </td>
		                                
		                                <td class="txt_l">
		                                   ${row.hotel_name}
		                                </td>
		                                
		                                <td>
		                                	${row.number}
		                                </td>
		                                
		                                
		                                <td class="writer">
		                                    ${row.total_price}
		                                </td>
		                                <td >
		                                	<c:if test="${row.rev_status ==0 }">예약완료</c:if>
		                                	<c:if test="${row.rev_status ==1 }">예약취소</c:if>
		                                </td>
		                                
		                                <td>
			                                 <c:if test="${row.use_status == 0}">이용전</c:if>
			                                 <c:if test="${row.use_status == 1}">이용완료</c:if>
			                                 <c:if test="${row.use_status == 2}"></c:if>
		                                </td>
		                            </tr>
		                          
							</c:forEach>
					
							
						
                        </tbody>
                    </table>
                    
                    <div class="btnSet"  style="text-align:right;">
	                        <a class="btn" href="write.do"> 객실 등록 + </a>
                    </div>
                    
                    <!-- 페이지 처리 -->
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