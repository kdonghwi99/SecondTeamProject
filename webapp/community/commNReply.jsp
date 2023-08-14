<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>커뮤니티 글</title>
</head>
<style>
#row {
	display: flex;
	justify-content: center;
}

.btnDel {
	background: #6799FF;
	border: 0;
	border-radius: 50px;
	padding: 15px 24px;
	color: #fff;
	transition: 0.4s;
}

.btnDel:hover {
	background: #4374D9;
}

.btnlist {
	background: #86E57F;
	border: 0;
	border-radius: 50px;
	padding: 15px 24px;
	color: #fff;
	transition: 0.4s;
}

.btnlist:hover {
	background: #1DDB16;
	color: #fff;
}

.form-group label {
	font-weight: bold;
}

.form-group { /* 표 형태로 요소들 정렬 */
	display: table-row;
}

.form-group label, .form-group div {
	display: table-cell;
	padding: 5px 15px; /* 적절한 간격 조정 */
}

@keyframes heartbeat { 
0% { transform: scale(1); }
50%{ transform:scale(1.1);}
100%{ transform :scale(1); }
}
#heartButton {
	width: 30px;
	height: 30px;
	border: none;
	background-color: transparent;
	background-image: url('../resources/images/heartfilled.png');
	/* 빈 하트 이미지 경로 */
	background-size: contain; /* 이미지가 잘리지 않도록 변경 */
	background-repeat: no-repeat; /* 이미지 반복 제거 */
	background-position: center; /* 이미지를 가운데에 위치시킴 */
	cursor: pointer;
	padding: 10px;
	margin: 5px;
	transition: 0.6s;
}

#heartButton.clicked {
	animation: heartbeat 0.5s ease-in-out;
}

.comment-form {
	width: 49%;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-top: 10px;
}

.comment-form label {
	font-weight: bold;
}

.comment-form textarea {
	width: 100%;
	height: 70px;
	margin-top: 5px;
}

.btncmt {
	background: #B2CCFF;
	border: 0;
	border-radius: 50px;
	padding: 5px 13px;
	color: #fff;
	transition: 0.4s;
}

.btncmt:hover {
	background: #A0BAED;
	color: #fff;
}

.comment-list {
	width: 49%;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-top: 20px;
}

.comment-list h3 {
	font-weight: bold;
}

