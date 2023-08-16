<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<style>
.divC {
	display: inline-block;
	padding: 20px;
	
}

.h1h {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	background: lightgray;
	padding: 20px;
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
			<h1 class="display-4 h1h">내 정보</h1>
		</div>
	</div>
	<br>
	<%@ include file="../include/sideMenuMem.jsp"%>






	<!-- 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<main role="main">
			<div class="container divC">
				<form action="joinProc.jsp" method="post" class="form-horizontal">
					<!-- 필수 입력 항목 안내 메시지 -->
					<c:set var="idMsg" value="아이디는 필수 입력 항목입니다." />
					<c:set var="pwMsg" value="비밀번호는 필수 입력 항목입니다." />
					<c:set var="nmMsg" value="이름은 필수 입력 항목입니다." />

					<div class="form-group row">
						<label class="col-sm-2">이름</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="id" id="id"
								required>
						</div>
					</div>
					<br>
					<div class="form-group row">
						<label class="col-sm-2">전문가 권한</label>
						<div class="col-sm-3">
							<select id="type">
								<option value="master">전문가</option>
								<option value="normal">일반</option>
							</select>
						</div>
					</div>
					<br>
					<div class="form-group row">
						<label class="col-sm-2">아이디</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="admId" id="admId"
								required oninput="setCustomValidity('')"
								oninvalid="this.setCustomValidity('${idMsg }')">
						</div>
					</div>
<br>
					<div class="form-group row">
						<label class="col-sm-2">이메일</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" name="email1" id="email1">
						</div>
					</div>
<br>
					<div class="form-group row">
						<label class="col-sm-2">전화번호</label>
						<div class="col-sm-3">
							<input type="tel" class="form-control" name="admPhone" id="admPhone">
						</div>
					</div>
<br>
					<div
						style="display: flex; justify-content: center; align-items: center;">
						<input type="button" class="btn btn-secondary"
							onclick="history.back()" value="취소"> <input type="submit"
							class="btn btn-info" onclick="return pwEmailChk()" value="등록">
					</div>

				</form>
			</div>
		</main>
		
		<br> <br> <br>

		<%@ include file="../include/footer.jsp"%>
</body>
</html>