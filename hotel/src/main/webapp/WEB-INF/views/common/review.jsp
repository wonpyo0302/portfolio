<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Hotel Reivews</title>
    <link rel="stylesheet" href="/css/reset.css"/>
    <link rel="stylesheet" href="/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
	.score{
		position: absolute;
		right: 10px;
		top: 10px;
		font-size: 30px;
	}
</style>
</head>

<body>

<c:forEach var="rv" items="${rv.list }">
	${rv.guest_no }
	${rv.review_title }
	${rv.img.filename_real }
	
	<div class="card mb-3" style="max-width: 540px;">
			<div class="row g-0">
				<div class="col-md-4">
					<img src="/hotel/image/hotel/ex_room.jpg" class="img-fluid rounded-start" alt="..." width="170px">
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<h5 class="card-title">${rv.review_title }</h5>
						
						<div class="score">평점 : ${rv.review_score }점</div>
						
						<div style="border: 1px solid red; width: 90%; height: 70px; margin-top: 20px;">
						<p class="card-text"><pre>${rv.review_content }</pre></p>
						</div>
						<p class="card-text">
							<small class="text-muted">
								작성일 &nbsp;<fmt:formatDate value="${rv.review_regdate }" pattern="yyyy-MM-dd"/>
							</small>
						</p>
					</div>
				</div>
			</div>
		</div>


	</c:forEach>

</body>
</html>