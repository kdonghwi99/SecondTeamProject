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

.divA {
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
				<div class="divP">
					<img src="../resources/images/${masvo.masProf }" alt="프로필 이미지"
						style="width: 100%">
						
					<label class="col-sm-2" style="font-size: 30px; width:300px;">전문가 [${masvo.admId }]님</label>
				</div>
				<br>
				<div class="form-group row">
					<label class="col-sm-2">소개</label>
					<div class="col-sm-3">
						<input type="textarea" class="form-control"
							style="width: 200px; height: 100px;" name="masIntro"
							id="masIntro" required>
					</div>
				</div>
				<br>
				<div class="form-group row">
					<label class="col-sm-2">경력</label>
					<div class="col-sm-3">
						<input type="text" type="textarea" class="form-control"
							style="width: 200px; height: 100px;" name="masAuth" id="masAuth"
							required>
					</div>
				</div>
				<br>
				<div class="form-group row">
					<label class="col-sm-2">의원정보</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="masAddr"
							id="masAddr" style="width: 200px;" required>
					</div>
				</div>
				<br>
				<div class="form-group row">
					<label class="col-sm-2">학력</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="masSchool"
							id="masSchool" style="width: 200px; height: 100px;" required>
					</div>
				</div>
				<br>
				<div class="form-group row">
					<label class="col-sm-2">자격증</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="masCert" id="id"
							style="width: 200px;" required>
					</div>
				</div>
				<br>
				<div style="display: flex; justify-content: center; align-items: right;">
						<input type="submit" class="btn btn-info" onclick="/talkdog/maypage/memMyprofileMod.jsp" value="편집">
						<br>
						<input type="button" class="btn btn-secondary" onclick="/talkdog/maypage/memMyprofileMod.jsp" value="회원탈퇴">
				</div>

			</form>
		</div>
	</main>
	<br>
	<br>
	<br>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>