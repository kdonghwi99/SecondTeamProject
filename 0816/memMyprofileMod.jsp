<%@page import="talkdog.vo.MasterVO"%>
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
				<div class="form-group row">
					<label class="col-sm-2">프로필 이미지</label>
					<div class="col-sm-3">
						<img src="../resources/images/${masvo.masProf }" alt="프로필 이미지"
							style="width: 100%"> <input type="file"
							class="form-control text" name="masProf" id="masProf" required
							accept=".jpg, .jpeg, .png">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">이름</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="admName"
							id="admName" required>
					</div>
				</div>
				<br>
				<div class="form-group row">
					<label class="col-sm-2">소개</label>
					<div class="col-sm-3">
						<input type="text" class="form-control"
							style="width: 200px; height: 100px;" name="masIntro"
							id="masIntro" value="${masvo.admAuth }">
					</div>
				</div>
				<br>
				<div class="form-group row">
					<label class="col-sm-2">경력</label>
					<div class="col-sm-3">
						<input type="text" type="text" class="form-control"
							style="width: 200px; height: 100px;" name="masAuth" id="masAuth"
							value="${masvo.admAuth }">
					</div>
				</div>
				<br>
				<div class="form-group row">
					<label class="col-sm-2">의원정보</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="id" id="id"
							style="width: 200px;" value="${masvo.admAuth }">
					</div>
				</div>
				<br>
				<div class="form-group row">
					<label class="col-sm-2">학력</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="id" id="id"
							style="width: 200px; height: 100px;" value="${masvo.admAuth }">
					</div>
				</div>
				<br>
				<div class="form-group row">
					<label class="col-sm-2">자격증</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="id" id="id"
							style="width: 200px;" value="${masvo.admAuth }">
					</div>
				</div>
				<br>
				<div
					style="display: flex; justify-content: center; align-items: center;">
					<input type="button" class="btn btn-info" onclick="" value="취소">
					<input type="submit" class="btn btn-info" value="저장">
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