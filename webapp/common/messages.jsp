<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="talkdog.vo.AdminVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>messages.jsp</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" 
integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<style>
@import url("https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css");
@font-face {font-family: 'Dongle'; src: url("/webz/resources/Dongle-Regular.ttf")}
body {font-family: Dongle; }
.btn-secondary {margin-left: 30px; margin-top: 30px;}
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-4">
			✉Message</h1></div></div>

<main role="main">
   <div class="container">
   		<div class=row>
	      	<div class="col" align="center">
				<p class="alert alert-danger p-5">
				
				<c:if test="${param.msg == 'out' }">
						로그아웃이 완료되었습니다.<br>
						이용해주셔서 감사합니다.	
			 	</c:if>
					<!-- 파라미터의 msg 값이 out인 경우
						 '로그아웃이 완료되었습니다.
						 이용해주셔서 감사합니다' 출력 -->
				<c:if test="${param.msg == 'join' }">
						회원가입이 완료되었습니다.<br>
						로그인 후 이용해주세요.	
			 	</c:if>
			 	<c:if test="${param.msg == 'joinFail' }">
						회원가입에 실패하였습니다.<br>
						다시 시도해주세요.	
			 	</c:if>
			 	<c:if test="${param.msg == 'login' }">
						${sessionScope.sid}님 어서오세요!<br>
			 	</c:if>
			 	<c:if test="${param.msg == 'modify' }">
						회원 정보가 변경되었습니다.<br>
			 	</c:if>
			 	<c:if test="${param.msg == 'modifyFail' }">
						회원 정보 변경에 실패하였습니다.<br>
			 	</c:if>
			 	<c:if test="${param.msg == 'rem' }">
						회원 탈퇴가 완료되었습니다.<br>
			 	</c:if>	
			 	<c:if test="${param.msg == 'remFail' }">
						회원 탈퇴에 실패하였습니다.<br>
			 	</c:if>	
			 			 
				</p>		 
			</div>
		</div>	
	</div>
</main>	


<%@ include file="../include/footer.jsp" %>	

</body>
</html>
