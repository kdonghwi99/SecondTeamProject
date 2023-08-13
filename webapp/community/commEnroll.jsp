<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>커뮤니티 글 등록</title>
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
<c:if test="${sid == null }">		<!-- 로그인 안 했을 경우 로그인 창으로 넘기기 -->
	<script>
        alert("로그인이 필요한 메뉴입니다.");
        window.location.href = "../common/login.jsp";
	</script>
</c:if>
  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="/talkdog/index.jsp">Home</a></li>
          <li>커뮤니티</li>
        </ol>
        <h2>커뮤니티 글 등록</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Insert Section ======= -->
    <section id="contact" class="contact">

        <div class="row" id="row">

          <div class="col-lg-6">
            <form action="./CommWrite.do" method="post" role="form" class="php-email-form">
              <div class="row">
              	<c:set var="titleMsg" value="제목은 필수 입력 항목입니다."/>
				<c:set var="conMsg" value="내용은 필수 입력 항목입니다."/>
				</div>
                <div class="mt-3 form-group">
                <label>카테고리</label>
                <select name="catNo" id="catNo">
                	<option value="1">사랑</option>
                	<option value="2">정신건강</option>
                	<option value="3">취업/학업</option>
                	<option value="4">인간관계</option>
                	<option value="5">기타</option>
                </select>
                </div>
              <div class="form-group mt-3">
              <label>제목</label>
                <input type="text" class="form-control" name="cmTitle" id="cmTitle" required
                oninput="setCustomValidity('')" oninvalid="this.setCustomValidity('${titleMsg }')">
              </div>
              <div class="form-group mt-3">
              <label>내용</label>
                <textarea class="form-control" name="cmCont" rows="5" required
                oninput="setCustomValidity('')" oninvalid="this.setCustomValidity('${conMsg }')"></textarea>
              </div>
            	
              <div class="my-3"></div>
              <div class="text-center">
              <button type="button" onclick="history.back()">목록으로</button> 
              <button type="submit" onclick="insChk()">작성하기</button>
              </div>
              	<input type="hidden" name="type" value="${type }">
				<input type="hidden" name="keyword" value="${keyword }">
				<input type="hidden" name="sid" value="${sessionScope.sid }">
            </form>
          </div>

        </div>

    </section><!-- End Insert Section -->

  </main><!-- End #main -->

<%@ include file="/include/footer.jsp" %>
</body>

</html>
