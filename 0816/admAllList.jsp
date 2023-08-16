<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>allMemberList</title>

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
	
	<%
	String msg = (String) session.getAttribute("msg");
	if (msg != null) {
%>
<script>alert('${msg}');</script>
<% 
	session.removeAttribute("msg"); 
	} 
%>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-4 h1h">
			이용자 관리</h1>
	</div>
</div>	

<br><%@ include file="../include/sideMenuAdm.jsp"%>

<main role="main">
	<div class="container divC">
		<form action="" method="post">
		<%-- <!-- 게시물이 없는 경우 -->
		<c:if test="${empty boardList }">
		<div class="row">
			등록된 게시물이 없습니다.</div>
		</c:if> --%>
		
		<!-- 그렇지 않은 경우 -->
		<%-- <c:if test="${!empty boardList }"> --%>
		<div class="row mb-3">
			<div class="col-8"> 
				<select name="type">
					<option value="subject">전체</option>
					<option value="content">일반회원</option>
					<option value="id">전문가</option>
				</select>
				<input type="text" name="keyword" value="${keyword != '' ? keyword : '' }">
				<input type="submit" class="btn btn-info btn-sm" value="검색">	
				</div>
			<div class="col-4 text-right"> 
				<span class="badge badge-secondary">
					전체 게시물 ${totalCnt }건</span></div></div>
					
		<div>
			<table class="table table-hover">
			<thead>
				<tr><th>번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>회원종류</th>
					<th>등록일자</th></tr></thead>
				
			<tbody>
			<c:forEach items="${boardList }" var="bvo">
			<tr><td>${bvo.num }</td>
				<td><a href="./BoardView.do?num=${bvo.num }&id=${bvo.id }&pageNum=${pageNum }&type=${type }&keyword=${keyword }">${bvo.subject }</a></td>
 				<td><fmt:formatDate value="${bvo.regDate }" type="date" dateStyle="long"/></td>
				<td>${bvo.hit }</td>
				<td>${bvo.id }</td></tr>				
			</c:forEach>
			</tbody>
			</table>
			
			<%-- 페이징 --%>
			<ul class="pagination justify-content-center">
				<%-- 이전 버튼 --%>
				<c:if test="${prev == true }">
				<li class="page-item">
					<a href="./BoardList.do?pageNum=${start - 1 }&type=${type }&keyword=${keyword }" class="page-link">&laquo; Previous</a>
				</c:if>	
				
				<%-- 페이지 번호 버튼 --%>	
				<c:forEach begin="${start }" end="${end }" var="i">
				<c:url var="link" value="./BoardList.do?pageNum=${i }&type=${type }&keyword=${keyword }"></c:url>
				<li class="page-item ${pageNum == i ? 'active' : '' }">
					<a href="${pageNum == i ? '#' : link }" class="page-link">${i }</a>	
				</c:forEach>	
				
				<%-- 다음 버튼 --%>	
				<c:if test="${next == true }">	
				<li class="page-item">
					<a href="./BoardList.do?pageNum=${end + 1}&type=${type }&keyword=${keyword }" class="page-link">Next &raquo;</a>
				</c:if>
			</ul>
		</div>
		<%-- </c:if> --%>
		<input type="hidden" name="pageNum" value="${pageNum }">	<%-- pageNum을 안 보내면 페이징 선택 시 에러뜸 --%>
		</form>
	</div></main>	
	
	

	<br>
	<br>
	<br>

	<%@ include file="../include/footer.jsp"%>

</body>
</html>