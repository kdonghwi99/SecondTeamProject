<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
  <%@ include file="/include/header.jsp" %>
  <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div class="hero-container">
      <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

        <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

        <div class="carousel-inner" role="listbox">

          <!-- Slide 1 -->
          <div class="carousel-item active" style="background-image: url(resources/images/dog1.png)">
            <div class="carousel-container">
              <div class="carousel-content">
                <a href="/talkdog/Comm/CommListAll.do?pageNum=1&type=&keyword=&catNo=0" class="btn-get-started animate__animated animate__fadeInUp">더 보 시 개</a>
              </div>
              
            </div>
          </div>

          <!-- Slide 2 -->
          <div class="carousel-item" style="background-image: url(resources/images/dog2.png)">
            <div class="carousel-container">
              <div class="carousel-content">
                <a href="" class="btn-get-started animate__animated animate__fadeInUp">더 보 시 개</a>
              </div>
            </div>
          </div>

        </div>

        <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
          <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
        </a>

        <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
          <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
        </a>

      </div>
    </div>
  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= Featured Section ======= -->
    <section id="featured" class="featured">
      <div class="container">

        <div class="row">
          <div class="col-lg-4">
            <div class="icon-box">
              <i class="bi bi-card-checklist"></i>
              <h3><a href="/talkdog/Notice/NoticeList.do?pageNum=1&type=&keyword=&category=공지사항">공지사항</a></h3>
              <p>여러가지 공지사항을 확인하세요</p>
            </div>
          </div>
          <div class="col-lg-4 mt-4 mt-lg-0">
            <div class="icon-box">
              <i class="bi bi-bar-chart"></i>
              <h3><a href="/talkdog/Notice/NoticeList.do?pageNum=1&type=&keyword=&category=이벤트">이벤트</a></h3>
              <p>여러가지 이벤트가 준비되어 있습니다</p>
            </div>
          </div>
          <div class="col-lg-4 mt-4 mt-lg-0">
            <div class="icon-box">
              <i class="bi bi-binoculars"></i>
              <h3><a href="/talkdog/test/testMain.jsp">자가진단</a></h3>
              <p>본인의 상태를 검증해보세요</p>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Featured Section -->

  </main><!-- End #main -->

 <%@ include file="/include/footer.jsp" %>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>
