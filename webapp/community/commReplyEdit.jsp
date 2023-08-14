<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	#notCategory { margin-left: 15px;}
	#row {display: flex; justify-content: center;}
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
        <h2>댓글 수정</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Insert Section ======= -->
    <section id="contact" class="contact">

        <div class="row" id="row">

          <div class="col-lg-6">
            <form action="./CmreModify.do" method="get" role="form" class="php-email-form">
              <div class="row">
				<c:set var="conMsg" value="내용은 필수 입력 항목입니다."/>
              </div>
              
              <div class="form-group mt-3 ">
              <label>작성자</label>
				${cmrevo.cmreNick }
              </div>
              <div class="form-group mt-3">
              <label>작성일자</label>
				<fmt:formatDate value="${cmrevo.cmreDate }" type="date" dateStyle="long"/>
              </div>
              <div class="form-group mt-3">
              <label>댓글 내용</label>
              <textarea class="form-control" name="cmreCont" rows="2" required
                oninput="setCustomValidity('')" oninvalid="this.setCustomValidity('${conMsg }')">${cmrevo.cmreCont}</textarea>
              </div>
            	
              <div class="my-3"></div>
              <div class="text-center"><button type="submit">수정하기</button></div>
				<input type="hidden" name="cmNo" value="${cmNo }">
				<input type="hidden" name="cmreNo" value="${cmrevo.cmreNo }">
				<input type="hidden" name="sid" value="${sessionScope.sid }">
				<input type="hidden" name="catNo" value="${catNo }">
            </form>
          </div>

        </div>

    </section><!-- End Insert Section -->

  </main><!-- End #main -->

<%@ include file="/include/footer.jsp" %>
</body>

</html>
