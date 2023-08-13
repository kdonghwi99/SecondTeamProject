<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>커뮤니티 글 수정</title>
</head>
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
        <h2>글 수정</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Insert Section ======= -->
    <section id="contact" class="contact">

        <div class="row" id="row">

          <div class="col-lg-6">
            <form action="./CommModify.do" method="get" role="form" class="php-email-form">
              <div class="row">
              	<c:set var="titleMsg" value="제목은 필수 입력 항목입니다."/>
				<c:set var="conMsg" value="내용은 필수 입력 항목입니다."/>
              </div>
              
              <div class="form-group mt-3 ">
              <label>조회수</label>
				${cmvo.cmHit }
              </div>
              <div class="form-group mt-3 ">
              <label>공감수</label>
				${cmvo.cmHeart }
              </div>
              <div class="form-group mt-3 ">
              <label>작성자</label>
				${cmvo.cmNick }
              </div>
              <div class="form-group mt-3 ">
              <label>카테고리</label>
				<select name="catNo" id="catNo">
                	<option value="1" ${cmvo.catNo == '1' ? 'selected' : '' }>사랑</option>
                	<option value="2" ${cmvo.catNo == '2' ? 'selected' : '' }>정신건강</option>
                	<option value="3" ${cmvo.catNo == '3' ? 'selected' : '' }>취업/학업</option>
                	<option value="4" ${cmvo.catNo == '4' ? 'selected' : '' }>인간관계</option>
                	<option value="5" ${cmvo.catNo == '5' ? 'selected' : '' }>기타</option>
                </select>
              </div>
              <div class="form-group mt-3">
              <label>작성일자</label>
				<fmt:formatDate value="${cmvo.cmDate }" type="date" dateStyle="long"/>
              </div>
              <div class="form-group mt-3">
              <label>제목</label>
              <input type="text" class="form-control" name="cmTitle" id="cmTitle" required value="${cmvo.cmTitle }"
                oninput="setCustomValidity('')" oninvalid="this.setCustomValidity('${titleMsg }')">
              </div>
              <div class="form-group mt-3">
              <label>내용</label>
              <textarea class="form-control" name="cmCont" rows="5" required
                oninput="setCustomValidity('')" oninvalid="this.setCustomValidity('${conMsg }')">${cmvo.cmCont}</textarea>
              </div>
            	
              <div class="my-3"></div>
              <div class="text-center"><button type="submit" onclick="updChk()">수정하기</button></div>
              	<input type="hidden" name="type" value="${type }">
              	<input type="hidden" name="pageNum" value="${pageNum }"/>
				<input type="hidden" name="keyword" value="${keyword }">
				<input type="hidden" name="cmNo" value="${cmvo.cmNo }">
            </form>
          </div>

        </div>

    </section><!-- End Insert Section -->

  </main><!-- End #main -->

<%@ include file="/include/footer.jsp" %>
</body>

</html>
