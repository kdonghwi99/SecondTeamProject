<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@ include file="/include/header.jsp"%>

	<br>
	<br>
	<br>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">🔓로그인</h1>
		</div>
	</div>

	<main role="main">
		<div class="container" align="center">
			<div class="col-md-4 col-md-offset-4">
				<!-- <h3 class="form-signin-heading">
				Please sign in</h3> -->

				<!-- msg 값에 fail이면 보이게 > 여길 ajax-->
				<c:if test="${param.msg == 'fail' }">
					<div class="alert alert-danger">
						아이디 또는 비밀번호가 일치하지 않습니다.
					</div>
				</c:if>
<!--name="admId"(vo랑 맞춤)  -->
				<form action="loginproc.jsp" method="post" class="form-signin">
					<div class="form-group" style="display: flex; margin:10px;">
						<!-- <label class="sr-only">아이디</label> -->
						<input type="text" name="admId" class="form-control length"
							placeholder="아이디" required autofocus>
						　	
						<input type="submit" formaction="/talkdog/common/loginproc.jsp"
							class="login btn btn-lg btn-block btn-warning" value="로그인">
					</div>

					<div class="form-group" style="display: flex;  margin:10px;">
						<!-- <label class="sr-only">비밀번호</label> -->
						<input type="password" name="admPw"
							class="form-control length" placeholder="비밀번호" required autofocus>
						　
						<input type="submit" formaction="/talkdog/common/join.jsp"
							class="regi btn btn-lg btn-block btn-info" value="회원가입">
					</div>

					<a href="/talkdog/common/findId.jsp" class="findid">아이디 찾기</a>
					　　<!-- 아마 href는 .do가 안되나보다 -->
					<a href="/talkdog/common/findId.jsp" class="findpw">비밀번호 찾기</a>
				</form>
			</div>
		</div>
	</main>

	<br>
	<br>
	<br>
	<%@ include file="/include/footer.jsp"%>
</body>
</html>