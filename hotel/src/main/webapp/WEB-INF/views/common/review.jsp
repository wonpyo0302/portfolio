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
		right: 20px;
		top: 10px;
		font-size: 20px;
	}
	.outer-div{
		display: flex;
		justify-content: center;
		margin: 30px 0 30px 0;
	}
	#card-content{
		font-size: 15px;
		margin-top: 5%;
	
	}
	.content-box{
		border: 1px solid gray; 
		width: 100%; 
		height: 70px; 
		margin-top: 5px;
	}
	.btn-box{
		position: absolute;
		right: 5px;
		bottom: 10px;
	}
	.col-md-8-modi{
		display: none;
	}
	
</style>
</head>

<body>

<c:forEach var="rv" items="${rv.list }">
	
	
	<div class="outer-div">
	
		<div class="card mb-3" style="width: 540px; height: 270px; ">
				<div class="row g-0">
					<div class="col-md-4">
					<c:if test="${!empty rv.img.filename_real }">
						<img src="/hotel/upload/${rv.img.filename_real }" class="img-fluid rounded-start" alt="..." width="200px">
					</c:if>
					<c:if test="${empty rv.img.filename_real }">
						<img src="/hotel/image/hotel/ex_room.jpg" class="img-fluid rounded-start" alt="..." width="200px">
					</c:if>
					
					</div>
				
					<div class="col-md-8" id="${rv.review_no }">
						<div class="card-body">
							<h5 class="card-title"> ${rv.review_title }</h5>
							
							<div class="score">
								<img alt="평점 :" src="/hotel/image/mypage/star.png" width="30px"> ${rv.review_score }점
							</div>
							<div>
								호텔  ${rv.hotel_name }
							</div>
							
							<div class="content-box" >
								<p class="card-text" >
									<div id="card-content">
										<pre>${rv.review_content }</pre>
									</div>
								</p>
							</div>
							<p class="card-text">
								<small class="text-muted">
									작성일 &nbsp;<fmt:formatDate value="${rv.review_regdate }" pattern="yyyy-MM-dd"/>
								</small>
							</p>
							<div class="btn-box">
								<button class="btn" onclick="modi(${rv.review_no })" >수정</button>
								<button class="btn" onclick="del(${rv.review_no })">삭제</button>
							</div>
						</div>
					</div>
					<div id="html${rv.review_no }"> </div>
				</div>
			</div>
		</div>

	</c:forEach>

</body>
</html>