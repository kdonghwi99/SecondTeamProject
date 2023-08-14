<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPw</title>
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

	<!-- 아이디 찾는걸 여기로 해서 조건 충족하면 띄움 수정전 -->
	<c:if test="${param.msg == 'fail' }">
		<div class="alert alert-danger">아이디는 []입니다.</div>
	</c:if>
	<div>
		<!-- 이게 조건이 안맞을 경우로 수정해야함 아직 수정전 -->
		<script>
			alert("정보가 일치하지 않습니다.");
		</script>
	</div>

	<div>
		<!-- 이게 조건이 안맞을 경우로 수정해야함 아직 수정전 -->
		<script>
			alert("비밀번호가 변경되었습니다.");
		</script>
	</div>


	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">비밀번호 찾기</h1>
		</div>
	</div>


	<main role="main">
		<div class="container">
			<div class="form-group row"
				style="display: flex; justify-content: center; align-items: center;">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="id" id="id" required
						oninput="setCustomValidity('')"
						oninvalid="this.setCustomValidity('${idMsg }')">
				</div>
			</div>

			<div class="form-group row"
				style="display: flex; justify-content: center; align-items: center;">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="id" id="id" required
						oninput="setCustomValidity('')"
						oninvalid="this.setCustomValidity('${idMsg }')">
				</div>
			</div>

			<div class="form-group row"
				style="display: flex; justify-content: center; align-items: center;">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input type="tel" class="form-control" name="phone" id="phone">
				</div>
			</div>

			<div style="display: flex; justify-content: center; align-items: center;">
				<input type="button" class="btn btn-secondary" onclick="history.back()" value="뒤로">
				　
				<input type="submit" class="btn btn-info" onclick="return pwEmailChk()" value="찾기">
			</div>
			
			<!-- 여긴 넘어간후 나오는 변경 폼  -->
			<div class="form-group row"
				style="display: flex; justify-content: center; align-items: center;">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="id" id="id" required
						oninput="setCustomValidity('')"
						oninvalid="this.setCustomValidity('${idMsg }')">
				</div>
			</div>

			<div class="form-group row"
				style="display: flex; justify-content: center; align-items: center;">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="id" id="id" required
						oninput="setCustomValidity('')"
						oninvalid="this.setCustomValidity('${idMsg }')">
				</div>
			</div>

			<div
				style="display: flex; justify-content: center; align-items: center;">
				<input type="button" class="btn btn-secondary"
					onclick="history.back()" value="재설정">
			</div>

			<!-- 여긴 넘어간후 나오는 변경 폼  -->


		</div>
	</main>

	<br>
	<br>
	<br>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>