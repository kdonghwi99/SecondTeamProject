<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="avo" class="talkdog.vo.AdminVO" scope="application"/>
    <jsp:setProperty property="*" name="avo"/>	
    <jsp:useBean id="adao" class="talkdog.dao.AdminDAO"/>	
    <jsp:setProperty property="con" name="adao" value="${con}"/>
<%

if(adao.login(avo)) {
	// msg에 login 저장하고 messages.jsp로 리다이렉트
	session.setAttribute("sid", avo.getAdmId());
	
	response.sendRedirect("../index.jsp?msg=login");	 //빨간 글쉬..
} else{
// 그렇지 않은 경우
	// 파라미터의 msg 속성에 fail을 저장하고 login.jsp로 리다이렉트
	response.sendRedirect("login.jsp?msg=fail");
}


%>