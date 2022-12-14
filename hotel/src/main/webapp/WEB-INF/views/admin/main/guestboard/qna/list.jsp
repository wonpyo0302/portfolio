<%@ page language="java"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/admin/include/headHtml.jsp" %>
<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
<meta name="format-detection" content="telephone=no, address=no, email=no">
<meta name="keywords" content="">
<meta name="description" content="">
<title>Q&A</title>
    <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
    
<script>

	function goWrite(){
		<c:if test="${empty loginInfo_admin}">
			alert('로그인 후 작성 가능합니다.');
			location.href='/hotel/admin/login.do';
		</c:if>
		<c:if test="${!empty loginInfo_admin}">
			location.href='write.do';
		</c:if>	
	}
</script>
<script>
	function login(){
		<c:if test="${empty loginInfo_admin}">
			alert('로그인 후 작성 가능합니다.');
		</c:if>
		
		<c:if test="${!empty loginInfo_admin}">
			location.href='list.do';
		</c:if>
	}
	
	//추후 적용 22_08_31 -JS 
	function select(){
		$.ajax ({
			url : "/hotel/admin/main/guestboard/qna/list.do",
			type : 'post',
			data : {
				stype :$("#select_type").val(),
				stype2 :$("#select_status").val()
			},
			success : function (res){
				console.log(res);
				$.each(res, function(idx, val) {
					console.log(val.gboard_title);
				});
				//$("#admin").html(str);
			}
		})
	}
</script>

</head>
<body>

 <div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>게스트 관리 ▶ Q&A ▶ 목록조회</h2>
				</div>
			</div>
	</div>
	<div class="sub">
		<div class="size">
			<div class="bbs">
				<table class="list">
					<div class="btnSet" style="text-align: right;">
						<a class="btn" href="list.do">관리 </a>
					</div>
					<div style="width:100%">
							<div style="float:left">
								<p>
									<span><strong>총 ${data.totalCount}개</strong> | ${guestBoardVO.page}/${data.totalPage}페이지</span> 
								</p>
							</div>
							<!-- 답변 여부별 정렬 시작 -->
							 <select id="select_status" name="select_status" title="검색분류 선택" style="float:right" onchange="select();">
								<option value="all">전체</option>
								<option value="0">답변대기</option>
								<option value="1">답변완료</option>
							</select>
						
							<!-- 문의유형별 정렬 시작 -->
							 <select id="select_type" name="select_type" title="검색분류 선택" style="float:right;  margin-right: 5px" onchange="select();">
								<option value="all">전체</option>
								<option value="1">예약</option>
								<option value="2">결제</option>
								<option value="3">숙소</option>
								<option value="4">포인트/쿠폰</option>
								<option value="5">이용/기타</option>
							</select>
							</div>
					</div>
					<!-- 정렬 끝-->
					<br>	<br>
					
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
					
					<tbody id="admin">
						<c:if test="${empty data}">
							<tr>
								<td class="first" colspan="8">등록된 글이 없습니다.</td>
							</tr>
						</c:if>
				
						<c:if test="${not empty data.list}">
							<c:forEach items="${data.list }" var="vo" varStatus="status">
									 <tr>
										<td>${data.totalCount - status.index - ((guestBoardVO.page - 1) * guestBoardVO.pageRow)}<!-- 계산식 = "총개수 - 인덱스 - (현재 페이지 번호 - 1) * 페이지당 개수" --></td>
										
										<c:if test="${vo.gboard_type == 1 }">
											<td>예약</td>
										</c:if>
										<c:if test="${vo.gboard_type == 2 }">
											<td>결제</td>
										</c:if>
										<c:if test="${vo.gboard_type == 3 }">
											<td>숙소</td>
										</c:if>
										<c:if test="${vo.gboard_type == 4 }">
											<td>포인트/쿠폰</td>
										</c:if>
										<c:if test="${vo.gboard_type == 5 }">
											<td>이용/기타</td>
										</c:if>
										<td class="txt_l">
										
										<a href="/hotel/admin/main/guestboard/qna/view.do?gboard_no=${vo.gboard_no}&stype=${param.stype}&sword=${param.sword}">${vo.gboard_title}
										<c:if test="${vo.diff <= 3 }">
										<img src="/hotel/image/boardPic/new (1).png" width="30px">
										</c:if>
										</a></td>								
										
										<td>${vo.gboard_viewcount}</td>
										
										<td class="writer">${vo.guest_name}</td>
										
										<td class="date"> <fmt:formatDate value="${vo.gboard_regdate}" pattern="yyyy-MM-dd"/></td>
										
										<c:if test="${vo.gboard_status == 0 }">
											<td style="color:red">[답변대기]</td>
										</c:if>	
										<c:if test="${vo.gboard_status == 1 }">
											<td style="color:blue">[답변완료]</td>
										</c:if>	
									</tr>
							</c:forEach>	
						</c:if>					
					</tbody>
				</table>
				
			
				<!-- 페이지처리 -->
				<div class="pagenate clear">
					<ul class='paging'>
					<!-- 이전페이지 -->
					<c:if test="${data.prev == true }">
						<li><a href="list.do?page=${data.startPage - 1 }&stype=${param.stype}&sword=${param.sword}"><</a></li>
					</c:if>
					<!-- 페이지별 -->
						<c:forEach var="p" begin="${data.startPage}" end="${data.endPage }">
							<li><a href='list.do?page=${p }&stype=${param.stype}&sword=${param.sword}'
								<c:if test="${guestBoardVO.page == p }"> class='current'
								</c:if>>${p }
								</a>
							</li>
						</c:forEach>
					<!-- 다음페이지 -->
					<c:if test="${data.next == true }">
						<li><a href="list.do?page=${data.endPage + 1 }&stype=${param.stype}&sword=${param.sword}">></a></li> 
					</c:if>
					</ul>
				</div>
			

				<!-- 검색처리 -->
				<div class="bbsSearch">
					<form method="get" name="searchForm" id="searchForm" action="">
						<span class="srchSelect"> <select id="stype" name="stype" class="dSelect" title="검색분류 선택">
								<option value="all">전체</option>
								<option value="gboard_title">제목</option>
								<option value="gboard_content">내용</option>
						</select>
						</span> 
						<span class="searchWord"> <input type="text" id="sword" name="sword" placeholder="검색어를 입력하세요." value="${param.sword }" title="검색어 입력"> 
						<input type="button" id="" value="검색" title="검색">
						</span>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


