<%@ page import="talkdog.dao.*, talkdog.vo.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		#entry entry-single {margin-bottom: 20px}
	</style>
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
	<script>
	    function goPopup() {
	        var pop = window.open("orderAdress.jsp", "pop", "width=370,height=200,left=500,top=100,scrollbars=yes,resizable=yes");
	    }

	    function jusoCallBack(roadAddrPart1, addrDetail, roadAddrPart2, zipNo) {
	        // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	        $('#zipNo').val(zipNo);
	        $('#addr1').val(roadAddrPart1);
	        $('#addr2').val(addrDetail);
	        $('#addr3').val(roadAddrPart2);
	    }
	</script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<!-- 포트원 라이브러리 추가 PortOne SDK -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- 객체 초기화 하기 -->
<script type="text/javascript">
var IMP = window.IMP;
IMP.init("imp01863821"); //IMP.init('가맹점 식별코드')

/* 결제 요청하기 */
function requestPay() {
    var today = new Date();   
    var hours = today.getHours();				// 시
    var minutes = today.getMinutes();			// 분
    var seconds = today.getSeconds();			// 초
    var milliseconds = today.getMilliseconds();
    var makeMerchantUid = Date.now();

	//rsp 파라미터로 보내기 위한 무언가    	
    
    var param = {
        pg: 'html5_inicis',										//PG사 구분코드
        pay_method: 'card',	//결제 수단 pay_method, 카드결제
        merchant_uid: '222',   		//주문 번호 생성한 ordNo
        name: '결제테스트',						//상품명 pName
        amount: 1000,							//결제 금액  payTotal
        buyer_name: '구매자', 				//회원 이름  admName
        buyer_tel: '01012345678',				//회원 번호 admPhone
        buyer_email: 'ha020@naver.com',		//회원 이메일 admEmail
        buyer_addr: '서울특별시 강남구 삼성동', //회원 주소 admAdd1,2,3
        buyer_postcode: '123-456',				//회원 우편번호 admMail
    };
    <%-- 결제 응답처리 
    rsp는 IMP.request_pay() 메소드를 호출하여 결제 요청 후, 결제 요청 결과를 응답받은 객체--%>
    <%-- 결제 결과 처리하기, iframe 결제창 결과처리 --%>
    <%-- callback --%>
    IMP.request_pay(param, function(rsp) {
        if ( rsp.success ) { <%-- 결제 성공시 로직 --%>
            var msg = '결제가 완료되었습니다.\n';
            msg += '결제번호 : ' + rsp.imp_uid + '\n';				<%--imp_uid 고유 결제 번호--%>
            msg += '주문번호 : ' + rsp.merchant_uid + '\n';		<%--merchant_uid 주문 번호--%>
            msg += '결제 금액 : ' + rsp.paid_amount + '원'+ '\n'; 	<%--paid_amount 결제 금액 --%>
            msg += '카드 승인번호 : ' + rsp.apply_num + '\n';	<%--apply_num 카드승인번호--%>
            msg += '결제 승인날짜 : ' + rsp.paid_at + '\n';			<%--paid_at 결제승인시각(String) --%>
            alert(msg);
			
			<%-- 결제 완료 후 이동할 페이지 url--%>
            location.href="/talkdog/order/orderDone.jsp?rsp.imp_uid="+rsp.imp_uid+"&rsp.paid_at="+rsp.paid_at;
            <%--pay_info(rsp);--%>
            
        } else {	
        	<%-- 결제 실패 시 로직 --%>
            var msg = '결제에 실패하였습니다.\n';
            msg += '사유 : ' + rsp.error_msg;		<%-- error_msg 결제 실패 메시지 --%>
            alert(msg);
            history.back();
            
            <%--location.href="goods_pay_fail.do?error_msg="+rsp.error_msg;--%>
        }
    });
}
</script>
<script type="text/javascript">function handlePaymentSuccess(rsp) {
    // 결제가 완료됐을 경우 로직 구현
    $.ajax({
        url: "/Order/*", // 여기에 서블릿 URL을 입력해주세요.
        method: "POST",
        data: {
            // 기존의 파라미터들
            imp_uid: rsp.imp_uid,
            paid_amount: rsp.paid_amount,
            merchant_uid: rsp.merchant_uid,
            apply_num: rsp.apply_num,
            paid_at: rsp.paid_at,
            
            // 추가적인 파라미터들
            delName: $("input[name='delName']").val(),
            delAddress1: $("input[name='delAddress1']").val(),
            delAddress2: $("input[name='delAddress2']").val(),
            delAddress3: $("input[name='delAddress3']").val(),
            delPhone: $("input[name='delPhone']").val(),
            delMemo: $("input[name='delMemo']").val(),
            ordIng: $("input[name='ordIng']").val(),
            admId: $("input[name='admId']").val()
        },
        success: function(response) {
            // 서버에서 데이터 저장 성공 시, 클라이언트에서 처리할 로직 구현
        },
        error: function(error) {
            // 서버에서 데이터 저장 실패 시, 클라이언트에서 처리할 로직 구현
        }
    });
}
</script>

	<!-- header -->
	<%@ include file="/include/header.jsp"%>
		
	<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs" style="margin-bottom: 0px; display: flex; align-items: center;">
		  	<div class="container"><h2 style="margin: 0 auto;">주문하기</h2></div>
		</section><!-- End Breadcrumbs -->


		<!-- ======= 주문자 정보 ======= -->
		<section id="blog" class="blog">
			<div class="container" data-aos="fade-up">
				<form action="./Insert.do" method="post" class="form-horizontal">
					<article class="entry entry-single">
						<div class="entry-meta">
							<button type="button" class="btn btn-secondary">주문자 정보</button>
						</div>
						<div class="entry-content">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">주문자 성함</th>
										<th scope="col">주문자 번호</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>성함 ${avo.admName}</td>
										<td>번호 ${avo.admName}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</article>
					<article class="entry entry-single">
						<div class="entry-meta">
							<button type="button" class="btn btn-secondary">배송지 정보</button>
						</div>
						<div class="entry-content">
							<div class="form-group row" style="margin-bottom: 10px"> 
								<label class="col-sm-2">수령인</label>
								<div class="col-sm-3"><input type="text" name="name" id="name" class="form-control" required></div>
							</div>
							<div class="form-group row" style="margin-bottom: 10px"> 
								<label class="col-sm-2">우편번호</label>
								<div class="col-sm-3"><input type="text" name="zipNo" id="zipNo" class="form-control" required></div>
								<div class="col-sm-2"><input type="button" class="btn btn-outline-secondary" value="검색" onclick="goPopup()"></div>
							</div>
							<div class="form-group row" style="margin-bottom: 10px"> 
								<label class="col-sm-2">도로명 주소</label>
								<div class="col-sm-6"><input type="text" name="addr1" id="addr1" class="form-control" required></div>
							</div>
							<div class="form-group row" style="margin-bottom: 10px"> 
								<label class="col-sm-2">상세 주소</label>
								<div class="col-sm-3"><input type="text" name="addr2" id="addr2" class="form-control"></div>
								<div class="col-sm-3"><input type="text" name="addr3" id="addr3" class="form-control"></div>
							</div>
							<div class="form-group row" style="margin-bottom: 10px">  
								<label class="col-sm-2">연락처</label>
								<div class="col-sm-3"><input type="text" name="phone" id="phone" class="form-control" required></div>
							</div>
							<div class="form-group row" style="margin-bottom: 10px"> 
								<label class="col-sm-2">배송 요청사항</label>
								<div class="col-sm-8"><input type="text" name="request" id="request" class="form-control"></div>
							</div>
						</div>
					</article>
					
					<!-- 주문상품 정보 -->
					<article class="entry entry-single">
						<div class="entry-meta">
							<button type="button" class="btn btn-secondary">주문상품 정보</button>
						</div>
						<div class="entry-content">
							<table class="table">
								<thead class="table-light">
									<tr>
										<th scope="col">상품 사진</th>
										<th scope="col">상품명</th>
										<th scope="col">옵션</th>
										<th scope="col">수량</th>
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
					
					<!-- 약관 동의 -->
					<article class="entry entry-single">
						<div class="entry-meta"></div>
						<script>
						$(function() {
						    $("#flexCheckAll").click(function() {
						        $(".form-check-input").prop("checked", this.checked);
						    });
						    $(".form-check-input").click(function() {
						    	// 다른 체크박스 중 하나라도 체크가 해제되면 "flexCheckAll" 체크박스도 체크하지 않도록
								if (!$(this).prop("checked")) {
						            $("#flexCheckAll").prop("checked", false);
						        }
						    });
						});
						</script>
						<div class="entry-meta">
							<button type="button" class="btn btn-secondary">약관 동의</button>
						</div>
						<div class="entry-content">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="flexCheckAll" required>
								<label class="form-check-label" for="flexCheckAll" style="font-weight: bold; color: #e96b56">
									구매조건/약관 및 개인정보 이용에 모두 동의합니다.
								</label>
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
					
					<!-- 결제하기 -->
					<article class="entry entry-single" style="box-shadow: 0px 0px 0px white;">
						<div class="entry-meta"></div>
						<button type="submit" class="btn btn-white btn-lg col-lg-12" style="background-color: #e96b56; color: white;"  onclick="requestPay()">결제 하기</button>
					</article>
				</form>
			</div>
		</section>
		<!-- ======= 주문상품 정보 끝 ======= -->
	</main>
	<!-- End main -->

	<!-- ======= Footer ======= -->
	<%@ include file="/include/footer.jsp"%>
	<!-- 페이지 상단으로 버튼 -->
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center">
		<i class="bi bi-arrow-up-short"></i>
	</a>
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
