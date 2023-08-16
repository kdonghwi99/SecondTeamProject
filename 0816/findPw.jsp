<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPw.jsp</title>
<style>
div {
	margin: 5px;
}

.head {
	background: lightgray;
	font-size: 20px;
	padding-left: 30px
}
</style>

</head>
<body>
	<%@ include file="../include/header.jsp"%>

	<br>
	<br>
	<br>


	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">비밀번호 찾기</h1>
		</div>
	</div>

	<%
	System.out.print("비번 찾기\n");
	%>
	<main role="main">
		<div class="container">
			<!--  -->
			<form action="/talkdog/Common/findpw.do" method="post"
				class="form-horizontal">
				<div class="form-group row"
					style="display: flex; justify-content: center; align-items: center;">
					<label class="col-sm-2">이름</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="admName"
							id="admName" required value="ccc">
					</div>
				</div>

				<div class="form-group row"
					style="display: flex; justify-content: center; align-items: center;">
					<label class="col-sm-2">아이디</label>
					<div class="col-sm-3">
						<input type="tel" class="form-control" name="admId" id="admPhone"
							required value="ccc">
					</div>
				</div>

				<div class="form-group row"
					style="display: flex; justify-content: center; align-items: center;">
					<label class="col-sm-2">전화번호</label>
					<div class="col-sm-3">
						<input type="tel" class="form-control" name="admPhone"
							id="admPhone" required value="010-1221-3311">
					</div>
				</div>


				<div
					style="display: flex; justify-content: center; align-items: center;">
					<input type="button" class="btn btn-secondary"
						onclick="history.back()" value="뒤로">
						<input type="submit" class="btn btn-info" value="찾기">
				</div>
				
				<%System.out.print("if 전\n"); %>
				
				<!-- 아이디 찾는걸 여기로 해서 조건 충족하면 띄움 수정전 -->
				<c:if test="${not empty admPw}">
					<div class="alert alert-danger">아이디는 [${admPw}]입니다.</div>

				</c:if>
				
				<c:if test="${not empty msg}">
					<%application.log("jsp msg"); %>
					<!-- 아이디를 찾지 못한 경우 -->
					<div class="alert alert-danger">${msg}</div>
				</c:if>
				
				<%session.removeAttribute("admId"); %>
				<%session.removeAttribute("msg"); %>
			</form>
		</div>
	</main>

	<br>
	<br>
	<br>

	<%@ include file="../include/footer.jsp"%>