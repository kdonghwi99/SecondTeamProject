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

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <ol>
          <li><a href="index.html">Home</a></li>
          <li>문의글 수정</li>
        </ol>
        <h2>수정하기</h2>
      </div>
    </section><!-- End Breadcrumbs -->


    <!-- ======= Modify Section ======= -->
    <section id="contact" class="contact">
		<div class="row" id="row">
		<div class="col-lg-6">
            <form action="./Modify.do" method="post" role="form" class="php-email-form">
              <div class="row">
              <div class="col-md-6 form-group">
				  <div class="select-container">
				    <label>카테고리</label>
				    <select name="qnaCategory" id="qnaCategory">
				      <option ${qvo.qnaCategory == '주문관련' ? 'selected' : ''}>주문관련</option>
				      <option ${qvo.qnaCategory == '배송관련' ? 'selected' : ''}>배송관련</option>
				      <option ${qvo.qnaCategory == '커뮤니티' ? 'selected' : ''}>커뮤니티</option>
				      <option ${qvo.qnaCategory == '기타' ? 'selected' : ''}>기타</option>
				    </select>
				
				    <select name="qnaSecCategory" id="qnaSecCategory" style="display: none;">
				      <option ${qvo.qnaSecCategory == '주문취소' ? 'selected' : ''}>주문취소</option>
				      <option ${qvo.qnaSecCategory == '반품' ? 'selected' : ''}>반품</option>
				      <option ${qvo.qnaSecCategory == '기타' ? 'selected' : ''}>기타</option>
				    </select>
					</div>
			  </div>
              </div>
              
              <div class="form-group mt-3">
              <label>제목</label>
                <input type="text" class="form-control" name="qnaTitle" id="qnaTitle" required
                value="${qvo.qnaTitle }">
              </div>
              
              <div class="form-group mt-3">
              <label>내용</label>
                <textarea class="form-control" name="qnaContent" id="qnaContent" rows="5" required>
               ${qvo.qnaContent }
                </textarea>
              </div>
              
              <input type="hidden" name="qnaNo" id="qnaNo" value="${qvo.qnaNo }"/>
              <input type="hidden" name="category" id="category" value="${category }"/>
              <input type="hidden" name="admId" id="admId" value="test3"/>
<%--      <input type="hidden" name="admId" id="admId" value="${sid }"/>  --%>

              <div class="text-center" id="btn-group">
              <a href="./View.do?pageNum=${pageNum }&category=${category }&qnaNo=${qvo.qnaNo }" class="btn btn-secondary">취소</a>
              <input type="submit" id="submit" class="btn btn-success regBtn" value="수정"/>
              </div>
	          </form>
		</div>
        </div>
        
    </section><!-- End Insert Section -->
  </main><!-- End #main -->

<script>
	// 페이지가 로드되었을 때 이벤트를 설정합니다.
	document.addEventListener('DOMContentLoaded', function() {
	  const qnaCategory = document.getElementById('qnaCategory');
	  const qnaSecCategory = document.getElementById('qnaSecCategory');
	
	  function toggleSecCategory() {
	    if (qnaCategory.value === '주문관련') {
	      qnaSecCategory.style.display = 'block'; // 보이게 설정
	    } else {
	      qnaSecCategory.style.display = 'none'; // 숨김 설정
	    }
	  }
	  toggleSecCategory();	// 페이지 로드 시 초기 설정
	  qnaCategory.addEventListener('change', toggleSecCategory);		// qnaCategory의 값이 변경될 때 이벤트 설정
	  
	});
</script>

<%@ include file="/include/footer.jsp" %>
</body>

</html>