<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="talkdog.dao.ReviewDAO" %>
<%@ page import="talkdog.vo.ReviewVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 여기에 선택적으로 커스텀 스타일 코드 추가 -->
</head>
<body>

    <%@ include file="../include/header.jsp"%>
    <br>
    <br>
    <br>

    <div class="jumbotron">
        <div class="container">
            <h1 class="display-4 h1h">내 정보</h1>
        </div>
    </div>
    <br>
    <%@ include file="../include/sideMenuMem.jsp"%>

    <!-- 세션에서 로그인 정보 가져오기 -->
    <%
        String userId = null;
        if (session.getAttribute("sid") != null) {
            userId = session.getAttribute("sid").toString();
        }
    %>

    <!-- 로그인 된 경우, 리뷰 리스트 생성 -->
    <%
        List<ReviewVO> rvoList = null;
        if (userId != null) {
            ReviewDAO rdao = new ReviewDAO();
            rvoList = rdao.memberreview(userId);
        }
    %>

    <!-- 리뷰 목록 출력 -->
    <main role="main">
        <div class="container divC">
            <% if (rvoList != null) { %>
                <table class="table table-bordered table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>No</th>
                            <th>리뷰</th>
                            <th>날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (ReviewVO rvo : rvoList) {
                        %>
                            <tr>
                                <td><%= rvo.getrNo() %></td>
                                <td><%= rvo.getReview() %></td>
                                <td><%= rvo.getrDate() %></td>
                            </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            <% } else { %>
                <p>로그인되어 있지 않습니다.</p>
            <% } %>
        </div>
    </main>

    <br> <br> <br>

    <%@ include file="../include/footer.jsp"%>
</body>
</html>