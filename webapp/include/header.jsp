<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* 다들어줄개 로고 크기 수정 */
  .large-image {
        margin-bottom : 0px;
        margin-top: 15px;
        width: 60px;
        height: 60px; 
    }
</style>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>다들어줄개</title>
<meta content="" name="description">
<meta content="" name="keywords">
<!-- Favicons -->
<link href="/talkdog/assets/img/favicon.png" rel="icon">
<link href="/talkdog/assets/img/apple-touch-icon.png"
   rel="apple-touch-icon">
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
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="/talkdog/assets/js/script.js"></script>
<script src="/talkdog/resources/js/script.js"></script>
  <!-- Template Main JS File -->
  <script src="/talkdog/assets/js/main.js"></script>
</head>
<body>
   <!-- ======= Top Bar ======= -->
   <section id="topbar" class="d-flex align-items-center">
      <div class="container d-flex justify-content-center justify-content-md-between">
      
   <!-- 비로그인 -->
   <c:if test="${sessionScope.sid == null }">
      <div class="contact-info d-flex align-items-center">
         <a href="/talkdog">HOME</a>
      <span></span>
      </div>
      <div class="social-links d-none d-md-flex align-items-center">
         <a href="/talkdog/common/login.jsp">장바구니&nbsp;</a>
         <span> </span>
         <a href="/talkdog/common/login.jsp">마이페이지&nbsp;</a>


         <a href="/talkdog/common/login.jsp" class="login">로그인</a>
         <a href="/talkdog/common/join.jsp" class="regi">회원가입</a>
      </div>
   </c:if>
            
         
<!-- 로그인 -->
<c:if test="${sessionScope.sid != null }">
   <div class="contact-info d-flex align-items-center">
      <a href="/talkdog">HOME &nbsp&nbsp</a><span></span> <!-- 모두 -->
            <c:if test="${sessionScope.sid != null }">
               <a href="/talkdog/Cart/CartList.do">장바구니&nbsp;</a>
               <span> </span>
               <c:if test="${sessionScope.sid != 'admin'}">
                  <a href="/talkdog/mypage/memMypage.jsp">마이페이지&nbsp;</a>
               </c:if>
            </c:if>
            <c:if test="${sessionScope.sid == 'admin'}">
               <a href="/talkdog/Cart/list.do?sid=${sid }"></a>
               <span> </span>
                     <a href="/talkdog/product/productAdd.jsp?language=ko">상품등록&nbsp;</a>
                     <span> </span>
                     <a href="/talkdog/product/productEdit.jsp?edit=modify">상품수정&nbsp;</a>
                     <span> </span>
                     <a href="/talkdog/product/productEdit.jsp?edit=remove">상품삭제&nbsp;</a>
               <span> </span>
               <a href="/talkdog/mypage/admAllList.jsp">이용자관리&nbsp;</a>

            </c:if>
   </div>
   <div class="social-links d-none d-md-flex align-items-center">
      <a  style="color: white">[${sessionScope.sid}]님 환영합니다!</a>
      <a  style="color: white;" href="/talkdog/common/logout.jsp">로그아웃</a>
   </div>
</c:if>
      </div>
   </section>
   <!-- ======= Header ======= -->
   <header id="header" class="d-flex align-items-center">
      <div class="container d-flex justify-content-between align-items-center">
   <div>
      <h1>
         <!-- 다들어줄개 로고 -->
         <!-- index, 문의게시판 등 모든 곳에서 보여주기 위해 웹서버 주소 사용  -->
         <a href="/talkdog"><img src="https://github.com/kdonghwi99/SecondTeamProject/blob/main/webapp/resources/images/talkdog.png?raw=true" alt="" class="img-fluid large-image"></a>
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
                       
                       <li><a href="/talkdog/Qna/list.do?pageNum=1&category=">문의게시판</a></li>
                      <li><a href="/talkdog/product/productlist.jsp">골라보시개🐶</a></li>
                  </ul>
               <i class="bi bi-list mobile-nav-toggle"></i>
            </nav><!-- .navbar -->
      </div>
   </header><!-- End Header -->
</body>
</html>
