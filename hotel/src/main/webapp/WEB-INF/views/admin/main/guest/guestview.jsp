<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/views/admin/include/headHtml.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
					<h2>게스트관리 - [상세보기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<form name="frm" id="frm"  method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
									<col class="w4" />
									<col class="w3" />
									<col class="w4" />
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">아이디</th>
										<th scope="col">이름</th> 
										<th scope="col">생일</th> 
										<th scope="col">이메일</th> 
										<th scope="col">전화번호</th> 
										<th scope="col">상세주소</th> 
										<th scope="col">상세주소</th> 
										<th scope="col">환불은행</th> 
										<th scope="col">환불계좌</th> 
										<th scope="col">보유포인트</th> 
										<th scope="col">가입일</th> 
									</tr>
								</thead>
								<tbody>
									<tr>	
										<td>${guestlist.guest_id}</td>
										<td>${guestlist.guest_name}</td>
										<td>${guestlist.guest_birth}</td>
										<td>${guestlist.guest_email}</td>
										<td>${guestlist.guest_hp}</td>
										<td>${guestlist.guest_addr1}</td>
										<td>${guestlist.guest_addr2}</td>
										<td>${guestlist.g_bank}</td>
										<td>${guestlist.g_accountno}</td>
										<td>${guestlist.totalpoint}</td>
										<td><fmt:formatDate value="${guestlist.g_joindate}" pattern="yyyy.MM.dd"/> </td>
									</tr>
								</tbody>
							</table>
							</form>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>