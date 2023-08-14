<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout.jsp</title>
</head>
<body>
	<!-- msg에 out 담기 -->
	<%
	session.invalidate();	// 세션 무효화(로그아웃)
	response.sendRedirect("../common/messages.jsp?msg=out");
	%>
</body>
</html>