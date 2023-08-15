<%@page import="java.util.Date"%>
<%@page import="talkdog.vo.ReviewVO"%>
<%@page import="talkdog.dao.ProductDAO"%>
<%@page import="talkdog.dao.ReviewDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="rvo" class="talkdog.vo.ReviewVO"/>
<jsp:useBean id="pdao" class="talkdog.dao.ProductDAO"/>
<jsp:useBean id="rdao" class="talkdog.dao.ReviewDAO"/>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    rvo.setReview(request.getParameter("review"));
    rvo.setpId(request.getParameter("pId"));
    rvo.setAdmId(request.getParameter("admId"));

    if (rdao.reviewEnroll(rvo)) {
%>
        <script>
            alert('리뷰 등록에 성공했습니다.');
            location.href = "/talkdog/product/productInfo.jsp?pid=<%= rvo.getpId() %>";
        </script>
<%    
    } else {
%>
        <script>
            alert('리뷰 등록에 실패했습니다.');
            history.back();
        </script>
<%
    }
%>