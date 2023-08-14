<%@page import="talkdog.vo.TestVO"%>
<%@page import="talkdog.vo.TestVO"%>
<%@page import="talkdog.vo.TestResultVO"%>
<%@page import="talkdog.vo.TestnameVO"%>
<%@page import="talkdog.vo.MemberResultVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Portfolio Details - Eterna Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="../assets/img/favicon.png" rel="icon">
  <link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Vendor CSS Files -->
  <link href="../assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../assets/css/style.css" rel="stylesheet">


  <style>
  /* Custom Image Class */
  
.test {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
}

.section-title {
  text-align: center;
}

  </style>
</head>

<body>

 <!-- header start -->
<%@ include file="../include/header.jsp" %>
 <!-- header end -->

  <main id="main">
   <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="../index.jsp">Home</a></li>
          <li>Portfolio Details</li>
        </ol>
        <h2>Portfolio Details</h2>

      </div>
    </section><!-- End Breadcrumbs -->
  


<!-- ======= Reviews Section ======= -->
<%
    String testName = request.getParameter("tname");
    if (testName == null || testName.isEmpty()) {
        out.print("잘못된 접근입니다.");
    } else {
       

        if ("불안".equals(testName)) {
%>
            <div class="test">
                <div class="container">
                    <div class="section-title">
                        <h2>진단 검사</h2>
                    </div>
                    <jsp:include page="anxiety.jsp"/>
                </div>
            </div><!-- End #main -->
<%
        } else if ("우울".equals(testName)) {
%>
            <div class="test">
                <div class="container">
                    <div class="section-title">
                        <h2>진단 검사</h2>
                    </div>
                    <jsp:include page="depression.jsp"/>
                </div>
            </div><!-- End #main -->
<%
        } else if ("스트레스".equals(testName)) {
%>
            <div class="test">
                <div class="container">
                    <div class="section-title">
                        <h2>진단 검사</h2>
                    </div>
                    <jsp:include page="stress.jsp"/>
                </div>
            </div><!-- End #main -->
<%
        } else {
            out.print("선택된 테스트가 유효하지 않습니다.");
        }
    }
%>



    <!-- footer start -->
<%@ include file="/include/footer.jsp" %>
 <!-- footer end --><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="../assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="../assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="../assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="../assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>

</body>

</html>