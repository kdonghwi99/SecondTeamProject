<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="talkdog.dao.*, talkdog.vo.OrderVO, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>orderListAll.jsp</title>

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

<!--  주문 배송조회 내역 등록/수정/삭제 완료 메시지가 있는 경우, orderListAll.jsp로 돌아오면서 msg내용을 alert으로 띄우기 --> 
<c:if test="${!empty msg }">
	<script>
			alert('${msg}');
	</script>
	<%session.removeAttribute("msg"); 	//alert 띄우고 msg속성 초기화(제거)%>
</c:if>
		
<!-- ======= Breadcrumbs ======= -->
<section id="breadcrumbs" class="breadcrumbs" style="margin-bottom: 0px; display: flex; align-items: center;">
<div class="container"><h2 style="margin: 0 auto;">주문/배송 조회</h2></div></section><!-- End Breadcrumbs -->

<main role="main">
<div class="container">
	<form action="./OrderList.do" method="get">
		<div class="row">
			<div class="entry-content">

<!-- [관리자 only] 주문번호로 검색  --> 
	<c:if test="${sessionScope.sid == 'admin'}">
	<div class="col-sm-8" style="margin-bottom: 5px; margin-top: 20px;"> 
	<input type="text" name="ordNo" placeholder="&nbsp주문번호 입력" value="${!empty ordNo ? ordNo : '' }">
	<input type="submit" class="btn btn-outline-secondary btn-sm" value="검색">
	</div>
	</c:if>
	
<!-- 주문내역이 없는 경우 -->
<c:if test="${empty ordList }">
	<div class="row">
	<div class="col" align="center"> 
		<p class="alert alert-danger p-5" style=" margin-top: 20px;">
			주문 내역이 없습니다.
		</p></div></div>
</c:if>

<!-- 주문내역이 있는 경우 -->
<c:if test="${!empty ordList }">
		<div class="text-right">
		<span class="badge bg-secondary" style="float: right;">전체 주문내역 ${cnt }건</span></div>

	<!-- ======= 주문내역 리스트 ======= -->
	<table class="table">
		<thead class="table-light">
			<tr>
				<th scope="col">상품 사진</th>
				<th scope="col">상품명</th>
				<th scope="col">옵션</th>
				<th scope="col">수량</th>
				<th scope="col">주문날짜 / 주문번호</th>
				<th scope="col">가격</th>
				<th scope="col">처리현황</th></tr></thead>
		<tbody>
		
		<c:forEach items="${ordList }" var="ovo"> <!-- 컨트롤러와 동일하게 -->
		<!-- 주문번호 클릭 시 /OrderView.do 이동할 주문/배송내역 상세조회 + 파라미터 변수 담기 -->
		<c:set var="ordNo" value="${ovo.ordNo }"></c:set>
		<c:set var="admId" value="${ovo.admId }"></c:set>
		
		<c:url var="oViewLink" value="./OrderView.do">
			<c:param name="admId" value="${admId }"/>
			<c:param name="ordNo" value="${ordNo }"/>
			</c:url>
			
			<tr>
				<td>{상품사진 들어가}</td>
				<td>{상품명 들어가}</td>
				<td>{옵션 들어가}</td>
				<td>{수량 들어가}</td>
				<td>${ovo.ordDate} <br> <a href="oViewLink"></a>${ovo.ordNo } <!-- 주문번호 경로, 파라미터 --></td>
				<td>{가격 들어가} 원</td>
				<td class="text-warning fw-bold">
				${ovo.ordIng}<br> 송장번호 : ${ovo.invoiceNo}
				<div class="row">
					<div class="col-8" align="center"> 
					<!-- sid1= 다음에 송장번호 값 넣어 파라미터로 보내기 -->
					<a href="https://service.epost.go.kr/trace.RetrieveDomRigiTraceList.comm?sid1=1111111111111" target="_blank" class="btn btn-info btn-sm text-white"> 배송조회</a>
<!-- 구매확정 온클릭 스크립트 -->
<input type="button" class="btn btn-white btn-sm" style="background-color: #e96b56; color: white;" value="구매확정" onclick="#">
<!-- 리뷰작성(팝업) 온클릭 스크립트 -->
<input type="button" class="btn btn-white btn-sm" style="background-color: #e96b56; color: white;" value="리뷰작성" onclick="#">
					</div>
				</div></td>
				
			</tr>
		</c:forEach>
	</tbody>
</table>
						</c:if>
					</div>
				</div>
			</form>
		</div>
	</main>

	<!-- ======= Footer ======= -->
	<%@ include file="/include/footer.jsp"%>

	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="/talkdog/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="/talkdog/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/talkdog/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="/talkdog/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="/talkdog/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="/talkdog/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script src="/talkdog/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="/talkdog/assets/js/main.js"></script>

</body>

</html>
