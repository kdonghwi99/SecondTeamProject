<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String reviewContent = (String) request.getAttribute("review");
%>
<!DOCTYPE html>
<html>
<head>
<script>
function closePopup() {
  if(window.history.length > 1) {
    window.history.back();
  } else {
    window.opener = null;
    window.open('', '_self');
    window.close();
  }
}
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 작성 팝업</title>
<style>
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
<div class="wrapper">
  <form method="post" action="/talkdog/ReviewUpdate.do">
    <input type="hidden" name="pId" value="<%=request.getParameter("pId")%>" />
    <input type="hidden" name="rNo" value="<%=request.getParameter("rNo")%>" />
    <h1>리뷰 수정</h1>
    <div>
      <label for="review">리뷰 작성:</label>
<textarea name="review" id="review" rows="4" cols="40"><%=reviewContent != null ? reviewContent : "" %></textarea>
    </div>
    <div>
      <input type="submit" value="수정하기" />
<input type="button" value="취소" onclick="closePopup();" />
    </div>
  </form>
</div>
</body>
</html>