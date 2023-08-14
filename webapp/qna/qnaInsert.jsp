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
	
	<%-- select 박스 두 개 나란히 놓음--%>
	.select-container {
	  display: flex;
	  align-items: center; /* 요소들을 수직 가운데 정렬 */
	}

	.select-container select {
	  margin-right: 10px; /* 두 요소 사이의 간격을 설정 */
	}
</style>
</head>

<body>
<%@ include file="/include/header.jsp" %>
<%--<% request.setCharacterEncoding("EUC-KR");%> --%>

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <ol>
          <li><a href="index.html">Home</a></li>
          <li>문의게시판</li>
        </ol>
        <h2>문의하기</h2>
      </div>
    </section><!-- End Breadcrumbs -->


    <!-- ======= Insert Section ======= -->
    <section id="contact" class="contact">
		<div class="row" id="row">
		<div class="col-lg-6">
            <form action="./Write.do" method="post" class="php-email-form" accept-charset="UTF-8">
              
              <div class="row">
              <div class="col-md-6 form-group">
				  <div class="select-container">
				    <label>카테고리</label>
				    <select name="qnaCategory" id="qnaCategory">
				      <option selected disabled class="noCtg">--선택--</option>
				      <option>주문관련</option>
				      <option>배송관련</option>
				      <option>커뮤니티</option>
				      <option>기타</option>
				    </select>
				
				    <select name="qnaSecCategory" id="qnaSecCategory" style="display: none;">
				      <option selected disabled class="noCtg">--선택--</option>
				      <option>주문취소</option>
				      <option>반품</option>
				      <option>기타</option>
				    </select>
					</div>
			  </div>
              </div>
              
              <div class="form-group mt-3">
              <label>제목</label>
                <input type="text" class="form-control" name="qnaTitle" id="qnaTitle" required>
              </div>
              <div class="form-group mt-3">
              <label>내용</label>
                <textarea class="form-control" name="qnaContent" id="qnaContent" rows="5" required></textarea>
              </div>
<%--	<input type="hidden" name="admId" id="admId" value="test2"/>	--%>
           	<input type="hidden" name="admId" id="admId" value="${sid }"/>  
			  <br><br>
              <div class="text-center" id="btn-group">
			  <input type="button" class="btn btn-secondary" onclick="insertCancel(event);" value="취소"/>
              <input type="submit" id="submit" class="btn btn-success regBtn" value="등록"/>
              </div>
	          </form>
		</div>
        </div>
    </section><!-- End Insert Section -->
  </main><!-- End #main -->

<script>
$(document).ready(function() {
  	// qnaCategory의 값이 '주문관련'일 때 하위카테고리 옵션을 선택할 수 있도록
  	document.getElementById('qnaCategory').addEventListener('change', function() {
	    const selectedCategory = this.value;		// this : qnaCategory
	    const qnaSecCategory = document.getElementById('qnaSecCategory');
	    
	    if (selectedCategory === '주문관련') {
	      qnaSecCategory.style.display = 'block'; // 하위카테고리 옵션 보여줌
	    } else {
	      qnaSecCategory.style.display = 'none';
	    }
  	});
  
  
  //미입력 폼 존재 시 폼 제출을 멈추고 알림으로 표시
      $('#submit').click(function(event) {
          const qnaCategory = $('#qnaCategory').val();
          const qnaTitle = $('#qnaTitle').val();
          const qnaContent = $('#qnaContent').val();
          const qnaSecCategory = $('#qnaSecCategory').val();

          if ($('#qnaCategory option:selected').hasClass('noCtg')) {
        	    alert('카테고리를 선택하세요.');
        	    event.preventDefault(); // 폼 제출 중단
       	  }
          
          if (qnaCategory === '주문관련' && qnaSecCategory === '--선택--') {
              alert('하위 카테고리를 선택하세요.');
              event.preventDefault();
          }
          
          if (!qnaTitle.trim()) {
              alert('제목을 입력해주세요.');
              event.preventDefault(); // 폼 제출 중단
          }

          if (!qnaContent.trim()) {
              alert('내용을 입력해주세요.');
              event.preventDefault(); // 폼 제출 중단
          }
      });
  
});
</script>

<%@ include file="/include/footer.jsp" %>
</body>

</html>
