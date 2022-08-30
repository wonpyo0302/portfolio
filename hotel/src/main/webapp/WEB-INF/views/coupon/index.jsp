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


	<script type="text/javascript">
	
	
	</script>

<body style="padding: 0px 50px 0px 50px ;">
    
        <div class="sub">
            <div class="size">
                <h3 class="sub_title"></h3>
                <p class="sub_title">나의 보유쿠폰   ${coupon.totalCount }  장</p>
    
                <div class="bbs">
                    <table class="list">
                    <p><span><strong>총 ${coupon.totalCount}개</strong>  |  ${pointVO.page}/${point.totalPage}페이지</span></p>
                        <caption>게시판 목록</caption>
                        <colgroup>
                            <col width="80px" />
                            <col width="*" />
                            <col width="*" />
                        </colgroup>
                        <thead style="text-align:center;">
                            <tr>
                                <th>번호</th>
                                <th>유효기간</th>
                                <th>금액</th>
                            </tr>
                        </thead>
                        <tbody>
							
							<c:if test="${empty coupon.list}">
	                            <tr>
	                                <td class="first" colspan="5">보유한 쿠폰이 없습니다.</td>
	                            </tr>
							</c:if>
							
								
							<c:forEach items="${coupon.list}" var="row" varStatus="loop">
	                            <tr><!-- 글번호 총갯수 - 인덱스 -(현재페이지 번호 - 1)*페이지당 갯수///다시보자-->
	                                <td>
	                                	${coupon.totalCount - loop.index -(couponVO.page-1)*couponVO.pageRow}
	                                </td>
	                                
	                                <td>
	                                   <fmt:formatDate value="${row.expdate }" pattern="yyyy-MM-dd"/> 까지
	                                </td>
	                                
	                                <td>
	                                    ${row.coupon_price} 원
	                                </td>
	                                
	                                
	                            </tr>
							</c:forEach>
						
                        </tbody>
                    </table>
                     <div class="pagenate clear">
		               <ul class='paging'>
			               <c:if test="${coupon.prev ==true }">
			               		<li><a href ="index.do?page=${coupon.startPage-1}&stype=${param.stype}&sword=${param.sword}"><</a>
			               </c:if>
			               
			               	<c:forEach var="page" begin="${coupon.startPage}" end="${coupon.endPage}">
			               		<li><a href ='index.do?page=${page}&stype=${param.stype}&sword=${param.sword}' <c:if test="${couponVO.page == page}">class='current'</c:if>>${page}</a></li></a>
			               	</c:forEach>
			               	
			               	<c:if test="${coupon.next ==true }">
			               		<li><a href = "index.do?page=${coupon.endPage+1}&stype=${param.stype}&sword=${param.sword}">></a></li>
			               	</c:if>
		               </ul>
		            </div>
                
                    <!-- 페이지처리 -->
                    <!-- 검색을 넣어야 할거같다 -->
                </div>
            </div>
        </div>
        
</body>
</html>