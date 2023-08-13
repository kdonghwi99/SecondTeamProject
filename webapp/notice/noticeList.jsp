<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항/이벤트</title>
</head>
<style>
.btnEnroll { background: #86E57F; border: 0; border-radius: 50px; padding: 15px 24px; color: #fff; transition: 0.4s; }
.btnEnroll:hover { background: #1DDB16; color: #fff;}
.btnsearch {
	background: #FFB2D9;
	border: 0;
	border-radius: 50px;
	padding: 7px 15px;
	color: #fff;
	transition: 0.4s;
}

.btnsearch:hover {
	background: #EDA0C7;
	color: #fff;
}
.bg-secondary { float:right;}
.custom-pagination .page-item.active .page-link {
		border-color : #e96b56;
        background-color: #e96b56; 
        color: white; 
    }
.custom-pagination .page-item .page-link { /* 비활성 버튼 스타일 */
		border-color : #e96b56;
        background-color: white; 
        color: #e96b56; 
    }
</style>
<body>
<%--공지/이벤트 목록 전체조회 --%>
<%@ include file="../include/header.jsp" %>
<%
    request.setCharacterEncoding("UTF-8"); // 요청 데이터의 인코딩 설정
    response.setContentType("text/html; charset=UTF-8"); // 응답 데이터의 인코딩 설정
%>

<!-- 공지사항 글 등록/수정/삭제 완료 메시지가 있는 경우, noticeList.jsp로 돌아오면서 msg내용을 alert으로 띄우기 --> 
<c:if test="${!empty msg }">
	<script>
			alert('${msg}');
	</script>
	<%session.removeAttribute("msg"); 	//alert 띄우고 msg속성 초기화(제거)%>
</c:if>

<!-- <span class="badge badge-secondary">전체 게시물 ${totalCnt }건</span>출력되는지 체크해봄   -->

<!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="/talkdog/index.jsp">Home</a></li>
          <li>공지사항/이벤트</li>
        </ol>
        <h2>${category }</h2>

      </div>
    </section><!-- End Breadcrumbs -->

<main role="main">
<section id="portfolio" class="portfolio">
	<div class="container">
	<!-- boardList.do에서  -->
	<div class="row">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="portfolio-flters">
              <li><a href="/talkdog/Notice/NoticeList.do?pageNum=1&type=&keyword=&category=공지사항">공지사항</a></li>
              <li><a href="/talkdog/Notice/NoticeList.do?pageNum=1&type=&keyword=&category=이벤트">이벤트</a></li>
            </ul>
          </div>
        </div>
	<form action="./NoticeList.do" method="get">
	<div class="row mb-3">
		<div class="col-8"> 
				<%-- <select name="category" id="category">
                	<option value="공지사항" ${category == '공지사항' ? 'selected' : '' }>공지사항</option>
                	<option value="이벤트" ${category == '이벤트' ? 'selected' : '' }>이벤트</option>
                </select> --%>
				<select name="type">
					<option value="not_title" ${type == 'not_title' ? 'selected' : '' }>제목에서</option>
					<option value="not_cont" ${type == 'not_cont' ? 'selected' : '' }>내용에서</option>
				</select>
				<input type="text" name="keyword" value="${keyword != '' ? keyword : '' }">
				<input type="hidden" name="category" value="${category }">
				<input type="submit" class="btnsearch" value="검색">	
		</div>
		
			<div class="text-right"> 
				<span class="badge bg-secondary">
					전체 게시물 ${totalCnt }건</span>
			</div>
	</div>

		<!-- 게시물이 없는 경우 -->
		<c:if test="${empty noticeList }">
			<div class="row">
			<div class="col" align="center"> 
				<p class="alert alert-success p-5">
					등록된 글이 없습니다.
				</p></div></div>
		</c:if>
			
		<!-- 게시물이 있는 경우 -->
		<c:if test="${!empty noticeList }">						
			<div>
				<table class="table table-hover">
				<thead>
				<tr><th class="text-center">No.</th>
						<th class="text-center">분류</th>
						<th class="text-center">제목</th>
						<th class="text-center">작성자</th>
						<th class="text-center">작성일자</th>
						<th class="text-center">조회수</th>
				</tr>
				</thead>
					
				<tbody>
				<c:forEach items="${noticeList }" var="nvo">
				<tr>
					<td class="text-center">${nvo.notRn }</td>
					<td class="text-center">${nvo.notCategory }</td>
					<td class="text-center"><a href="./NoticeView.do?notNo=${nvo.notNo }&id=admin&pageNum=${pageNum }&type=${type }&keyword=${keyword }&category=${category }" >${nvo.notTitle }</a></td>
					<td class="text-center">관리자</td>
					<td class="text-center"><fmt:formatDate value="${nvo.notDate }" type="date" dateStyle="long"/></td>
					<td class="text-center">${nvo.notHit }</td>
				</tr>				
				</c:forEach>
				</tbody>
				</table>
	
				<%-- 페이징 --%>
				<ul class="pagination justify-content-center custom-pagination">
					<%-- 이전 버튼 --%>
					<c:if test="${prev == true }">
					<li class="page-item ">
						<a href="./NoticeList.do?pageNum=${start-1 }&type=${type }&keyword=${keyword }&category=${category }" class="page-link">&laquo; 이전</a> 
					</c:if>
					
					<%-- 페이지 번호 버튼 --%>
					<c:forEach begin="${start }" end="${end }" var="i">
						<c:url var="link" value="./NoticeList.do?pageNum=${i }&type=${type }&keyword=${keyword }&category=${category }"/>		<%-- pageNum에 해당하는 페이지로 넘어가게 하는 링크를 변수에 담음 --%>
						<li class="page-item ${pageNum == i ? 'active' :  '' }">
							<a href="${pageNum == i ? '#' : link }" class="page-link">${i }</a>		<%-- pageNum이 현재 페이지와 같다면 이동하지 않고, 다르다면 pageNum에 해당하는 페이지로 이동 --%>
					</c:forEach>
					
					<%-- 다음 버튼 --%>
					<c:if test="${next == true}">
					<li class="page-item">
						<a href="./NoticeList.do?pageNum=${end + 1 }&type=${type }&keyword=${keyword }&category=${category }" class="page-link">다음 &raquo;</a>
					</c:if>
				</ul>
			</div>
		</c:if><!-- END 게시물이 있는 경우 -->
		
		<c:if test="${sessionScope.sid != null && sessionScope.sid == 'admin'}">
		<div class="text-right">
			<a href="./NoticeWriteForm.do" class="btnEnroll">등록하기</a><br><br><br>
		</div>
		</c:if>
		<input type="hidden" name="pageNum" value="${pageNum }"/>	<%-- pageNum을 안 보내면 페이징 선택 시 에러뜸 --%>
		<input type="hidden" name="category" value="${category }"/>
	</form>
	</div>
	</section>
</main>

<%@ include file="../include/footer.jsp" %>
</body>
</html>