.comment {
	margin-top: 10px;
	border-top: 1px solid #ccc;
}
.comment-actions {
    margin-top: 5px;
}
.comment-actions a {
    margin-left: 5px;
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
<c:if test="${!empty msg }">
	<script>
			alert('${msg}');
	</script>
	<%session.removeAttribute("msg"); 	//alert 띄우고 msg속성 초기화(제거)%>
</c:if>
  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="/talkdog/index.jsp">Home</a></li>
          <li>커뮤니티</li>
        </ol>
        <h2>글 조회</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Insert Section ======= -->
    <section id="contact" class="contact">

        <div class="row" id="row">

          <div class="col-lg-6">
            <form action="./CommModifyForm.do" method="get" role="form" class="php-email-form">
              <div class="row">
              	<c:set var="titleMsg" value="제목은 필수 입력 항목입니다."/>
				<c:set var="conMsg" value="내용은 필수 입력 항목입니다."/>
			  </div>
			  <c:if test="${cmvo != null }">
			  <div class="form-group mt-3 ">
              <label>조회수</label>
				${cmvo.cmHit }
              </div>
              <div class="form-group mt-3 ">
              <label>공감수</label>
				<span id="likesCount">${cmvo.cmHeart}</span>
              </div>
              <div class="form-group mt-3 ">
              <label>작성자</label>
				${cmvo.cmNick }
              </div>
              <div class="form-group mt-3 ">
              <label>카테고리</label>
				${cmvo.category }
              </div>
              <div class="form-group mt-3">
              <label>작성일자</label>
              <fmt:formatDate value="${cmvo.cmDate }" type="date" dateStyle="long"/>
              </div>
              <div class="form-group mt-3">
              <label>제목</label>
				${cmvo.cmTitle }
              </div>
              <div class="form-group mt-3">
              <label>내용</label>
				${cmvo.cmCont}
              </div>
              </c:if>
              <c:if test="${cmvo == null }">
              <p>삭제된 게시물입니다.</p></c:if>
            	
             <div class="my-3"></div>
             <c:if test="${sessionScope.sid == cmvo.admId || sessionScope.sid == 'admin'}">
             <c:if test="${cmvo != null }">
             <button type="submit">수정</button>
			<!--  <button type="button" class="btnDel" onclick="commDelChk()">삭제</button>  -->
			 <a href="./CommRemove.do?pageNum=${pageNum }&type=${type }&keyword=${keyword }&catNo=${catNo }&cmNo=${cmvo.cmNo }" 
			 onclick="commDelChk()" class="btnDel">삭제</a>
			 </c:if>
			 </c:if>
				<input type="hidden" name="type" value="${type }">
              	<input type="hidden" name="pageNum" value="${pageNum }">
				<input type="hidden" name="keyword" value="${keyword }">
				<input type="hidden" name="catNo" value="${catNo }">
				<input type="hidden" name="cmNo" value="${cmvo.cmNo }">
				<input type="hidden" name="sid" value="${sessionScope.sid }">
				<input type="hidden" name="admId" value="${cmvo.admId }">	
             <a href="./CommListAll.do?pageNum=${pageNum }&type=${type }&keyword=${keyword }&catNo=${catNo }" class="btnlist text-center">목록으로</a>
             <c:if test="${cmvo != null }">
             <button type="button" id="heartButton" class="empty"></button> 	
             </c:if>
            </form>
            
          </div>
        </div>

			<div class="comment-form">
				<form action="./CmreWrite.do" method="post">
				<c:set var="cmtMsg" value="댓글을 작성해주세요"/>
					<label for="comment">댓글(${totalCnt })</label>
					<textarea id="cmCont" name="cmreCont" required 
					oninput="setCustomValidity('')" oninvalid="this.setCustomValidity('${cmtMsg }')"
					placeholder="댓글을 달아 고민을 해결해주세요!"></textarea>
					<br>
					<input type="hidden" name="cmNo" value="${cmvo.cmNo }">
					<input type="hidden" name="rePageNum" value="${rePageNum }">
					<input type="hidden" name="sid" value="${sessionScope.sid }"/>
					<input type="hidden" name="admId" value="${cmvo.admId }">
					<input type="hidden" name="catNo" value="${catNo }">
					<button type="submit" class="btncmt">작성</button>
				</form>
				
				<form action="./CmreList.do" method="get" role="form" id="replyForm">
				
				<c:forEach items="${cmreList }" var="cmrevo">
				<div class="comment">
            		<strong>작성자:</strong> ${cmrevo.cmreNick }
            		<p>${cmrevo.cmreCont }</p>
            		<fmt:formatDate value="${cmrevo.cmreDate }" type="both" dateStyle="medium" timeStyle="medium"/>
            		<c:if test="${sid == cmrevo.admId || sid == 'admin'}">
            			<div class="comment-actions">
                			<a href="./CmreModifyForm.do?cmreNo=${cmrevo.cmreNo }&cmNo=${cmvo.cmNo }&admId=${cmrevo.admId }&catNo=${catNo }&cmreCont=${cmrevo.cmreCont }">수정</a>
                			<a href="./CmreRemove.do?cmreNo=${cmrevo.cmreNo }&cmNo=${cmvo.cmNo }&admId=${cmrevo.admId }&catNo=${catNo }" onclick="cmreDelChk()">삭제</a>
            				<input type="hidden" name="cmreNo" value="${cmrevo.cmreNo }">
            				<input type="hidden" name="cmNo" value="${cmvo.cmNo }">
            				<input type="hidden" name="admId" value="${cmrevo.admId }">
            				<input type="hidden" name="catNo" value="${cmvo.catNo }">
            				
            			</div>
            		</c:if>
    			</div>
    			
    			</c:forEach>
			
    			</form>
			</div><!-- End commentAll -->
			
		</section><!-- End Insert Section -->

  </main><!-- End #main -->

<%@ include file="/include/footer.jsp" %>
</body>
<script>
$('#heartButton').on('click', function(){
	console.log("버튼2");
	// 커뮤니티 공감 증감 메서드
	// 공감 여부와 아이디와 글 번호 ./CommHeart.do로 보내기
	var id = '<%= session.getAttribute("sid") %>';
	var cmNo = $('[name="cmNo"]').val();
	var data = {
	        'id': id,
	        'cmNo' : cmNo
	    };   
	$.get('./CommHeart.do', data, function(response) {
	    var cmHeart = response.cmHeart;
 	    $('#likesCount').text(cmHeart); // 공감수를 업데이트
	    
	});
    
});

</script>
</html>
