<%@page import="talkdog.vo.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변대기중인 문의글</title>
<style type="text/css">
#RegiBtn{ font-weight: bold;  
				color: white;
				float: right;}

.bg-secondary { float:right;}

.custom-pagination .page-item.active .page-link {
		border-color : 	#2E8B57;
        background-color: 	#2E8B57; 
        color: white; 
    }
.custom-pagination .page-item .page-link { /* 비활성 버튼 스타일 */
		border-color : 	#2E8B57;
        background-color: white; 
        color: 	#2E8B57; 
    }
tbody a { color : 	#2E8B57; }
tbody a:hover { color : black; }

</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="jumbotron">
	<div class="container">
		<br>
		<h1 class="display-4">답변대기중인 문의글</h1>
	</div>
</div>

<main role="main">
	<div class="container">
	<!-- boardList.do에서  -->
<!--  <form action="./Qna/listWaiting.do" method="post"> -->	
	<form action="./listWaiting.do" method="get">
	<div class="row mb-3">
	<div class="col-8">
		<%-- 기존 category값이 있는지 없는지 체크 --%>
		<c:set var="type" value="${empty param.category ? '문의카테고리' : param.category}" />
			<select name=category>
				<%-- 검색한 후에 선택했던 것들이 자동으로 selected 되도록 el 사용 --%>
				<option ${type eq '문의카테고리' ? 'selected' : '' }value="">전체보기</option>
				<option ${type eq '주문관련' ? 'selected' : ' ' }>주문관련</option>
				<option ${type eq '배송관련' ? 'selected' : ' '}>배송관련</option>
				<option ${type eq '커뮤니티' ? 'selected' : ' '}>커뮤니티</option>
				<option ${type eq '기타' ? 'selected' : ' '}>기타</option>
			</select> 
			<input type="hidden" name="pageNum" value="1"/>
			<input type="submit" class="btn btn-outline-success btn-sm" value="모아보기">
			<br>
	</div>
	<div class="text-right"> 
				<span class="badge bg-secondary">전체 게시물 ${qnaCnt }건</span>
	</div>
	</div>

		<!-- 게시물이 없는 경우 -->
		<c:if test="${empty qvoList }">
			<div class="row">
			<div class="col" align="center"> 
				<p class="alert alert-success p-5">
					답변대기중인 문의글이 없습니다.
				</p></div></div>
		</c:if>
			
		<!-- 게시물이 있는 경우 -->
		<c:if test="${!empty qvoList }">						
			<div>
				<table class="table table-hover">
				<thead>
				<tr><th class="text-center">No.</th>
						<th class="text-center">답변현황</th>
						<th class="text-center">카테고리</th>
						<th class="text-center">제목</th>
						<th class="text-center">작성자</th>
						<th class="text-center">작성일</th>
				</tr>
				</thead>
					
				<tbody>
				<c:forEach items="${qvoList }" var="qvo">
					<%-- 문의글 제목 눌렀을 때 이동할 (상세조회링크+파라미터)를 변수에 담음 --%>
					<c:url var="qViewLink" value="./View.do">
						<c:param name="pageNum" value="${pageNum }"/>
						<c:param name="category" value="${category }"/>
						<c:param name="qnaNo" value="${qvo.qnaNo }"/>
						<%-- <c:param name="admId" value="${bvo.admId }"/>	
									sid, id는 원래 본인인지 확인해서 조회수 올릴지 말지 체크하는 거였는데, 지금은 필요한지?--%>
					</c:url>
				<tr>
					<td class="text-center">${qvo.qnaRn }</td>
					<td class="text-center">${qvo.qnaAnswer }</td>
					<td class="text-center">${qvo.qnaCategory }</td>
					<%--<td><a href="./Qna/View.do?pageNum=${pageNum }&category=${category}&qnaNo=${qvo.qnaNo}"> 아래 링크의 오리지널버전 --%>
					<td class="text-center"><a href="${qViewLink }" >${qvo.qnaTitle }</a></td>
					<td class="text-center">${qvo.admId }</td>
					<td class="text-center">${qvo.qnaDate }</td>
				</tr>				
				</c:forEach>
				</tbody>
				</table>
	
				<%-- 페이징 --%>
				<ul class="pagination justify-content-center custom-pagination">
					<%-- 이전 버튼 --%>
					<c:if test="${prev }">
					<li class="page-item ">
						<a href="./listWaiting.do?pageNum=${start-1 }&category=${category }" class="page-link">&laquo;Previous</a> 
					</c:if>
					
					<%-- 페이지 번호 버튼 --%>
					<c:forEach begin="${start }" end="${end }" var="i">
						<c:url var="link" value="./listWaiting.do?pageNum=${i }&category=${category }"/>		<%-- pageNum에 해당하는 페이지로 넘어가게 하는 링크를 변수에 담음 --%>
						<li class="page-item ${pageNum == i ? 'active' :  '' }">
							<a href="${pageNum == i ? '#' : link }" class="page-link">${i }</a>		<%-- pageNum이 현재 페이지와 같다면 이동하지 않고, 다르다면 pageNum에 해당하는 페이지로 이동 --%>
					</c:forEach>
					
					<%-- 다음 버튼 --%>
					<c:if test="${next }">
					<li class="page-item">
						<a href="./listWaiting.do?pageNum=${end+1 }&category=${category }" class="page-link">Next»</a>
					</c:if>
				</ul>
			</div>
		</c:if><!-- END 게시물이 있는 경우 -->

		<input type="hidden" name="pageNum" value="${pageNum }"/><%--글쓴 이후에 목록으로 돌아올 때를 위함 --%>
	</form>
	</div>
</main>

<%@ include file="../include/footer.jsp" %>
</body>
</html>
