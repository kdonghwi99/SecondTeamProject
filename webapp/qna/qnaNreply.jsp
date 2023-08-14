<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	#qnaCategory { margin-left: 15px;}
	#row {display: flex; justify-content: center;}
	
	#btn-group {
	    display: flex;
	    justify-content: center;
	    gap: 10px; 
 	 }	
 	 
 	#btn-group .btn {
    	border-radius: 5px;
	}
	
	.form-group {
    	margin-bottom: 20px;
	}
	
	#reply{ font-weight: bold; }
	
	#replyForm {
    	background-color: lightgray;
    	padding: 5px;
    	font-weight: bold;
  	}
  
	.reply-btn, .btn-outline-dark{
		float: right;
		display: flex;
		gap: 10px; 
	}
	
	.comment {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: gray;
    	color : white;
    	padding: 5px;
    	font-weight: bold;
    }
    
    .comment-details {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    width: 100%;
	}
	
	#replyCont{
		border: gray solid 1px;
		padding: 10px;
		margin: 5px;
	}
	
		/* 댓글 섹션 스타일 */
	.comment-list {
	    border: 1px solid gray;
	    border-radius: 5px;
	    padding: 10px;
	}
	
	.comment {
	    display: flex;
	    align-items: center;
	    border: 1px solid gray;
	    border-radius: 5px;
	    background-color: lightgray;
	    color: black;
	    padding: 5px;
	    font-weight: bold;
	    margin-bottom: 10px;
	}
	
	.comment h6 {
	    margin: 0;
	}
	
	.reply-content {
	    border: 1px solid gray;
	    border-radius: 5px;
	    padding: 10px;
	    margin: 5px 0;
	    background-color: white;
	}
		
</style>
</head>

<body>
<%@ include file="/include/header.jsp" %>

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
          <li><a href="index.html">Home</a></li>
          <li>문의글 조회</li>
        </ol>
        <h2>문의글 조회</h2>
      </div>
    </section>
   <!-- End Breadcrumbs -->
    
    <section id="contact" class="contact">
		<div class="row" id="row">
		<div class="col-lg-6">
              <div class="row">
              
				<div class="form-group row"> 
					<label class="col-sm-2">작성자</label>
					<div class="col-sm-3">
						${qvo.admId }
					</div>
				</div>

				<div class="form-group row"> 
					<label class="col-sm-2">카테고리</label>
					<div class="col-sm-3">
						${qvo.qnaCategory }
					</div>
				</div>
				
				<%--상세카테고리의 값이 존재할 경우에만 표시되게 수정 --%>
				
			<c:if test="${not empty qvo.qnaSecCategory}">
				<div class="form-group row"> 
					<label class="col-sm-2">상세 카테고리</label>
					<div class="col-sm-3">
						${qvo.qnaSecCategory }
					</div>
				</div>
			</c:if>
				
				<div class="form-group row"> 
					<label class="col-sm-2">작성일</label>
					<div class="col-sm-3">
						${qvo.qnaDate }
					</div>
				</div>
				
				<div class="form-group row"> 
					<label class="col-sm-2">제목</label>
					<div class="col-sm-8">
						${qvo.qnaTitle }
					</div>
				</div>
				
				<div class="form-group row"> 
					<label class="col-sm-2">내용</label>
					<div class="col-sm-8">
						${qvo.qnaContent }
					</div>
				</div>

			  </div>
              </div>
              
		<br><br><br>
		<div class="text-center" id="btn-group">
			  <a href="./list.do?pageNum=${pageNum }&category=${category }" class="btn btn-secondary">목록</a>
			  <c:if test="${sid eq qvo.admId}">
			  	<a id="modify" href="./ModifyForm.do?pageNum=${pageNum }&category=${category }&qnaNo=${qvo.qnaNo }" class="btn btn-success regBtn">수정</a>
			  	<a id="remove" onclick="delChk(${qvo.qnaNo}, '${category }', ${pageNum });" class="btn btn-danger regBtn">삭제</a>
			  </c:if>
<!--              <input type="button" id="modify" class="btn btn-warning regBtn" onclick="modify(${qvo.qnaNo}, ${category });" value="수정"/> -->
<!--              <input type="button" id="remove" class="btn btn-danger regBtn" onclick="delChk(${qvo.qnaNo}, ${category });" value="삭제"/> -->
		</div>
		</div>

<br><br><br><br>
		
<!-- 댓글 -->
	
		<div class="row" id="row">
		<div class="col-lg-6">
		<c:if test="${sid eq 'admin' }">
			<form action="./ReplyUpdate.do" method="post">
				<c:if test="${empty qvo.qnaReply}">	 
					<h6 id="replyForm"><span>&nbsp;&nbsp;&nbsp;</span>답변하기</h6>
				</c:if>	
				<c:if test="${not empty qvo.qnaReply}">	 
					<h6 id="replyForm"><span>&nbsp;&nbsp;&nbsp;</span>답변수정</h6>
				</c:if>	
				<div class="comment-form">
					<textarea name="qnaReply" rows="4" cols="97" placeholder="   답변내용을 입력해주세요."></textarea>
				</div>
				<input type="hidden" name="qnaNo" value="${qvo.qnaNo }"/>
				<input type="hidden" name="category" value="${category }"/>
				<input type="hidden" name="pageNum" value="${pageNum }"/>
				<c:if test="${empty qvo.qnaReply}">	 
					<input type="submit" class="btn btn-outline-dark mt-2 reply-btn" value="등록"/>
				</c:if>
				<c:if test="${not empty qvo.qnaReply}">	 
					<input type="submit" class="btn btn-outline-success mt-2 reply-btn" value="수정"/>
				</c:if>	
			</form>
		</c:if>
		<br>
		<br>
		<br>
		<!-- 댓글이 존재한다면 -->
		<!-- 댓글이 존재한다면 -->
		<c:if test="${not empty qvo.qnaReply}">
		    <div class="comment-list">
		        <div class="comment">
		            <h6 id="reply"><span>&nbsp;&nbsp;&nbsp;</span>답변</h6>
		            <small>작성자 ADMIN &nbsp; | &nbsp; 작성일 ${qvo.qnaReplyDate }&nbsp;&nbsp;</small>
		        </div>
		        <div class="reply-content" id="replyCont">
		            ${qvo.qnaReply }
		        </div>
		    </div>
		    <c:if test="${sid eq 'admin' }"> 
		            <input type="button" class="btn btn-outline-danger mt-2 reply-btn" onclick="replydelChk(${qvo.qnaNo}, '${category }', ${pageNum });" value="삭제"/>
			</c:if>
		</c:if>
		
		</div>
		</div>
<!-- 댓글end -->		

    </section>
  </main><!-- End #main -->
<%@ include file="/include/footer.jsp" %>
</body>

</html>