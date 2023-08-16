<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 작성 팝업</title>
<style>
    /* 팝업 스타일 */
    .wrapper {
        font-family: 'Arial', sans-serif;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
    }

    form {
        padding: 30px;
        background-color: #f5f5f5;
        box-shadow: 0px 3px 10px rgba(0,0,0,0.2);
        border-radius: 10px;
        width: 50%;
        max-width: 500px;
    }

    h1 {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    label {
        display: block;
        font-size: 14px;
        margin-bottom: 5px;
    }

    textarea {
        display: block;
        width: 100%;
        padding: 10px;
        font-size: 14px;
        font-family: 'Arial', sans-serif;
        margin-bottom: 20px;
        resize: none;
        border: 1px solid #ccc;
    }

    input[type="submit"],
    input[type="button"] {
        background-color: #007bff;
        border: none;
        color: white;
        font-size: 14px;
        padding: 10px 20px;
        cursor: pointer;
        text-transform: uppercase;
        margin-right: 10px;
        border-radius: 5px;
    }

    input[type="button"] {
        background-color: #6c757d;
    }
</style>
</head>
<body>
<!-- 리뷰 작성 팝업 -->
<div class="wrapper">
        <span class="close">&times;</span>
        <h1>리뷰 작성</h1>
        <!-- 리뷰 작성 폼 -->
        <form method="POST" action="/review">
            <label for="review">리뷰:</label>
            <textarea id="review" name="review" rows="4" cols="50" required></textarea>
            <input type="hidden" id="pId" name="pId" value="" />
            <input type="hidden" id="admId" name="admId" value="" />
            <input type="submit" value="리뷰 등록">
        </form>
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