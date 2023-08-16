<%@page import="talkdog.vo.ProductVO"%>
<%@page import="talkdog.vo.ReviewVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Portfolio Details - Eterna Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="../assets/img/favicon.png" rel="icon">
  <link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Vendor CSS Files -->
  <link href="../assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../assets/css/style.css" rel="stylesheet">


  <style>
  /* Custom Image Class */
  .register-btn {
  background-color: #007bff;
  color: white;
  border: none;
  padding: 10px 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  margin: 10px;
  float: right;
  transition-duration: 0.4s;
  cursor: pointer;
  box-shadow: none;
  border-radius: 3px;
}

.register-btn:hover {
  background-color: #0056b3;
  text-decoration: none;
  color: white;
}
  
  
    .table-center {
      margin-left: auto;
      margin-right: auto;
    }
    .table td, .table th {
      text-align: center;
    }
    
.fixed-height-img {
  height: 700px; /* 원하는 세로 길이로 변경 가능합니다. */
  width: auto; /* 가로 사이즈는 비율에 맞게 조절됩니다. */
  object-fit: cover; /* 이미지가 지정된 영역을 채우고 비율을 유지합니다. */
}

        .fixed-height-img {
            height: 700px;
            width: auto;
            object-fit: cover;
        }

        .options {
            padding-top: 5px;
            padding-bottom: 15px;
        }

        .buttons {
            padding-top: 15px;
        }

        .buttons a {
            margin-right: 10px;
        }

        .portfolio-description {
            padding-top: 30px;
        }

  </style>
</head>

<body>

 <!-- header start -->
<%@ include file="../include/header.jsp" %>
 <!-- header end -->

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="../index.jsp">Home</a></li>
          <li>Portfolio Details</li>
        </ol>
        <h2>Portfolio Details</h2>

      </div>
    </section><!-- End Breadcrumbs -->
<% 
  String pid = request.getParameter("pid");
%>
<!-- ======= Product Details Section ======= -->
<section id="portfolio-details" class="portfolio-details">
  <div class="container">
    <div class="row gy-4">
      <jsp:useBean id="pdao" class="talkdog.dao.ProductDAO"/> <!-- 디폴트 생성자로 호출 -->
      <% 
        ProductVO pvo = pdao.productSelect(pid); //pid에 맞는 pvo를 DB에서 가져옴
      %>
      <div class="col-lg-8">
        <div class="portfolio-details-slider swiper">
         <div class="swiper-wrapper align-items-center">
  <% if(pvo != null) { %>
    <!-- pMimg slide -->
    <div class="swiper-slide">
      <img class="fixed-height-img" src="../resources/images/<%=pvo.getpMimg()%>" alt="<%=pvo.getpName()%> 이미지">
    </div>
    
    <!-- pImg slide -->
    <div class="swiper-slide">
      <img class="fixed-height-img" src="../resources/images/<%=pvo.getpImg()%>" alt="<%=pvo.getpName()%> 이미지">
    </div>
  <% } %>
</div>
	</div>
      </div>

        <div class="col-lg-4">
        <div class="portfolio-info">
            <h3>상품 정보</h3>
         
        <ul>
        <% if(pvo != null) { %>
          <li><strong>상품 이름</strong>: <%=pvo.getpName()%></li>
              <% } %>
              
           <li>    <% if (pvo != null) { %>
                <p><%=pvo.getpDetail() %></p>
            <% } else { %>
                <strong>상세 설명을 불러올 수 없습니다.</strong>
            <% } %></li>
          <strong>수량 </strong>  
          <select name="option" class="form-select" name="cartOpt">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
		</select>
		<% if (pvo != null && pvo.getpType() != null && !pvo.getpType().equals("null")) { %>
            <li>
                <strong>옵션 </strong>
                <div class="options">
                    <select name="option" class="form-select">
                        <% if (pvo.getpType().equals("size")) { %>
                            <option value="S">Size: S</option>
                            <option value="M">Size: M</option>
                            <option value="L">Size: L</option>
                        <% } %>
                    </select>
                </div>
            </li>
        <% } %> <!-- 이 부분 수정 -->
                
               
            </ul>
        </div>

        <% if (pvo != null) { %>
            <h3><%=pvo.getpPrice() %>원</h3>
            <div class="buttons">
                <form method="post" action="../cart/cartAddProc.jsp">
                    <input type="hidden" name="pid" value="<%=pvo.getpId() %>">
                    <a id="cartin" href="#" class="btn btn-info cartAddBtn">장바구니 담기 &raquo;</a>
                    <a href="/talkdog/cart/cart.jsp" class="btn btn-warning">장바구니 보기 &raquo;</a>
                    <a href="/talkdog/product/productlist.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
                </form>
            </div>
        <% } %>
    </div>

    </div>
  </div>
