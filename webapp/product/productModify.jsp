<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="talkdog.vo.ProductVO" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.io.File" %>

<!DOCTYPE html>
<html>
<head>
<script>
document.addEventListener('DOMContentLoaded', function() {
  document.getElementById('pMimg').addEventListener('change', function(e) {
    const reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById('preview_pMimg').src = e.target.result;
    };
    reader.readAsDataURL(e.target.files[0]);
  });

  document.getElementById('pImg').addEventListener('change', function(e) {
    const reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById('preview_pImg').src = e.target.result;
    };
    reader.readAsDataURL(e.target.files[0]);
  });
});
</script>
<meta charset="UTF-8">
<title>productModify.jsp</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="../assets/img/favicon.png" rel="icon">
  <link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../assets/css/style.css" rel="stylesheet">
<title>prouctAdd.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" media="screen">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<jsp:useBean id="pdao" class="talkdog.dao.ProductDAO"></jsp:useBean>
<%
	String pid = request.getParameter("pid");
	ProductVO pvo = pdao.productSelect(pid);
%>

<div class="jumbotron">
	<div class="container">

	<fmt:setLocale value="${param.language }"/>
	<fmt:setBundle basename="talkdog.bundle.message" var="msgBundle"/>
		<h1 class="display-4">✅ 상품수정</h1>
	</div>
</div>

<main role="main">
	  <div class="container">
    <div class="form-container">
    <a href="javascript:logout()" class="btn btn-sm btn-success logout-btn">LOGOUT</a>
	</div>
	
		    <div class="row mx-auto">
	
<form action="productModifyProc.jsp" method="post" enctype="multipart/form-data">
			<div class="form-group row"> 
				<label class="col-sm-2"><fmt:message key="pId" bundle="${msgBundle}"/></label>
				<div class="col-sm-3">
					<input name="pId" id="pId" type="text" class="form-control" value="<%=pvo.getpId()%>" required>
				</div></div>
		
			<div class="form-group row"> 
				<label class="col-sm-2"><fmt:message key="pName" bundle="${msgBundle}"/></label>
				<div class="col-sm-3">
					<input name="pName" id="pName" type="text" class="form-control" value="<%=pvo.getpName()%>" required>
					
				</div></div>
		
			<div class="form-group row"> 
				<label class="col-sm-2"><fmt:message key="pPrice" bundle="${msgBundle}"/></label>
				<div class="col-sm-3">
					<input name="pPrice" id="pPrice" type="number" class="form-control"
						   value="<%=pvo.getpPrice()%>" min="0" step="1000" required>
				</div></div>
		
			<div class="form-group row"> 
				<label class="col-sm-2"><fmt:message key="pDetail" bundle="${msgBundle}"/></label>
				<div class="col-sm-5">
					<textarea name="pDetail" id="pDetail" class="form-control" 
							  cols="50" rows="2" required><%=pvo.getpDetail()%></textarea>
				</div></div>
		
		<div class="form-group row"> 
				<label class="col-sm-2"><fmt:message key="pCate" bundle="${msgBundle}"/></label>
				<div class="col-sm-3">
					<select name="pCate" id="pCate" class="form-control" required>
						<option value="BOOK" ${pvo.getCategory().equals("BOOK") ? "selected" : ""}><fmt:message key="cate_book" bundle="${msgBundle}"/></option>
          				<option value="AROMA" ${pvo.getCategory().equals("AROMA") ? "selected" : ""}><fmt:message key="cate_aroma" bundle="${msgBundle}"/></option>
            			<option value="MEDI" ${pvo.getCategory().equals("MEDI") ? "selected" : ""}><fmt:message key="cate_medi" bundle="${msgBundle}"/></option>
					</select>
				</div></div>
		
			<div class="form-group row"> 
				<label class="col-sm-2"><fmt:message key="pType" bundle="${msgBundle}"/></label>
				<div class="col-sm-3">
					<select name="pType" id="pType" class="form-control" required>
						<option value="size" ${pvo.getCategory().equals("size") ? "selected" : ""}><fmt:message key="type_size" bundle="${msgBundle}"/></option>
            			<option value="null" ${pvo.getCategory().equals("null") ? "selected" : ""}><fmt:message key="type_null" bundle="${msgBundle}"/></option>
					</select>
				</div></div>
		
			<div class="form-group row"> 
				<label class="col-sm-2"><fmt:message key="pVol" bundle="${msgBundle}"/></label>
				<div class="col-sm-3">
					<input name="pVol" id="pVol" type="number" class="form-control"
						   value="<%=pvo.getpVol()%>" min="0">
				</div></div>
		
			
			<!-- 이 부분을 파일업로드되도록 수정 -->
<!-- Main Image Preview -->
<div class="form-group row">
  <label class="col-sm-2"><fmt:message key="pMimg" bundle="${msgBundle}"/></label>
  <div class="col-sm-5">
    <img src="upload/${pvo.pMimg}" alt="Current Main Image" width="200" height="200" id="preview_pMimg">
    <input name="pMimg" id="pMimg" type="file" class="form-control">
  </div>
</div>
<!-- Additional Image Preview -->
<div class="form-group row">
  <label class="col-sm-2"><fmt:message key="pImg" bundle="${msgBundle}"/></label>
  <div class="col-sm-5">
    <img src="upload/${pvo.pImg}" alt="Current Image" width="200" height="200" id="preview_pImg">
    <input name="pImg" id="pImg" type="file" class="form-control">
  </div>
</div>

				<div class="form-group row"> 
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-info" onclick="checkProduct()" value="<fmt:message key="addBtn" bundle="${msgBundle}"/>"/>
					<input type="button" class="btn btn-secondary" formaction="productEdit.jsp" value="<fmt:message key="cancelBtn" bundle="${msgBundle}"/>">
		</div></div>
		</form>
		</div>
		</div>
		</main>

<%@ include file="../include/footer.jsp" %>
	
</body>
</html>