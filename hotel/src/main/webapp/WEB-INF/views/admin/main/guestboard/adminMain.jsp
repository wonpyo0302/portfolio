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
							<p><span><strong>총 개</strong>  |  1/1페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w1" />
									<col class="w2" />
									<col class="w2" />
									<col class="w2" />
									<col class="w3" />
									<col class="w3" />
								</colgroup>
								<thead>
									<tr>
										
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">번호</th>
										<th scope="col">아이디</th> 
										<th scope="col">이름</th> 
										<th scope="col">생일</th>
										<th scope="col">전화번호</th> 
									</tr>
								</thead>
								<tbody>
								<c:forEach var="list" items="${data.list }">
									<tr>	
										<td class="first"><input type="checkbox" name="no" id="no" value=""/></td>
										<td>1</td>
										<td>${list.guest_id}</td>
										<td>${list.guest_name}</td>
										<td>${list.guest_birth}</td>
										<td>${list.guest_hp}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="#" onclick=""><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="write.do"><strong>등록</strong> </a>
								</div>
							</div>
							
							<!--//btn-->
							<!-- 페이징 처리 -->
							<div class="page">
								<ul class='paging'>
								<!-- 이전페이지 -->
								<c:if test="${data.prev == true }">
									<li><a href="login.do?page=${data.startPage - 1 }&stype=${param.stype}&sword=${param.sword}"><</a></li>
								</c:if>
								<!-- 페이지별 -->
									<c:forEach var="p" begin="${data.startPage}" end="${data.endPage }">
										<li><a href='login.do?page=${p }' <c:if test="${guestBoardVO.page == p }"> class='current'</c:if>>${p }</a></li>
									</c:forEach>
								<!-- 다음페이지 -->
								<c:if test="${data.next == true }">
									<li><a href="login.do?page=${data.endPage + 1 }&stype=${param.stype}&sword=${param.sword}">></a></li> 
								</c:if>
								</ul>
							</div>
							<!-- 페이지처리 -->
							<form name="searchForm" id="searchForm" action="index.do"  method="post">
								<div class="search">
									<select name="stype" title="검색을 선택해주세요">
										<option value="all">전체</option>
										<option value="title">제목</option>
										<option value="contents">내용</option>
									</select>
									<input type="text" name="sword" value="" title="검색할 내용을 입력해주세요" />
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