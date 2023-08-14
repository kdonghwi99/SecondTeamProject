<%@page import="talkdog.vo.ProductVO, java.util.*"%>	<!-- 스크립트릿을 이용하여 ProductVO 객체 생성을 위한 import문 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    
<!DOCTYPE html>

<head>
<script src="https://code.jquery.com/jquery-3.7.0.min.js">

$(document).ready(function() {
	  $.ajax({
	    url: "/productlist.do",
	    type: "GET",
	    success: function (data) {
	      // 서버에서 받은 데이터를 처리하는 코드 작성
	    },
	    error: function (e) {
	      console.log("Error: " + e);
	    }
	  });
	});


</script>

  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Portfolio - Eterna Bootstrap Template</title>
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
  .square-image-container {
    position: relative;
    width: 100%;
    overflow: hidden;
    padding-top: 100%; /* 1:1 Aspect Ratio */
  }

  .square-image {
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
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
          <li><a href="productlist.jsp">골라보시개🐶</a></li>
        </ol>
        <h2>상품</h2>

      </div>
    </section><!-- End Breadcrumbs -->

<!-- Portfolio Section -->
<section id="portfolio" class="portfolio">
  <div class="container">

    <!-- Category filters -->
    <div class="row">
      <div class="col-lg-12 d-flex justify-content-center">
        <ul id="portfolio-flters">
          <li data-filter="*" class="filter-active">All</li>
          <li data-filter=".filter-app">영양제</li>
          <li data-filter=".filter-card">도서•다이어리</li>
          <li data-filter=".filter-web">아로마</li>
        </ul>
      </div>
    </div>


    <!-- Product listing -->
    <div class="row portfolio-container">

      <!-- Loading product data and database interaction -->
      <jsp:useBean id="pdao" class="talkdog.dao.ProductDAO"/> <!-- Create a ProductDAO object -->
      <%
        List<ProductVO> pvoList = pdao.selectAll();
        if(pvoList.size() > 0) { // Check if there are registered products
          for(ProductVO pVo : pvoList) { // Iterate through products
            String filterClass = "";
            // Set filter class based on product category
            String category = pVo.getpCate().toUpperCase(); // 대문자로 변환

            switch(category) {
              case "MEDI":
                filterClass = "filter-app";
                break;
              case "BOOK":
                filterClass = "filter-card";
                break;
              case "AROMA":
                filterClass = "filter-web";
                break;
              default:
                filterClass = "";
                break;
            }
      %>
      <!-- Displaying the product info in the grid -->
      <div class="col-lg-4 col-md-6 portfolio-item <%=filterClass%>">
        <div class="portfolio-wrap">
		<div class="square-image-container">
      	<img src="../resources/images/<%=pVo.getpMimg() %>" class="img-fluid square-image" alt="">
    		</div>
              <div class="portfolio-info">
            <h4><%=pVo.getpName()%></h4>
            <p><%=pVo.getpDetail()%></p>
            <p><%=pVo.getpPrice()%>원</p>
          <div class="portfolio-links">
            <a href="productInfo.jsp?pid=<%=pVo.getpId()%>" title="More Details"><i class="bx bx-link"></i></a>
            </div>
          </div>
        </div>
      </div>

      <%   
          }
        } else { 
          out.print("등록된 상품이 없습니다.");
        }
      %>

    </div>

    


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