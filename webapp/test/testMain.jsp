<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@page import="talkdog.vo.TestVO, talkdog.vo.TestnameVO, java.util.*"%>	<!-- 스크립트릿을 이용하여 ProductVO 객체 생성을 위한 import문 -->
  
<!DOCTYPE html>

<head>

  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
<script src="https://code.jquery.com/jquery-3.7.0.min.js">



</script>

  <title>Services - Eterna Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="../assets/img/favicon.png" rel="icon">
  <link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

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
        /* 수정된 custom CSS */
        .icon-box {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.15);
            display: inline-block;
            width: calc(25% - 20px);
            text-align: center;
             box-sizing: border-box;
            aspect-ratio: 1 / 1; /* 정사각형 비율 지정 */
            overflow: hidden;
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
          <li><a href="testMain.jsp">자가진단</a></li>
        </ol>
        <h2>Test</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Test Section ======= -->
    <section id="services" class="services">
        <div class="container">
            <div class="icon-box-container">
                <jsp:useBean id="tdao" class="talkdog.dao.TestDAO" />
                <%
                   List<TestnameVO> tnvoList = tdao.selectName();
                   if(tnvoList.size() > 0) {
                       for(TestnameVO tnVo : tnvoList){ 
                %>
             <div class="icon-box">
    <h4><a href="testInfo.jsp?tname=<%=tnVo.gettName()%>"><%=tnVo.gettName()%></a></h4>
</div>
                <%
                   }
                } else {
                    out.print("등록된 자가진단 항목이 없습니다.");
                }
                %>
            </div>
        </div>
    </section><!-- End Test Section -->

 

  </main><!-- End #main -->

 <!-- footer start -->
<%@ include file="/include/footer.jsp" %>
 <!-- footer end -->

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