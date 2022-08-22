<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/views/admin/include/headHtml.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<script>

</script>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>게스트관리 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${hostList.totalCount}개</strong>  |  ${adminVO.page }/${hostList.totalPage }페이지</span></p>
							<form name="frm" id="frm"  method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">아이디</th> 
										<th scope="col">이름</th> 
										<th scope="col">생일</th>
										<th scope="col">전화번호</th> 
									</tr>
								</thead>
								<tbody>
								<c:forEach var="list" items="${host }" varStatus="status">
									<tr>	
										<td>${hostList.totalCount - status.index - ((adminVO.page - 1) * adminVO.pageRow)}</td>
										<td>${list.host_id}</td>
										<td>${list.host_name}</td>
										<td>${list.host_birth}</td>
										<td>${list.host_hp}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							</form>
							
							<!--//btn-->
							<!-- 페이징 처리 -->
							<div class="page">
								<!-- 이전페이지 -->
								<c:if test="${hostList.prev == true }">
									<a href="hostList.do?page=${hostList.startPage - 1 }&stype=${param.stype}&sword=${param.sword}"><</a>
								</c:if>
								<!-- 페이지별 -->
									<c:forEach var="p" begin="${hostList.startPage}" end="${hostList.endPage }">
										<a href='hostList.do?page=${p }' <c:if test="${hostBoardVO.page == p }"> class='current'</c:if>>${p }</a>
									</c:forEach>
								<!-- 다음페이지 -->
								<c:if test="${hostList.next == true }">
									<a href="hostList.do?page=${hostList.endPage + 1 }&stype=${param.stype}&sword=${param.sword}">></a>
								</c:if>
							</div>
							<!-- 페이지처리 -->
							<form name="searchForm" id="searchForm" action="hostList.do"  method="get">
								<div class="search">
									<select name="stype" title="검색을 선택해주세요">
										<option value="all">아이디 검색</option>
									</select>
									<input type="text" id="sword" name="sword" value="" title="검색할 내용을 입력해주세요" />
									<input type="image" src="<%=request.getContextPath()%>/image/admin/btn_search.gif" class="sbtn" alt="검색" />
								</div>
							</form>
							<!-- //search --> 
						</div>
						<!-- //blist -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->

</body>
</html>