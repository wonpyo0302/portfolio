<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/includes/header.jsp" %>

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
<script>
	function goWrite(){
		<c:if test="${empty loginInfo}">
			alert('로그인 후 작성 가능합니다.');
		</c:if>
		<c:if test="${!empty loginInfo}">
			location.href='write.do';
		</c:if>	
	}
</script>

</head>
<body>
	<div class="sub">
		<div class="size">
			<h3 class="sub_title">게시판</h3>
			<div class="bbs">
				<table class="list">
					<p>
						<span><strong>총 ${data.totalCount}개</strong> | ${GuestBoardVO.page}/${data.totalPage}페이지</span> 
					</p>
					<caption>게시판 목록</caption>
					<colgroup>
						<col width="80px" />
						<col width="150px" />
						<col width="*" />
						<col width="80px" />
						<col width="150px" />
						<col width="150px" />
						<col width="100px" />
					</colgroup>
					<thead style="text-align:center">
						<tr>
							<th>번호</th>
							<th>문의유형</th>
							<th>제목</th>
							<th>조회수</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변상태</th>
						</tr>
					</thead>
			
				</table>
				<div class="btnSet" style="text-align: right;">
				
					<a class="btn" href="javascript:goWrite();">글작성 </a>
					
				</div>
				<div class="pagenate clear">
					<ul class='paging'>
					<!-- 이전페이지 -->
					<c:if test="${data.prev == true }">
						<li><a href="list.do?page=${data.startPage - 1 }&stype=${param.stype}&sword=${param.sword}"><</a></li>
					</c:if>
					<!-- 페이지별 -->
						<c:forEach var="p" begin="${data.startPage}" end="${data.endPage }">
							<li><a href='list.do?page=${p }' <c:if test="${guestBoardVO.page == p }"> class='current'</c:if>>${p }</a></li>
						</c:forEach>
					<!-- 다음페이지 -->
					<c:if test="${data.next == true }">
						<li><a href="list.do?page=${data.endPage + 1 }&stype=${param.stype}&sword=${param.sword}">></a></li> 
					</c:if>
					</ul>
				</div>

				<!-- 페이지처리 -->
				<div class="bbsSearch">
					<form method="get" name="searchForm" id="searchForm" action="">
						<span class="srchSelect"> <select id="stype" name="stype" class="dSelect" title="검색분류 선택">
								<option value="all">전체</option>
								<option value="title">제목</option>
								<option value="contents">내용</option>
						</select>
						</span> 
						<span class="searchWord"> <input type="text" id="sword" name="sword" value="" title="검색어 입력"> 
						<input type="button" id="" value="검색" title="검색">
						</span>
					</form>

				</div>
			</div>
		</div>
	</div>
					

</body>
</html>


