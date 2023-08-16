<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>다들어줄개</title>

<meta content="" name="description">
<meta content="" name="keywords">

<!-- 이거 두개 script.js불러오는거........... -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>
<script src="/talkdog/resources/js/script.js"></script>


<!-- Favicons -->
<link href="/talkdog/assets/img/favicon.png" rel="icon">
<link href="/talkdog/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->

<!-- Vendor CSS Files -->
<link href="/talkdog/assets/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link href="/talkdog/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/talkdog/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="/talkdog/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="/talkdog/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="/talkdog/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/talkdog/assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Eterna
  * Updated: Jul 27 2023 with Bootstrap v5.3.1
  * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<!-- ======= Top Bar ======= -->
	<section id="topbar" class="d-flex align-items-center">
		<div
			class="container d-flex justify-content-center justify-content-md-between">
			<div class="contact-info d-flex align-items-center">
				<a href="/talkdog">HOME&nbsp;</a> <span> </span>
				<c:if test="${sessionScope.sid == null }">
					<a href="/talkdog/common/login.jsp">장바구니&nbsp;</a>
					<span> </span>
					<a href="/talkdog/common/login.jsp">마이페이지&nbsp;</a>
				</c:if>
				<c:if test="${sessionScope.sid != null }">
					<a href="/talkdog/Cart/CartList.do">장바구니&nbsp;</a>
					<span> </span>
					<c:if test="${sessionScope.sid != 'admin'}">
						<a href="/talkdog/mypage/memMypage.jsp">마이페이지&nbsp;</a>
					</c:if>
					<c:if test="${sessionScope.sid == 'admin'}">
						<a href="/talkdog/mypage/admAllList.jsp">마이페이지&nbsp;</a>
					</c:if>
				</c:if>
				<c:if test="${sessionScope.sid == 'admin'}">
					<a href="/talkdog/Cart/list.do?sid=${sid }"></a>
					<span> </span>
					<a href="#">상품관리&nbsp;</a>
					<span> </span>
					<a href="#">이용자관리&nbsp;</a>

				</c:if>
			</div>





			<c:if test="${sessionScope.sid == null }">
				<div class="social-links d-none d-md-flex align-items-center">

					<a href="/talkdog/common/login.jsp" class="login">로그인</a>
					<a href="/talkdog/common/join.jsp" class="regi">회원가입</a>
				</div>
			</c:if>

			<c:if test="${sessionScope.sid != null }">
				<li class="nav-item"><a class="nav-link" style="color: white;">[${sessionScope.sid}]님 환영합니다!</a>
				<li class="nav-item"><a class="nav-link" style="color: white;" onclick="logout();">로그아웃</a>
			</c:if>

		</div>
	</section>

	<!-- ======= Header ======= -->
	<header id="header" class="d-flex align-items-center">
		<div
			class="container d-flex justify-content-between align-items-center">

			<div class="logo">
				<h1>
					<a href="/talkdog/index.jsp">다들어줄개</a>
				</h1>
				<!-- Uncomment below if you prefer to use an image logo -->
				<!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
			</div>

			<nav id="navbar" class="navbar">
				<ul>
					<li><a href="#">자가진단</a></li>
					<li class="dropdown"><a href="#"><span>공지사항/이벤트</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="#">공지사항</a></li>
							<li><a href="#">이벤트</a></li>
						</ul></li>
					<li class="dropdown"><a href="#"><span>커뮤니티</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="#">전체</a></li>
							<li><a href="#">사랑(연애/이별/결혼/이혼)</a></li>
							<li><a href="#">정신건강</a></li>
							<li><a href="#">취업/학업</a></li>
							<li><a href="#">인간관계</a></li>
							<li><a href="#">기타</a></li>
						</ul></li>
					<li><a href="#">문의게시판</a></li>
					<li><a href="#">골라보시개🐶</a></li>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->

		</div>
	</header>
	<!-- End Header -->



</body>
</html>