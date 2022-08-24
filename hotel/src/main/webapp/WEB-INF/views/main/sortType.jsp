<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<div class="low" style="display: inline-block; width: 650px;">
		<c:forEach var="list" items="${hotelList }" varStatus="idx">
			<div class="container list" style="table-layout: fixed; float: left; width: 300px;">
				<div>
					<div class="list_hotel" style="border: 1px;">
						<a href="/hotel/main/hotelView.do">
							<div class="hotel_img"><img alt="이미지오류" src="/hotel/image/hotel/${list.filename}" width="200" height="200"></div>
							<div>
							<!-- <div id="v-line"></div> -->
							<span><p>${list.hotel_name}</p></span>
							<span>최저가:  <fmt:formatNumber value="${list.lowPrice }" pattern="#,###"/> ~</span><br>
							<span>평점: ${list.avgScore}</span><br>
							<span>리뷰 수: ${list.totalReview}</span><br>
							<span>좋아요 수: ${list.totalLike}</span>
							</div>
						</a>
					</div>
				</div>
				<div>
					<div>${list.hotel_content}</div>
				</div>
			</div>
		<c:if test="${idx.count % 2 == 0 && !idx.last}">
		</div>
		<div class="low" style="display: inline-block; width: 650px;">
		</c:if>
		</c:forEach>
	</div>