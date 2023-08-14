<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="talkdog.vo.ProductVO" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

	
<% ProductVO pvo = new ProductVO(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" media="screen">

 <meta content="width=device-width, initial-scale=1.0" name="viewport">
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
  <link href="assets/css/style.css" rel="stylesheet">
<title>prouctEdit.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" media="screen">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

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
    .navbar-custom {
        margin-left: auto;
        margin-right: 25%;
    }
      .nav-item {
        margin-left: auto;
    }
</style>

</head>
<body>
<%@ include file="../include/header.jsp" %>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">✏상품 편집</h1>
		</div>
	</div>​
		 
<main role="main">
   <div class="container">
       <div class="row" align="center">
           <%-- 상품 리스트 출력할 구간 --%>
           <jsp:useBean id="pdao" class="talkdog.dao.ProductDAO"/>

           <%
               List<ProductVO> pvoList = pdao.selectAll();

               if (pvoList.size() > 0) {
                   for (ProductVO pVo : pvoList) {
           %>
           <div class="col-md-4">
               <div class="square-image-container">
                   <img src="../resources/images/<%=pVo.getpMimg() %>" class="square-image">
               </div>
               <h3><%=pVo.getpName() %></h3>
               <p><%=pVo.getpPrice() %>원</p>

               <%
                   String edit = request.getParameter("edit");
                   if ("modify".equals(edit)) {
               %>
               <p><a href="productModify.jsp?pid=<%=pVo.getpId()%>" class="btn btn-success">수정 &raquo;</a></p>
               <% } else if ("remove".equals(edit)) { %>
               <p><a href="productRemoveProc.jsp?pid=<%=pVo.getpId()%>" class="btn btn-warning" onclick="confirmAndSubmit(<%=pVo.getpId()%>)">삭제 &raquo;</a></p>
               <%
                   }
               %>
           </div>
           <% }
       } else {
           out.print("   등록된 상품이 없습니다.");
       }
       %>
   </div>
  </div><!-- /.container -->
</main>​
	
<%@ include file="../include/footer.jsp" %>

</body>
</html>

