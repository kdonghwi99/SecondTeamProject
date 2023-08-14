<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 작성 팝업</title>
<style>
    /* 팝업 스타일 */
    .modal {
        display: none;  /* 우선 안보이게 */
        position: fixed;  /* 화면 상단에 위치 */
        z-index: 1;  /* 다른 요소 위에 위치 */
        padding-top: 100px;  /* 팝업 상단 여백 */
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;  /* 팝업이 너무 길 경우 스크롤바 */
        background-color: rgba(0,0,0,0.4);  /* 검은 배경 반투명 */
    }

    /* 팝업 내용 스타일 */
    .modal-content {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        max-width: 500px;
    }

    /* 팝업 닫기 버튼 스타일 */
    .close {
        color: #aaaaaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }

</style>
</head>
<body>



<!-- 리뷰 작성 팝업 -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>리뷰 작성</h2>
        <!-- 리뷰 작성 폼 -->
        <form id="reviewForm" method="POST" action="/review">
            <label for="review">리뷰:</label>
            <textarea id="review" name="review" rows="4" cols="50" required></textarea>
            <input type="hidden" id="pId" name="pId" value="" />
            <input type="hidden" id="admId" name="admId" value="" />
            <input type="submit" value="리뷰 등록">
        </form>
    </div>
</div>

<!-- 팝업을 여닫는 자바스크립트 -->
<script>
window.onload = function() {
    var reviewBtn = document.getElementById("reviewBtn");
    if (reviewBtn) {
      reviewBtn.onclick = function() {
        var modal = document.getElementById("myModal");
        var span = document.getElementsByClassName("close")[0];

        modal.style.display = "block";

        span.onclick = function() {
          modal.style.display = "none";
        }

        window.onclick = function(event) {
          if (event.target == modal) {
            modal.style.display = "none";
          }
        }
      }
    }
}
</script>

</body>
</html>