<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<style>
.head {
	background: lightgray;
	font-size: 20px;
	padding-left: 30px
}

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

.nav {
	float: left;
	width: 200px;
	padding: 10px;
	display: inline-block;
}

.agree1 {
	padding: 10px;
	width: 500px;
	height: 100px;
	border: 1px solid black;
	overflow-y: scroll;
	width: 350px; /* y축으로 오버플로우 되는 것을 scroll방식으로 바꾸는 것 */
}

.text{
width: 200px;
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
			<h1 class="display-4 h1h">전문가 등록 신청</h1>
		</div>
	</div>
	<br>
	<%@ include file="../include/sideMenuMem.jsp"%>






	<!-- 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->

	<div>
		<main role="main">
			<div class="container divC">
				<form action="/talkdog/Common/masInsert.do" method="post" class="form-horizontal"  enctype="multipart/form-data">
				
					<div class="form-group row">
						<label class=""> 1) 정신 건강 분야 활동을 위한 관련 업무 경력을 증빙 가능한 아래의 서류 중 1개를 제출해주세요.<br>
							&nbsp;&nbsp;(인증 자격 범위: 석/박사 학위증, 정신과 의사 면허증)
						</label>
						<div class="">
							<br> <input type="file" class="form-control text" name="masPaper"
										id="masPaper" required accept=".pdf, .hwp">
						</div>
					</div>
					<span> </span>
					<div class="row" style="display: flex; align-items: center;">
						<label class=""> 2) 인증을 위한 자격증이나 졸업장을 업로드해주세요.(pdf/사진파일업로드) </label>
						<div class="">
							<div class="">
								<br> <input type="file" class="form-control" name="masSveri"
									id="masSveri" required accept=".pdf, .png, .jpg">
							</div>
						</div>
					</div>
					<span> </span>

					<div class="form-group row"
						style="display: flex; align-items: center;">
						<label class=""> 3) 전문가 등록 시 프로필에 나타날 프로필 정보(사진, 인증 받을 학력)를 입력해주세요. </label>
						<div class="">
							<br> <input type="file" class="form-control" name="masProf"
								id="masProf" required accept=".png, .jpg">
								<br>
								<input type="text" class="form-control" name="masIntro" id="masIntro"
									   placeholder="소개를 입력해주세요. 추후에 수정 가능합니다." value="aa">
								<br>
								<input type="text" class="form-control" name="masSchool" id="masSchool"
								       placeholder="학력을 입력해주세요." value="aa">

						</div>
					</div>
					`

					<div class="form-group row">
						<label class=""> 4) 개인 정보 제공 동의서 </label>
						<div class="">
							<div class="">
								<br>
									<div>
									    
										<p class="agree1">
											여러분을 환영합니다. 이것은 이용약관입니다. 이것은 이용약관입니다. 이것은 이용약관입니다. 이것은
											<br> 동의하십니까? 동의하십니까? 동의하십니까? 동의하십니까?
										</p>

										<label>
										<input type="radio" name="agree1" id="agree1" value="">
										       위 약관사항에 동의합니다.
										<input type="radio"
											   name="agree1" id="agree1" value="">동의하지않습니다.</label>
									</div>
								</div>
							</div>
						</div>

						<div
							style="display: flex; justify-content: center; align-items: center;">
							<input type="button" class="btn btn-secondary" onclick="history.back()" value="취소">
							<input type="submit" class="btn btn-info" onclick="" value="등록 신청">
						</div>
				</form>
			</div>
		</main>
	</div>
	<br>
	<br>
	<br>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>