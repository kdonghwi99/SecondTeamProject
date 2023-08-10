<%@ page import="talkdog.dao.*, talkdog.vo.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>orderEnroll.jsp</title>

<!-- Favicons -->
<link href="/assets/img/favicon.png" rel="icon">
<link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Vendor CSS Files -->
<link href="/talkdog/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="/talkdog/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/talkdog/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="/talkdog/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="/talkdog/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="/talkdog/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<!-- Template Main CSS File -->
<link href="/talkdog/assets/css/style.css?v=1" rel="stylesheet"> <!-- css 날아갈 시 ?v=1 -->
</head>

<body>
	<!-- header -->
	<%@ include file="/include/header.jsp"%>
		
	<main id="main">
	<!-- ======= Breadcrumbs ======= -->
	<section id="breadcrumbs" class="breadcrumbs" style="margin-bottom: 0px;">
		<div class="container"> <h2>주문하기</h2> </div>
	</section>
	<!-- End Breadcrumbs -->

	<!-- ======= 주문자 정보 ======= -->
	<section id="blog" class="blog">
	<div class="container" data-aos="fade-up"><div class="row"><div class="col-lg-8 entries">
		<form action="./OrderInsert.do" method="post" class="form-horizontal">
			<article class="entry entry-single" style="margin-bottom: 0px;">
				<div class="entry-meta">
						<button type="button" class="btn btn-secondary">주문자 정보</button>
				</div>
				<div class="entry-content">
				<table class="table">
						<thead>
							<tr>
								<th scope="col">주문자 성함</th><th scope="col">주문자 번호</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>성함 ${avo.admName}</td><td>번호 ${avo.admName}</td>
							</tr>
						</tbody>
				</table>
				</div>
			</article>
		</form></div></div></div>
	</section>
	<!-- ======= 주문자 정보 끝 ======= -->

	<!-- ======= 배송지 정보 ======= -->
	<section id="blog" class="blog">
		<div class="container" data-aos="fade-up"><div class="row"><div class="col-lg-8 entries">
				<form action="./DeliveryInsert.do" method="post" class="form-horizontal">
		
					<article class="entry entry-single" style="margin-bottom: 0px;">
						<div class="entry-meta">
							<button type="button" class="btn btn-secondary">배송지 정보</button>
						</div>
						<div class="entry-content">
			<div class="form-group row"> 
				<label class="col-sm-2">수령인</label>
				<div class="col-sm-3">
					<input type="text" name="name" id="name" class="form-control" required>
				</div></div>
		
			<div class="form-group row"> 
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input type="text" name="zipNo" id="zipNo" class="form-control" required>
				</div> 
				<div class="col-sm-2">
					<input type="button" class="btn btn-outline-secondary"
						   value="검색" onclick="goPopup();"> <!--goPopup()  -->
				</div></div>
				
			<div class="form-group row"> 
				<label class="col-sm-2">도로명 주소</label>
				<div class="col-sm-6">
					<input type="text" name="addr1" id="addr1" class="form-control" required>
				</div></div>
		
			<div class="form-group row"> 
				<label class="col-sm-2">상세 주소</label>
				<div class="col-sm-3">
					<input type="text" name="addr2" id="addr2" class="form-control"></div>
				<div class="col-sm-3">
					<input type="text" name="addr3" id="addr3" class="form-control">
				</div></div>
		
			<div class="form-group row"> 
				<label class="col-sm-2">연락처</label>
				<div class="col-sm-3">
					<input type="text" name="phone" id="phone" class="form-control" required>
				</div></div>
				
			<div class="form-group row"> 
				<label class="col-sm-2">배송 요청사항</label>
				<div class="col-sm-8">
					<input type="text" name="request" id="request" class="form-control">
				</div></div>
						</div>
					</article>
				</form></div></div></div>
	</section>
	<!-- ======= 배송지 정보 끝 ======= -->

	<!-- ======= 주문상품 정보 ======= -->
	<section id="blog" class="blog">
		<div class="container"><div class="row"><div class="col-lg-8 entries">
			<form action="./OrderView.do" method="post" class="form-horizontal">
		
					<article class="entry entry-single" style="margin-bottom: 0px;">
						<div class="entry-meta">
							<button type="button" class="btn btn-secondary">주문상품 정보</button>
						</div>
						<div class="entry-content">
							<table class="table">
								<thead class="table-light">
									<tr>
										<th scope="col">상품 사진</th> <th scope="col">상품명</th>
										<th scope="col">옵션</th> <th scope="col">수량</th>
										<th scope="col">가격</th>
									</tr>
								</thead>
								<tbody>
								 <c:forEach var="cartItem" items="${cartList}">
									<tr>
               						 <td>상품 사진<img src="${cartItem.product.getpMimg()}" alt="${cartItem.product.getpName()}" width="80" height="80"></td>
									 <td>상품 명 ${cartItem.product.getpName()}</td>
									 <td>옵션 ${cartItem.cartOpt}</td>
									 <td>수량 ${cvo.cartQuan}</td>
									 <td>가격 ${cartItem.product.getpPrice() * cartItem.cartQuan}</td>
									</tr>
								</c:forEach>
								</tbody>
							
								<tfoot>
									<tr>
										<th></th><th></th><th></th>
										<th class="text-center">총액</th>
										<th class="text-center">
											<fmt:formatNumber value="${total }" pattern="#,###"/>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;원
										</th><th></th>
									</tr>
								</tfoot>
							</table>
						</div>
					</article>
			</form></div></div></div>
	</section>
	<!-- ======= 주문상품 정보 끝 ======= -->

