<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* 다들어줄개 로고 크기 수정 */
  .large-image {
  		margin-bottom : 0px;
  		margin-top: 15px;
        width: 120px;
        height: 120px; 
    }
</style>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>다들어줄개</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="/market/resources/js/script.js"></script>
</head>

<body>

  <!-- ======= Top Bar ======= -->
  <section id="topbar" class="d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between">
      <div class="contact-info d-flex align-items-center">
         <a href="#">HOME</a>
         <span>　　　</span>
        <a href="#">마이페이지</a>
        <span>　　　</span>
        <a href="#">장바구니</a>
      </div>
      <div class="social-links d-none d-md-flex align-items-center">
        
        <a href="#" class="instagram">로그인</a>
        <a href="#" class="linkedin">회원가입</a>
      </div>
    </div>
  </section>

  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex justify-content-between align-items-center">

<div>
	<h1>
		<!-- 다들어줄개 로고 -->
		<!-- index, 문의게시판 등 모든 곳에서 보여주기 위해 웹서버 주소 사용  -->
		<a href="/talkdog"><img src="https://github.com/kdonghwi99/SecondTeamProject/blob/main/webapp/resources/talkdog.png?raw=true" alt="" class="img-fluid large-image"></a>
	</h1>
	<!-- Uncomment below if you prefer to use an image logo -->
	<!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
</div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="#">자가진단</a></li>
          <li class="dropdown"><a href="#"><span>공지사항/이벤트</span> <i class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="/talkdog/Notice/NoticeList.do?pageNum=1&type=&keyword=&category=공지사항">공지사항</a></li>
              			<li><a href="/talkdog/Notice/NoticeList.do?pageNum=1&type=&keyword=&category=이벤트">이벤트</a></li>
					</ul></li>
		   <li class="dropdown"><a href="#"><span>커뮤니티</span> <i class="bi bi-chevron-down"></i></a>
					<ul>
					    <li><a href="/talkdog/Comm/CommListAll.do?pageNum=1&type=&keyword=&catNo=0">전체</a></li>
              			<li><a href="/talkdog/Comm/CommListAll.do?pageNum=1&type=&keyword=&catNo=1">사랑(연애/이별/결혼/이혼)</a></li>
              			<li><a href="/talkdog/Comm/CommListAll.do?pageNum=1&type=&keyword=&catNo=2">정신건강</a></li>
              			<li><a href="/talkdog/Comm/CommListAll.do?pageNum=1&type=&keyword=&catNo=3">취업/학업</a></li>
              			<li><a href="/talkdog/Comm/CommListAll.do?pageNum=1&type=&keyword=&catNo=4">인간관계</a></li>
              			<li><a href="/talkdog/Comm/CommListAll.do?pageNum=1&type=&keyword=&catNo=5">기타</a></li>
              			<li><a href="/talkdog/Comm/CommList.do?pageNum=1&type=&keyword=&catNo=0&sid=${sessionScope.sid }">내글보기</a></li>
              			<li><a href="/talkdog/Comm/CmreList.do?pageNum=1&type=&keyword=&catNo=0&sid=${sessionScope.sid }">내댓글보기</a></li>
					</ul></li>
          <li><a href="/talkdog/Qna.do?pageNum=1&type=&keyword=">문의게시판</a></li>
          <a class="nav-link" href="/market/BoardList.do?pageNum=1&type=&keyword=">게시판</a></li>
          <li><a href="#">골라보시개🐶</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
  </body>
</html>
