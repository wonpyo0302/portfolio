<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<nav class="navbar bg-light fixed-top"
	style="background-color: pink !important">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">둘이놀까</a>

		<c:if test="${!empty loginInfo2}">
			<div style="width: 60%">
				<div style="text-align: right; width: 115%;">
					<a>${loginInfo2.host_name }님 환영합니다</a>
				</div>
			</div>
		</c:if>

		<button class="navbar-toggler" type="button"
			data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
			aria-controls="offcanvasNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
			<div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasNavbarLabel">
					<img src="/img/image_1.jpg" style="width: 100px; height: 100px;">
				</h5>

				<c:if test="${empty loginInfo2 }">
					<a href="/hotel/host/login.do">LOGIN</a>
				</c:if>

				<c:if test="${!empty loginInfo2 }">
					<a href="/hotel/host/logout.do">LOGOUT</a>
				</c:if>
				<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body">
				<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="/hotel/host/mypage.do">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link" href="#">예약내역</a></li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 고객센터 </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="/hotel/hostnotice/list.do">공지사항</a></li>
							<li><a class="dropdown-item" href="/hotel/hostfaq/view.do">FAQ</a></li>
							<li><a class="dropdown-item" href="/hotel/hostboard/list.do">QnA</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
				</ul>
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</div>
</nav>


