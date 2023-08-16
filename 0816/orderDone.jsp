<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--  UNIX time stamp 처리 -->
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>orderDone.jsp</title>

<!-- Favicons -->
<link href="/assets/img/favicon.png" rel="icon">
<link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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
</head>

<body>
	<!-- header -->
	<%@ include file="/include/header.jsp"%>
	
	
	<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs" style="margin-bottom: 0px;">
			<div class="container">
				<h2> 주문 완료</h2>
			</div>
		</section>
		<!-- End Breadcrumbs -->
		<br>
		<!-- 결제번호 결과표시 -->
		<div class="container">
				<div class="row">
			<div class="col" align="center"> 
				<div class="alert alert-danger p-5">
				주문이 완료되었습니다. 
				<br>이용해주셔서 감사합니다.
				<br>
				<%
				    // UNIX 타임스탬프 값을 받아옵니다.
				    long timestamp = Long.parseLong(request.getParameter("rsp.paid_at")) * 1000L;
				
				    // 값을 Date 객체로 변환합니다.
				    Date date = new Date(timestamp);
				
				    // Date 객체를 yyyy-MM-dd 포맷으로 변환합니다.
				    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				    String formattedDate = sdf.format(date);
				%></div>
				<div class="alert alert-success p-5">
				<div style="font-weight: bold;">결제번호 : <%= request.getParameter("rsp.imp_uid") %></div>
				<div style="font-weight: bold;">주문 완료 날짜 : <%= formattedDate %></div>
				</div></div></div>
			</div>
			
			<div class="container">
			<div class="text-right" align="right">
					<a href="/talkdog/product/productlist.jsp" class="btn btn-white" style="background-color: #e96b56; color: white;"> 상품 목록</a>
				</div></div><br>
		</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="/include/footer.jsp"%>

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="/talkdog/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script
		src="/talkdog/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/talkdog/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="/talkdog/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="/talkdog/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="/talkdog/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script src="/talkdog/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="/talkdog/assets/js/main.js"></script>

</body>

</html>
