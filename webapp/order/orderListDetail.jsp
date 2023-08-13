<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>orderListDetail.jsp</title>

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
	<section id="breadcrumbs" class="breadcrumbs" style="margin-bottom: 0px; display: flex; align-items: center;">
  	<div class="container"><h2 style="margin: 0 auto;">주문/배송 상세조회</h2></div></section><!-- End Breadcrumbs -->
		
		<!-- ======= 배송지 정보 ======= -->
		<section id="blog" class="blog">
			<div class="container" data-aos="fade-up">
				<div class="row">
					<div class="col-lg-8 entries">
						<article class="entry entry-single" style="margin-bottom: 0px;">
							<div class="entry-meta">
								<button type="button" class="btn btn-secondary">배송지 정보</button>
							</div>
							<div class="entry-content">
				<div class="form-group row"> 
					<label class="col-sm-2 fw-bold">수령인</label>
					<div class="col-sm-3">
						{수령인 값}
					</div></div>
			
				<div class="form-group row"> 
					<label class="col-sm-2 fw-bold">우편번호</label>
					<div class="col-sm-3">
						{우편번호 값}
					</div></div>
					
				<div class="form-group row"> 
					<label class="col-sm-2 fw-bold">도로명 주소</label>
					<div class="col-sm-6">
						{도로명 주소 값}
					</div></div>
			
				<div class="form-group row"> 
					<label class="col-sm-2 fw-bold">상세 주소</label>
					<div class="col-sm-3">
						{상세주소 값}
					</div></div>
			
				<div class="form-group row"> 
					<label class="col-sm-2 fw-bold">연락처</label>
					<div class="col-sm-3">
						{연락처 값}
					</div></div>
					
				<div class="form-group row"> 
					<label class="col-sm-2 fw-bold">배송 요청사항</label>
					<div class="col-sm-8">
						{배송요청사항}
					</div></div>
							</div>
						</article>
					</div>
				</div>
			</div>
		</section>
		<!-- ======= 배송지 정보 끝 ======= -->
		
		<!-- ======= 주문 정보 ======= -->
		<section id="blog" class="blog">
			<div class="container" data-aos="fade-up">
				<div class="row">
					<div class="col-lg-8 entries">
						<article class="entry entry-single" style="margin-bottom: 0px;">
							<div class="entry-meta">
								<button type="button" class="btn btn-secondary">주문 정보</button>
							</div>
							<div class="entry-content">
								<table class="table">
									<thead>
										<tr>
											<th scope="col">성함</th>
											<th scope="col">번호</th>
											<th scope="col">처리현황</th>
											<th scope="col">송장번호</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>{주문자값}</td>
											<td>{주문자 번호 값}</td>
											<td>{처리현황 값}</td>
											<td>010-2222-2222</td>
										</tr>
									</tbody>
								</table>
								
								<table class="table">
									<thead class="table-light">
										<tr>
											<th scope="col">상품 사진</th>
											<th scope="col">상품명</th>
											<th scope="col">옵션</th>
											<th scope="col">수량</th>
											<th scope="col">가격</th>
											<th scope="col">리뷰</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>상품사진 들어가</td>
											<td>상품명 들어가</td>
											<td>옵션 들어가</td>
											<td>수량 들어가</td>
											<td>가격 들어가</td>
											<td>
									<div class="row">
										<div class="col-8" align="center"> 
										<!-- 리뷰작성(팝업) 온클릭 스크립트 -->
										<input type="button" class="btn btn-white btn-sm" style="background-color: #198754; color: white;" value="리뷰작성" onclick="#">
										<!-- 리뷰작성 완료 시 -->
										<input type="button" class="btn btn-white btn-sm" style="background-color: #e96b56; color: white;" value="리뷰작성 완료" onclick="#">
										</div></div>
											</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<th></th>
											<th></th>
											<th></th>
											<th class="text-center">총액</th>
											<th class="text-center">
												<fmt:formatNumber value="${total }" pattern="#,###"/>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;원
											</th>
											<th></th>
										</tr>
									</tfoot>
								</table>
								
							</div>
						</article>
					</div>
				</div>
			</div>
		</section>
		<!-- ======= 주문자 정보 끝 ======= -->
		
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
