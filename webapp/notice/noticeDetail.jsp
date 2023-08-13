<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항/이벤트 글</title>
</head>
<style>
	#row {display: flex; justify-content: center;}
	button[type=button] { background: #6799FF; border: 0; border-radius: 50px; padding: 10px 24px; color: #fff; transition: 0.4s; }
	button[type=button]:hover { background: #4374D9;}
	.btnlist { background: #86E57F; border: 0; border-radius: 50px; padding: 15px 24px; color: #fff; transition: 0.4s; }
	.btnlist:hover { background: #1DDB16; color: #fff;}
	.form-group label {
        font-weight: bold;
    }
    .form-group {			/* 표 형태로 요소들 정렬 */
        display: table-row;
    }
    .form-group label,
    .form-group div {
        display: table-cell;
        padding: 5px 15px; /* 적절한 간격 조정 */
    }
	
</style>
<body>
<%@ include file="/include/header.jsp" %>
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
          <li>공지사항/이벤트</li>
        </ol>
        <h2>${category }</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Insert Section ======= -->
    <section id="contact" class="contact">

        <div class="row" id="row">

          <div class="col-lg-6">
            <form action="./NoticeModifyForm.do" method="post" role="form" class="php-email-form">
              <div class="row">
              	<c:set var="titleMsg" value="제목은 필수 입력 항목입니다."/>
				<c:set var="conMsg" value="내용은 필수 입력 항목입니다."/>
			  </div>
			  
              <div class="form-group mt-3 notCategory">
              <label>분류</label>
				${nvo.notCategory }
              </div>
              <div class="form-group mt-3">
              <label>작성일자</label>
				<fmt:formatDate value="${nvo.notDate }" type="date" dateStyle="long"/>
              </div>
              <div class="form-group mt-3">
              <label>제목</label>
				${nvo.notTitle }
              </div>
              <div class="form-group mt-3">
              <label>내용</label>
				${nvo.notCont}
              </div>
              <c:if test="${nvo.notImage != '../resources/images/null' }">
              <div class="text-center">
              <img src="${nvo.notImage}" alt="이미지" width="500" height="700">
              </div>
              </c:if>
            	
              <div class="my-3"></div>
             <c:if test="${sid != null && sid == 'admin'}">
             <button type="submit">수정</button>
			 <button type="button" onclick="delChk()">삭제</button> 
			 </c:if>
				
             <a href="./NoticeList.do?pageNum=${pageNum }&type=${type }&keyword=${keyword }&category=${category }" class="btnlist text-center">목록으로</a>
              	<input type="hidden" name="type" value="${type }">
              	<input type="hidden" name="pageNum" value="${pageNum }">
				<input type="hidden" name="keyword" value="${keyword }">
				<input type="hidden" name="category" value="${category }">
				<input type="hidden" name="notNo" value="${nvo.notNo }">
				
            </form>
          </div>

        </div>

    </section><!-- End Insert Section -->

  </main><!-- End #main -->

<%@ include file="/include/footer.jsp" %>
</body>

</html>
