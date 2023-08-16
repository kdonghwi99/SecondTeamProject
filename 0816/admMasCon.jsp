<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전문가 인증 관리</title>

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
	<script>
		alert('${msg}');
	</script>
	<%
	session.removeAttribute("msg");
	}
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4 h1h">전문가 인증 관리</h1>
		</div>
	</div>

	<br><%@ include file="../include/sideMenuAdm.jsp"%>

	<main role="main">
		<div class="container divC">
			<form action="/talkdog/Mypage/masReqConfirm.do" method="post">
				<%-- <!-- 게시물이 없는 경우 -->
		<c:if test="${empty boardList }">
		<div class="row">
			등록된 게시물이 없습니다.</div>
		</c:if> --%>

				<!-- 그렇지 않은 경우 -->
				<%-- <c:if test="${!empty boardList }"> --%>
				<%
				System.out.println("전문가 승인 리스트 불러오기 전");
				%>
				<div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>아이디</th>
								<th>이메일</th>
								<th>등록일자</th>
								<th>신청일자</th>
								<th>업로드 파일</th>
								<th>승인여부</th>
							</tr>
						</thead>
						<tbody>
							<tr>

								<c:forEach items="${amvolist }" var="amvo">
								<input type="hidden" name="admId" value="${amvo.masvo.admId}" > 
									<%
									System.out.println("여기로 들어오나");
									%>
									<tr>
										<td></td>
										<td>${amvo.avo.admName}</td>
										<td>${amvo.masvo.admId}</td>
										<td>${amvo.avo.admEmail}</td>
										<td>${amvo.avo.admRegi}</td>
										<td>${amvo.masvo.masRegi}</td>
										<td>${amvo.masvo.masPaper}${amvo.masvo.masSveri}</td>
										
										
										
										<td><input type="submit" class="btn btn-info"
											formaction="/talkdog/Mypage/masConfirm.do" value="승인">
											<input type="submit" class="btn btn-info"
											formaction="/talkdog/Mypage/masReject.do" value="거절"></td>
										<!-- onclick > button -->
									</tr>
								</c:forEach>
							</tr>
							<%
							System.out.println("전문가 승인");
							%>
						</tbody>
					</table>

					<!-- <%-- 페이징 --%>
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
			</ul> -->
				</div>
				<%-- </c:if> --%>

				<!-- <input type="hidden" name="pageNum" value="${pageNum }">	<%-- pageNum을 안 보내면 페이징 선택 시 에러뜸 --%> -->
			</form>
		</div>
	</main>



	<br>
	<br>
	<br>

	<%@ include file="../include/footer.jsp"%>

</body>
</html>