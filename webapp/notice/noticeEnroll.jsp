<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항/이벤트 글 등록</title>
</head>
<style>
	#notCategory { margin-left: 15px;}
	#row {display: flex; justify-content: center;}
	button[type=button] { background: #86E57F; border: 0; border-radius: 50px; padding: 10px 24px; color: #fff; transition: 0.4s; }
	button[type=button]:hover { background: #1DDB16;}
</style>
<body>
<%@ include file="/include/header.jsp" %>
<%
    request.setCharacterEncoding("UTF-8"); // 요청 데이터의 인코딩 설정
    response.setContentType("text/html; charset=UTF-8"); // 응답 데이터의 인코딩 설정
%>

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="/talkdog/index.jsp">Home</a></li>
          <li>공지사항/이벤트</li>
        </ol>
        <h2>공지사항/이벤트 글 등록</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Insert Section ======= -->
    <section id="contact" class="contact">

        <div class="row" id="row">

          <div class="col-lg-6">
            <form action="./NoticeWrite.do" method="post" role="form" class="php-email-form" enctype="multipart/form-data">
              <div class="row">
              	<c:set var="titleMsg" value="제목은 필수 입력 항목입니다."/>
				<c:set var="conMsg" value="내용은 필수 입력 항목입니다."/>
                <div class="col-md-6 form-group">
                <label>분류</label>
                <select name="notCategory" id="notCategory">
                	<option value="공지사항">공지사항</option>
                	<option value="이벤트">이벤트</option>
                </select>
                </div>
              </div>
              <div class="form-group mt-3">
              <label>제목</label>
                <input type="text" class="form-control" name="notTitle" id="notTitle" required
                oninput="setCustomValidity('')" oninvalid="this.setCustomValidity('${titleMsg }')">
              </div>
              <div class="form-group mt-3">
              <label>내용</label>
                <textarea class="form-control" name="notCont" rows="5" required
                oninput="setCustomValidity('')" oninvalid="this.setCustomValidity('${conMsg }')"></textarea>
              </div>
              <div class="form-group mt-3">
              <label>사진 등록</label>
              <input type="file" class="form-control" name="notImage" id="notImage">
              </div>
            	
              <div class="my-3"></div>
              <div class="text-center">
              <button type="button" onclick="history.back()">목록으로</button> 
              <button type="submit" onclick="insChk()">등록하기</button>
              </div>
              	<input type="hidden" name="type" value="${type }">
				<input type="hidden" name="keyword" value="${keyword }">
            </form>
          </div>

        </div>

    </section><!-- End Insert Section -->

  </main><!-- End #main -->

<%@ include file="/include/footer.jsp" %>
</body>

</html>
