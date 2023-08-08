<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항/이벤트 글 수정</title>
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
          <li>공지사항/이벤트</li>
        </ol>
        <h2>${nvo.notCategory } 수정</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Insert Section ======= -->
    <section id="contact" class="contact">

        <div class="row" id="row">

          <div class="col-lg-6">
            <form action="./NoticeModify.do" method="post" role="form" class="php-email-form">
              <div class="row">
              	<c:set var="titleMsg" value="제목은 필수 입력 항목입니다."/>
				<c:set var="conMsg" value="내용은 필수 입력 항목입니다."/>
              </div>
              
              <div class="form-group mt-3">
              <label>분류</label>
				<select name="notCategory" id="notCategory">
                	<option value="공지사항" ${nvo.notCategory == '공지사항' ? 'selected' : '' }>공지사항</option>
                	<option value="이벤트" ${nvo.notCategory == '이벤트' ? 'selected' : '' }>이벤트</option>
                </select>
              </div>
              <div class="form-group mt-3">
              <label>작성일자</label>
				${nvo.notDate }
              </div>
              <div class="form-group mt-3">
              <label>제목</label>
                <input type="text" class="form-control" name="notTitle" id="notTitle" required value="${nvo.notTitle }"
                oninput="setCustomValidity('')" oninvalid="this.setCustomValidity('${titleMsg }')">
              </div>
              <div class="form-group mt-3">
              <label>내용</label>
                <textarea class="form-control" name="notCont" rows="5" required
                oninput="setCustomValidity('')" oninvalid="this.setCustomValidity('${conMsg }')">${nvo.notCont }</textarea>
              </div>
              <div class="form-group mt-3">
              <label>사진</label>
              <input type="file" class="form-control" name="notImage" id="notImage" value="${nvo.notImage }">
              </div>
            	
              <div class="my-3"></div>
              <div class="text-center"><button type="submit">수정하기</button></div>
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