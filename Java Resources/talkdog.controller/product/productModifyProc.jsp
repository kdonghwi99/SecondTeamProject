<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
     
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");	//위 두 줄이 한글 깨지지 않게 처리해줌
	//productModifyProc.jsp ----------------------------------
	
	//액션 태그를 이용하여 파라미터로 전달된 폼 데이터를 
	//ProductVO 객체 pvo에 저장하고
	//ProductDAO의 수정 메서드에 전달한 후
	//처리 결과에 따라 
	//상품 등록에 성공하면 상품 상세조회 페이지로 이동하고
	//그렇지 않으면 '상품 수정 실패'를 알림창으로 출력한 후
	//			 이전 페이지로 돌아가기

%>

<jsp:useBean id="pvo" class="talkdog.vo.ProductVO"/>	<!-- 액션 태그로 객체 생성 -->	
<jsp:useBean id="pdao" class="talkdog.dao.ProductDAO"/> <!-- 객체 생성 -->

<%
/////////////////////////// 이 부분에, uploadProc의 내용이 들어가야 함

	String savePath = application.getRealPath("/resources/images");
	int maxSize = 2000 * 6000 * 100;		//최대 업로드 크기를 100mb로 잡음
	String encType = "UTF-8";
	
	MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encType, new DefaultFileRenamePolicy());
	// 업로드할 때 매개변수를 다섯 개 받음 -> request객체, 업로드할 경로, 업로드할 최대사이즈, 인코딩타입, 같은 이름으로 파일이 만들어졌을 때 정책을 뭘로 할 건지
	
	//pvo에 세팅하는데, multi에서 꺼내야 함
pvo.setpName(multi.getParameter("pName"));
pvo.setpVol(Integer.parseInt(multi.getParameter("pVol")));
pvo.setpId(multi.getParameter("pId"));
pvo.setpDetail(multi.getParameter("pDetail"));
pvo.setpPrice(Integer.parseInt(multi.getParameter("pPrice")));
pvo.setpCate(multi.getParameter("pCate"));
pvo.setpMimg(multi.getFilesystemName("pMimg"));
pvo.setpImg(multi.getFilesystemName("pImg"));
pvo.setpType(multi.getParameter("pType"));


	
	String fileName = multi.getFilesystemName("pImg");		//form에서 지정해준 name을 그대로 가져와야 함
	String SumName = multi.getFilesystemName("pMimg");		//form에서 지정해준 name을 그대로 가져와야 함
	
	
	
	
	//파일 이미지 업로드 성공유무 체크
	if(fileName != null){
		application.log("파일 업로드 성공--------------------------------");
		
	}else{
		application.log("파일 업로드 실패");
	}
	
	if(SumName != null){
		application.log("파일 업로드 성공--------------------------------");
		
	}else{
		application.log("파일 업로드 실패");
	}
	
	
	if(pdao.productUpdate(pvo)==true){							//수정 성공
		response.sendRedirect("productInfo.jsp?pid=" + pvo.getpId());
	}else{ 											//수정 실패  %>											
	<script>
		alert('상품 수정에 실패했습니다.');
		history.back(); /* 뒤로가기 */
	</script>

<% } %>