<!-- ======= 약관 동의 ======= -->
<section id="blog" class="blog">
	<div class="container" data-aos="fade-up">
		<div class="row">
			<div class="col-lg-8 entries">
				<article class="entry entry-single" style="margin-bottom: 0px;">
					<div class="entry-meta">
						<button type="button" class="btn btn-secondary">약관 동의</button>
					</div>
					<div class="entry-content">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckAll">
							<label class="form-check-label" for="flexCheckAll" style="font-weight: bold; color: #e96b56">
								구매조건/약관 및 개인정보 이용에 모두 동의합니다.
							</label>
							
							<!-- ID가 "flexCheckAll" 인 체크박스를 클릭했을 때, 클래스가 "form-check-input" 인 모든 체크박스를 체크 -->
							<!-- 다른 체크박스 중 하나라도 체크가 해제되면 "flexCheckAll" 체크박스도 체크하지 않도록 -->
							<!-- 모든 하위 체크박스가 체크되어 있다면, flexCheckAll 체크박스도 check -->
						<script>
						$(function() {
						    $("#flexCheckAll").click(function() {
						        $(".form-check-input").prop("checked", this.checked);
						    });
						    $(".form-check-input").click(function() {
						        if (!$(this).prop("checked")) {
						            $("#flexCheckAll").prop("checked", false);
						        } else {
						            if ($(".form-check-input:checked").length == $(".form-check-input").length) {
						                $("#flexCheckAll").prop("checked", true);
						            }
						        }
						    });
						});
						</script>

						
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
							<label class="form-check-label" for="flexCheckDefault">
								다들어줄개 약관 동의 (필수)
							</label>
			                <textarea class="form-control" rows="3" readonly>
[다들어줄개 약관 동의] 
이용 약관에 동의합니다.
상품 구매 시 반드시 사이트 이용약관을 확인하시기 바랍니다.
구매 후 상품 환불 시 환불 방법 및 규정에 따라 처리됩니다.
			                </textarea>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
							<label class="form-check-label" for="flexCheckChecked">
								개인정보 수집 및 이용에 대한 안내 (필수)
							</label>
			                <textarea class="form-control" rows="3" readonly>
[개인정보 수집 및 이용에 대한 안내]
회사는 회원 가입, 상품 구매 및 배송 등 최적화된 서비스 제공을 위해 일부 필수 개인정보를 수집합니다.
회원은 언제든지 제공한 개인정보를 수정 및 삭제할 수 있습니다.
회사는 회원의 개인정보 보호를 위해 최선을 다하며, 회원의 동의 없이 제3자에게 개인정보를 제공하지 않습니다.
			                </textarea>									
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
							<label class="form-check-label" for="flexCheckChecked">
								구매조건 및 개인정보 제3자 제공 (필수)
							</label>
			                <textarea class="form-control" rows="3" readonly>
[구매조건 및 개인정보 제3자 제공]
상품 구매 시 일부 항목은 반드시 입력하셔야 주문이 완료됩니다.
회원 정보는 회사의 계정 및 서비스 제공 목적으로만 사용됩니다.
회사는 상품 구매에 필요한 최소한의 개인정보를 특정 제3자에게 제공할 수 있습니다.
			                </textarea>										
						</div>
					</div>

				</article>
			</div>
		</div>
	</div>
</section>
<!-- ======= 약관 동의 끝 ======= -->

	
	<!-- ======= 결제하기 ======= -->
	<section id="blog" class="blog">
		<div class="container" data-aos="fade-up"><div class="row"><div class="col-lg-8 entries">
					<article class="entry entry-single" style="box-shadow: 0px 0px 0px white; margin-top: 0px">
						<div class="entry-meta">
						</div>
						<form id="payment-form">
							<button type="submit" class="btn btn-white btn-lg col-lg-12" style="background-color: #e96b56; color: white;">결제 하기</button>
						</form>
					</article>
		</div></div></div>
	</section>
	<!-- ======= 결제하기 끝 ======= -->
	<!-- End blog entries list -->
	</form>
</main>
<!-- End main -->

	<!-- ======= Footer ======= -->
	<%@ include file="/include/footer.jsp"%>
	<!-- 페이지 상단으로 버튼 -->
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center">
	<i class="bi bi-arrow-up-short"></i></a>
	<!-- Vendor JS Files -->
	<script src="/talkdog/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="/talkdog/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/talkdog/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="/talkdog/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="/talkdog/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="/talkdog/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script src="/talkdog/assets/vendor/php-email-form/validate.js"></script>
	<!-- Template Main JS File -->
	<script src="/talkdog/assets/js/main.js?v=1"></script>

</body>
</html>
