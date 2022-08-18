<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script>
function cancel(imp){
	console.log(imp);
	$.ajax({
		url : "cancel.do",
		type: "post",
		data : {imp_uid : imp,
				guest_no : ${loginInfo.guest_no},
				totalpoint : ${loginInfo.totalpoint}
		},
		success : function(res){
			console.log(res);
			if(res.substring(8,9) !=0){
				alert("실패했습니다.")
			}
			else{
				alert("성공했습니다.");
			}
		}
	});
}
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>예약일</th>
			<th>호텔이름</th>
			<th>룸이름</th>
			<th>결제금액</th>
			<th>이용상태</th>
		</tr>
		<tr>
			<c:forEach var="data" items="${list}">
				<tr>
					<td><fmt:formatDate value="${data.rev_date}" pattern="yyyy-MM-dd" /></td>
					<td>${data.hotel_name}</td>
					<td>${data.room_name}</td>
					<td>${data.total_price}</td>
					<td>
						<c:if test="${data.use_status == 0}"> 
							이용전  <input type="button" onclick="cancel('${data.imp_uid}');" value="예약취소">
						</c:if>
						<c:if test="${data.use_status == 1}"> 이용완료  <input type="button" onclick="review()" value="리뷰작성"> </c:if>
						<c:if test="${data.use_status == 2}"> 규정위반(취소) </c:if>
					</td>
				</tr>
			</c:forEach>
		</tr>
	</table>
</body>
</html>