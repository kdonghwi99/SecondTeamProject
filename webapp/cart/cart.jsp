<%@page import="talkdog.vo.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
<style type="text/css">
	#cartAllRemove, #order, #goShop{
		float: right;
	}
	
	.totalPrice {
        display: flex;
        justify-content: flex-end;
        align-items: center;
    }
    .totalPrice span {
        margin-left: 10px;
        font-weight: bold;
    }
    .bg-light {
        color: black;
    }
    #cartImg{ width: 250px;}
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<!-- 장바구니를 비우고, cart.jsp로 돌아온 경우, msg내용을 alert으로 띄우기 --> 
<c:if test="${!empty msg }">
	<script>
			alert('${msg}');
	</script>
	<%session.removeAttribute("msg"); 	//alert 띄우고 msg속성 초기화(제거)%>
</c:if>

<div class="jumbotron">
	<div class="container">
		<br>
		<h1 class="display-4">🛒장바구니</h1>
	</div>
</div>

<main role="main">
	<div class="container">
	<!-- 장바구니가 비어 있는 경우 -->
		<c:if test="${empty cartList}">
		
		<div class="row">
			<div class="col" align="center"> 
				<img src="/talkdog/resources/images/cart.png" style="display: block; margin: 0 auto;" id="cartImg" alt="카트 이미지"/>
				<h3>장바구니에 담긴 상품이 없습니다.</h3>
			</div>
		</div><br><br>
		<div class="text-right"> 
			<a href="../product/productlist.jsp" class="btn btn-outline-primary" id="goShop">상품 구매하러 가기</a>
		</div><br><br><br><br>			
		</c:if>
	<!-- end 장바구니 비어있을 때  -->
	
	<!-- 장바구니에 상품이 있는 경우 -->
	<c:if test="${not empty cartList}">
		<div class="text-right">
			<a onclick="cartAllRemove('${sid}');" class="btn btn-danger" id="cartAllRemove">장바구니 비우기</a>
		</div>			
		<div style="padding-top:50px">
			<table class="table table-hover">
			<thead>
			<tr>
				<th class="text-center">No.</th>
				<th class="text-center">상품명</th>
				<th class="text-center">옵션</th>
				<th class="text-center">가격</th>
				<th class="text-center">수량</th>
				<th class="text-center">합계</th>
				<th class="text-center">비고</th>
			</tr>
			</thead>
			<!-- 실제 장바구니의 vo 값들을 출력할 구간 -->
			<tbody>
			<c:set var="total" value="0"/>
			<c:forEach items="${cartList }" var="cvo">
				<c:set var="sum" value="${cvo.cartQuan * productMap[cvo.pId].pPrice}"/>
				<c:set var="total" value="${total + sum}"/>
				<%-- total은 찐으로 결제총합이고, sum은 상품가격*수량 한 상품당 총합 --%>
				<tr>
					<td class="text-center">${cvo.cartRn }</td>
					<td class="text-center">${productMap[cvo.pId].pName}</td>
					<td class="text-center">${cvo.cartOpt }</td>
					<td class="text-center"><fmt:formatNumber value="${productMap[cvo.pId].pPrice }" pattern="#,###"/></td>
					<td class="text-center">
			            <!-- 수량 조절 버튼 추가 -->
			            <div class="quantity-controls">
			                <button class="quantity-minus badge rounded-pill bg-light text-dark" data-product-id="${cvo.pId}" data-cart-no="${cvo.cartNo}">-</button>
			                <span class="quantity-text">${cvo.cartQuan}</span>
			                <button class="quantity-plus badge rounded-pill bg-light text-dark" data-product-id="${cvo.pId}" data-cart-no="${cvo.cartNo}">+</button>
			            	 <button class="apply-button badge bg-dark" data-product-id="${cvo.pId}" data-cart-no="${cvo.cartNo}">적용</button>
			            </div>
        			</td>
					<td class="text-center">
						<span class="item-subtotal"><fmt:formatNumber value="${sum }" pattern="#,###"/></span>
					</td>
					<td class="text-center"><a onclick="cartRemove('${sid}', ${cvo.cartNo });" class="btn btn-outline-danger btn-sm">삭제</a></td>
				</tr>
			</c:forEach>
			</tbody>
			</table>
		</div>
		
		<div class="text-right"> 
			<div class="totalPrice">
				<h4><span class="text-right">결제금액　　<fmt:formatNumber value="${total }" type="currency"/>　</span></h4>
			</div>
		</div>
		<br>
		<br>	
		<div class="text-right"> 
			<a href="/talkdog/Order/InsertForm.do" class="btn btn-success" id="order">주문하기</a>
		</div><br><br><br><br>
	</c:if>
		<!-- END 장바구니에 상품이 있는 경우 -->
	</div>
</main>

<%@ include file="../include/footer.jsp" %>
</body>
</html>
