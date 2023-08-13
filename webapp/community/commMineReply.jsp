<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
.custom-pagination .page-item.active .page-link {
		border-color : #e96b56;
        background-color: #e96b56; 
        color: white; }
.custom-pagination .page-item .page-link { /* 비활성 버튼 스타일 */
		border-color : #e96b56;
        background-color: white; 
        color: #e96b56; }
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
</style>
<body>
<%@ include file="/include/header.jsp" %>

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="/talkdog/index.jsp">Home</a></li>
          <li>커뮤니티</li>
        </ol>
        <h2>내가 작성한 커뮤니티 댓글 보기</h2>

      </div>
    </section><!-- End Breadcrumbs -->
    
<!-- 커뮤니티 글 등록/수정/삭제 완료 메시지가 있는 경우, commList.jsp로 돌아오면서 msg내용을 alert으로 띄우기 --> 
<c:if test="${!empty msg }">
	<script>
			alert('${msg}');
	</script>
	<%session.removeAttribute("msg"); 	//alert 띄우고 msg속성 초기화(제거)%>
</c:if>

    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
      <div class="container">
		<div class="row">
        </div>
        <form action="./CmreList.do" method="get">
	<div class="row mb-3">
		<div class="col-8"> 
				<input type="hidden" name="type" value="cmre_cont">
				<input type="text" name="keyword" value="${keyword != '' ? keyword : '' }" placeholder="내용으로 검색하세요">
				<input type="hidden" name="sid" value="${sessionScope.sid }">
				<input type="submit" class="btnsearch" value="검색">	
		</div>
		
			<div class="text-right"> 
				<span class="badge bg-secondary">
					내가 작성한 댓글 ${totalCnt }건</span>
			</div>
	</div>

		<!-- 게시물이 없는 경우 -->
		<c:if test="${empty cmreListPersonal }">
			<div class="row">
			<div class="col" align="center"> 
				<p class="alert alert-success p-5">
					작성한 글이 없습니다.
				</p></div></div>
		</c:if>
			
		<!-- 게시물이 있는 경우 -->
		<c:if test="${!empty cmreListPersonal }">						
			<div>
				<table class="table table-hover">
				<thead>
				<tr><th class="text-center">No.</th>
						<th class="text-center">댓글</th>
						<th class="text-center">작성자</th>
						<th class="text-center">작성일자</th>
				</tr>
				</thead>
					
				<tbody>
				<c:forEach items="${cmreListPersonal }" var="cmrevo">
				<tr>
					<td class="text-center">${cmrevo.cmreRn }</td>
					<td class="text-center"><a href="./CommView.do?cmNo=${cmrevo.cmNo }&admId=${sessionScope.sid }&pageNum=${pageNum }&type=${type }&keyword=${keyword }&catNo=0" >${cmrevo.cmreCont }</a></td>
					<td class="text-center">${cmrevo.cmreNick }</td>
					<td class="text-center"><fmt:formatDate value="${cmrevo.cmreDate }" type="date" dateStyle="long"/></td>
				</tr>				
				</c:forEach>
				</tbody>
				</table>
	
				<%-- 페이징 --%>
				<ul class="pagination justify-content-center custom-pagination">
					<%-- 이전 버튼 --%>
					<c:if test="${prev == true }">
					<li class="page-item ">
						<a href="./CmreList.do?pageNum=${start-1 }&type=${type }&keyword=${keyword }&sid=${sessionScope.sid }" class="page-link">&laquo; 이전</a> 
					</c:if>
					
					<%-- 페이지 번호 버튼 --%>
					<c:forEach begin="${start }" end="${end }" var="i">
						<c:url var="link" value="./CmreList.do?pageNum=${i }&type=${type }&keyword=${keyword }&sid=${sessionScope.sid }"/>		<%-- pageNum에 해당하는 페이지로 넘어가게 하는 링크를 변수에 담음 --%>
						<li class="page-item ${pageNum == i ? 'active' :  '' }"> 
							<a href="${pageNum == i ? '#' : link }" class="page-link">${i }</a>		<%-- pageNum이 현재 페이지와 같다면 이동하지 않고, 다르다면 pageNum에 해당하는 페이지로 이동 --%>
					</c:forEach>
					
					<%-- 다음 버튼 --%>
					<c:if test="${next == true}">
					<li class="page-item">
						<a href="./CmreList.do?pageNum=${end+1 }&type=${type }&keyword=${keyword }&sid=${sessionScope.sid }" class="page-link">다음 &raquo;</a>
					</c:if>
				</ul>
			</div>
		</c:if><!-- END 게시물이 있는 경우 -->
		
		<input type="hidden" name="pageNum" value="${pageNum }"/>	<%-- pageNum을 안 보내면 페이징 선택 시 에러뜸 --%>
	</form>
	</div>

    </section><!-- End Portfolio Section -->

  </main><!-- End #main -->

<%@ include file="/include/footer.jsp" %>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>
