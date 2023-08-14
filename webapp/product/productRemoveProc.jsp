<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
	if((confirm('해당 상품을 삭제하시겠습니까?')==false)){
		history.back();
	}	
</script>

<jsp:useBean id="pdao" class="talkdog.dao.ProductDAO"></jsp:useBean>

<%
	String pid = request.getParameter("pid");
	if(pdao.productDelete(pid)){
%>
	<script>
	alert('상품이 삭제되었습니다.');
	location.href = "productlist.jsp"; 
	</script>
<%
	} else {
%>
	<script>
		alert('상품 삭제에 실패했습니다.');
		history.back();
	</script>
<%
	}
%>
