<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		<div class="low">
			<c:forEach var="list" items="${hotelList }" varStatus="idx">
				<table class="container list" style="table-layout: fixed;">
					<tr>
						<td class="list_hotel" style="border: 1px;">
							<a href="">
								<span class="hotel_img"><img alt="이미지오류" src="/hotel/image/hotel/${list.filename}" width="200" height="200"></span>
								<span><p>${list.hotel_name}</p></span>
								<span>최저가:  ${list.lowPrice } ~</span>
							</a>
						</td>
					</tr>
					<tr>
						<td>${list.hotel_content}</td>
					</tr>
				</table>
			<c:if test="${idx.count % 2 == 0 && !idx.last}">
		</div>
		<div class="low">
			</c:if>
			</c:forEach>
		</div>