</section><!-- End Product Details Section -->
<!-- ======= Reviews Section ======= -->
<% 
    String loggedInUserId = (String) session.getAttribute("sid"); // 현재 사용자의 아이디
    if (loggedInUserId != null) { // 사용자가 로그인한 경우만 리뷰 등록 버튼을 보여줍니다.
%>
        <!-- 리뷰 작성 버튼 -->
<button id="reviewBtn" class="register-btn">리뷰 작성하기</button>

        <!-- 리뷰 작성 팝업 -->
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2>리뷰 작성</h2>
                <!-- 리뷰 작성 폼 -->
                <form id="reviewForm" method="POST" action="ReviewAddProc.jsp">
                    <label for="review">리뷰:</label>
                    <textarea id="review" name="review" rows="4" cols="50" required></textarea>
                    <input type="hidden" id="pId" name="pId" value="<%=pvo.getpId()%>" /> <!-- 상품번호를 입력하세요. -->
                    <input type="hidden" id="admId" name="admId" value="<%= loggedInUserId %>" /> <!-- 회원아이디 자동 적용 -->
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

<% 
    }
%>
      <jsp:useBean id="rdao" class="talkdog.dao.ReviewDAO"/> <!-- 디폴트 생성자로 호출 -->
  	<% 
List<ReviewVO> rvoList = rdao.reviewSelect(pid); //pid에 맞는 rvo를 DB에서 가져옴
System.out.println("리뷰의 개수: " + rvoList.size()); // 리뷰의 개수를 콘솔에 출력합니다.
System.out.println("pid = " + pid);

%>
<section id="reviews">
  <div class="container">
    <div class="section-title">
      <h2>상품 리뷰</h2>
    </div>

  <table class="table table-center">
      <!-- 테이블 헤더 -->
      <thead>
        <tr>
          <th scope="col">리뷰내용</th>
          <th scope="col">작성일</th>
          <th scope="col">작성자</th>
          <th></th>
        </tr>
      </thead>

<!-- 테이블 바디 (리뷰 목록) -->
<tbody>
  <% for (ReviewVO rvo : rvoList) { %>
    <tr>
      <td><%= rvo.getReview() %></td>
      <td><%= rvo.getrDate() %></td>
      <td><%= rvo.getAdmId() %></td>
      <td>
        <% String currentUserId = (String) session.getAttribute("sid"); %>
       <% if (currentUserId != null && (currentUserId.equals(rvo.getAdmId()) || currentUserId.equalsIgnoreCase("admin"))) { %>
          <a href="reviewUpdate.jsp?pId=<%=rvo.getpId()%>&rNo=<%=rvo.getrNo()%>">수정</a>
		  <a href="/talkdog/ReviewDelete.do?pId=<%=rvo.getpId()%>&rNo=<%=rvo.getrNo()%>">삭제</a>
    <% } %>
      </td>
    </tr>
  <% } %>
</tbody>
    </table>
  </div>
</section>
  </main><!-- End #main -->



    <!-- footer start -->
<%@ include file="/include/footer.jsp" %>
 <!-- footer end --><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="../assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="../assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="../assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="../assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>

</body>

</html>