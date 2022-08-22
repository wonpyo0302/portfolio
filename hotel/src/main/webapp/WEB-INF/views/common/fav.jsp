<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	
</style>


</head>
<body>
<img alt="" src="hotel/image/boardPic/impo.jpg">

	<div class="row row-cols-1 row-cols-md-4 g-4">
		<c:forEach var="vo" items="${fav.list }">
				<div class="col">
					<div class="card h-100">
					
						
						
						<c:forEach var="img" items="${vo.imageList }" end="0">
							<div>
								<div class="heart">
									<img class="like"  data-name="del" data-gno="${vo.guest_no}" data-hno="${vo.hotel_no}" src="/hotel/image/mypage/heart.png" width="40px" >
								</div>
								<div>
									<img src="/hotel/image/${img.filename_real }" class="card-img-top" alt="이미지 없음">
								</div>
							</div>
						</c:forEach>
						
						<c:if test="${empty vo.imageList }">
							<div>
								<div class="heart">
									<img class="like"  data-name="del" data-gno="${vo.guest_no}" data-hno="${vo.hotel_no}" src="/hotel/image/mypage/heart.png" width="40px" >
								</div>
								<div>
									<img src="/hotel/image/hotel/ex_room.jpg" class="card-img-top" alt="이미지 없음">
								</div>
							</div>
						</c:if>
						
						<div class="card-body">
							<span><h5 class="card-title"><strong>${vo.hotel_name }</strong></h5></span>
							<p class="card-text">리뷰 ${vo.totalReview }개</p>
							<p class="card-text">${vo.hotel_content }</p>
							<p class="card-text"><strong>주소</strong><br>${vo.addr }</p>
						</div>
					</div>
				</div>
			
		</c:forEach>
	</div>

</body>
</html>