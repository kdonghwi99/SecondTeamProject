<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>다들어줄개</title>
  <script src="/talkdog/resources/js/script.js"></script>
 
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/talkdog/assets/img/favicon.png" rel="icon">
  <link href="/talkdog/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->

  <!-- Vendor CSS Files -->
  <link href="/talkdog/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="/talkdog/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/talkdog/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/talkdog/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/talkdog/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/talkdog/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

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

      <div class="logo">
        <h1><a href="/talkdog/index.html">다들어줄개</a></h1>
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
            </ul>
          </li>
          <li class="dropdown"><a href="#"><span>커뮤니티</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/community/commList.jsp">전체</a></li>
              <li><a href="#">사랑(연애/이별/결혼/이혼)</a></li>
              <li><a href="#">정신건강</a></li>
              <li><a href="#">취업/학업</a></li>
              <li><a href="#">인간관계</a></li>
              <li><a href="#">기타</a></li>
            </ul>
          </li>
          <li><a href="#">문의게시판</a></li>
          <li><a href="#">골라보시개🐶</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
  </body>
</html>