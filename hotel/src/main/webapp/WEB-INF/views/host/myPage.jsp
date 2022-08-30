<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>HOST MYPAGE</title>
    <link rel="stylesheet" href="/hotel/css/host_mypage.css"/>
    <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/includes/H_header.jsp" %>
<th> <a href="myinfo.do">내정보관리</a></th>
		<div class="sub">
			<div class="size" style="padding-bottom: 50px;">
				<h1 class="sub_title">마이페이지<br>HOST</h1>
					<table>
						<tbody>
							<tr class="tr-head" >
								<th colspan="2">
									<div class="user-name">${loginInfo2.host_name } 님</div>
									<div class="user-email">${loginInfo2.host_email }</div>
									<div class="d-grid gap-2 col-3 mx-auto">
									  <button class="btn btn-warning" type="button" onclick="location.href='myinfo.do'">
									  	<img src="/hotel/image/mypage/confidential.png" width="50px;">
									  	호스트 정보 관리
									  </button>
									</div>
								</th>
							</tr>
							
							<tr class="tr-head-test" >
								<th>
									<div onclick="location.href='myinfo.do'">호스트 정보 관리</div>
									<div onclick="location.href='../host/sales.do'">매출 현황</div>
									<div onclick="location.href='../hostReserve/index.do'">예약 현황</div>
									<div onclick="location.href='../host_review/index.do'">리뷰 현황</div>
								</th>
								<td>
									<button onclick="location.href='../host_review/index.do'">평점/리뷰<br><p>${map.avgScore }점 / ${map.totalReview }개</p></button>
									<button onclick="location.href='../host/sales.do'">당일 매출<br><p>￦ <fmt:formatNumber pattern="#,###" value="${map.today_sale }"/></p></button><br>
									<button onclick="location.href='../room/index.do'">등록된 객실 현황<br><p>${room_count } 개</p></button>
									<button onclick="location.href='../hostReserve/index.do'">예약현황<br><p>${map.reserve_count } 개</p></button>
								</td>
							</tr>
							
						</tbody>
					</table>
		
				<!-- 공지사항 -->
				<div class="" style=" border:2px solid gray; margin-top: 50px; padding:30px;  ">
					<div  style="text-align: center;">
					<h3><strong> 공지사항 </strong></h3>
					</div>
					
					<table class="">
							<caption>게시판 목록</caption>
							<colgroup>
								<col width="50px" />
								<col width="*" />
								<col width="100px" />
								
							</colgroup>
							<thead style="text-align: center">
								<tr>
									<th> </th>
									<th>제목</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody style="font-size: 25px;">
			
								<c:if test="${empty map2}">
									<tr>
										<td class="first" colspan="8">등록된 글이 없습니다.</td>
									</tr>
								</c:if>
			
								<c:if test="${not empty map2.list}">
									<c:forEach items="${map2.list }" var="vo" varStatus="status">
										<c:if test="${vo.fix == 1}">
											<tr style="background-color: pink" style="font-weight" :bold" >
												<td><!-- 계산식 = "총개수 - 인덱스 - (현재 페이지 번호 - 1) * 페이지당 개수" --></td>
												<td class="txt_l"><a
													href="/hotel/hostnotice/view.do?hnotice_no=${vo.hnotice_no}&stype=${param.stype}&sword=${param.sword}">
												 <b> <c:if test="${vo.hnotice_type == 1 }">
													[안내] ${vo.hnotice_title} 
												</c:if> <c:if test="${vo.hnotice_type == 2 }">
													[공지] ${vo.hnotice_title} 
												</c:if> <c:if test="${vo.hnotice_type == 3 }">
													[이벤트] ${vo.hnotice_title} 
												</c:if> <c:if test="${vo.hnotice_type == 4 }">
													[발표] ${vo.hnotice_title} 
												</c:if>
													</b><img src="/hotel/image/boardPic/new (1).png" width="30px">
												</a></td>
				
												<td class="date"><fmt:formatDate
														value="${vo.hnotice_regdate}" pattern="yyyy-MM-dd" /></td>
												
			
											</tr>
										</c:if>
										<c:if test="${vo.fix != 1}">
											<tr>
												<td><!-- 계산식 = "총개수 - 인덱스 - (현재 페이지 번호 - 1) * 페이지당 개수" --></td>
												<td class="txt_l">
												<a	href="/hotel/hostnotice/view.do?hnotice_no=${vo.hnotice_no}&stype=${param.stype}&sword=${param.sword}">
												 <c:if test="${vo.hnotice_type == 1 }">
													[안내] ${vo.hnotice_title} 
												</c:if> 
												<c:if test="${vo.hnotice_type == 2 }">
													[공지] ${vo.hnotice_title} 
												</c:if> 
												<c:if test="${vo.hnotice_type == 3 }">
													[이벤트] ${vo.hnotice_title} 
												</c:if> 
												<c:if test="${vo.hnotice_type == 4 }">
													[발표] ${vo.hnotice_title} 
												</c:if>
												<c:if test="${vo.diff <= 3 }">
													<img src="/hotel/image/boardPic/new (1).png" width="30px">
												</c:if>
													
												</a>
												</td>
												<td class="date"><fmt:formatDate value="${vo.hnotice_regdate}" pattern="yyyy-MM-dd" /></td>
												
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
							</tbody>
					</table>
				</div>
				<!-- END_공지사항 -->
			
				<!-- 내가 남긴 문의글 -->
				<div style=" border:2px solid gray; margin-top: 50px; padding:30px;">
					
					
					<div  style="text-align: center;">
						<h3><strong>내가 남긴 문의글</strong></h3>
					</div>
					<table class="list">
								<caption>게시판 목록</caption>
								<colgroup>
									
									<col width="150px" />
									<col width="*" />
									<col width="150px" />
									<col width="100px" />
								</colgroup>
								<thead style="text-align:center">
									<tr>
										
										<th>문의유형</th>
										<th>제목</th>
										<th>작성일</th>
										<th>답변상태</th>
									</tr>
								</thead>
										<tbody>
									
									<c:if test="${empty map3}">
										<tr>
											<td class="first" colspan="8">등록된 글이 없습니다.</td>
										</tr>
									</c:if>
									
									<c:if test="${not empty map3.list}">
										<c:forEach items="${map3.list }" var="vo" varStatus="status">
												 <tr>
													
													<c:if test="${vo.hboard_type == 6 }">
														<td>입점</td>
													</c:if>
													<c:if test="${vo.hboard_type == 7 }">
														<td>광고/제휴</td>
													</c:if>
													<c:if test="${vo.hboard_type == 8 }">
														<td>이용회원</td>
													</c:if>
													<c:if test="${vo.hboard_type == 9 }">
														<td>이용/기타</td>
													</c:if>
												
													<td class="txt_l">
													
													<a href="/hotel/hostboard/view.do?hboard_no=${vo.hboard_no}&host_no=${vo.host_no}&host_name=${loginInfo2.host_name}&stype=${param.stype}&sword=${param.sword}">${vo.hboard_title}								
													<c:if test="${vo.diff <= 3 }">
														<img src="/hotel/image/boardPic/new (1).png" width="30px">
													</c:if>
													</a></td>
													
													
													<td class="date"> <fmt:formatDate value="${vo.hboard_regdate}" pattern="yyyy-MM-dd"/></td>
													
													<c:if test="${vo.hboard_status == 0 }">
														<td>[답변대기]</td>
													</c:if>	
													<c:if test="${vo.hboard_status == 1 }">
														<td>[답변완료]</td>
													</c:if>	
												</tr>
										</c:forEach>	
									</c:if>					
								</tbody>
							</table>
				</div>
				<!-- END_ 내가 남긴 문의글 -->
				
			</div>
		</div>
</body>
</html>