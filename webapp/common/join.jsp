<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<style>
div {
	margin: 5px;
}

.head {
	background: lightgray;
	font-size: 20px;
	padding-left: 30px
}

.divC {
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>

</head>
<body>
	<%@ include file="../include/header.jsp"%>

<!-- 회원가입 완료 메시지가 있는 경우 알림창으로 출력 -->
<%
	String msg = (String) session.getAttribute("msg");
	if (msg != null) {
%>
<script>alert('${msg}');</script>
<% 
	session.removeAttribute("msg"); 
	} 
%>
	<br>
	<br>
	<br>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">회원가입</h1>
		</div>
	</div>
	<br>

	<main role="main">
		<div class="container divC">
			<form action="/talkdog/Common/join.do" method="post" class="form-horizontal">
			<%System.out.print("join.jsp");%>
				<!-- 필수 입력 항목 안내 메시지 -->
				<c:set var="idMsg" value="아이디는 필수 입력 항목입니다." />
				<c:set var="pwMsg" value="비밀번호는 필수 입력 항목입니다." />
				<c:set var="pwChkMsg" value="비밀번호 확인은 필수 입력 항목입니다." />
				<c:set var="nmMsg" value="이름은 필수 입력 항목입니다." />
				<c:set var="nickMsg" value="닉네임은 필수 입력 항목입니다." />
				<c:set var="nmMsg" value="이름은 필수 입력 항목입니다." />
				<c:set var="phMsg" value="전화번호는 필수 입력 항목입니다." />

				<div class="head">[ 필수 ]</div>

				<div class="form-group row">
					<label class="col-sm-2">이름</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="admName"
							id="admName" required oninput="setCustomValidity('')"
							oninvalid="this.setCustomValidity('${nmMsg }')"
							value="a">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">아이디</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="admId" id="admId"
							required oninput="setCustomValidity('')"
							oninvalid="this.setCustomValidity('${idMsg }')"
							value="a">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">닉네임</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="admNick"
							id="admNick" required oninput="setCustomValidity('')"
							oninvalid="this.setCustomValidity('${nickMsg }')"
							value="a">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-3">
						<input type="password" class="form-control" name="admPw"
							id="admPw" required oninput="setCustomValidity('')"
							oninvalid="this.setCustomValidity('${pwMsg }')"
							value="1111">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">비밀번호 확인</label>
					<div class="col-sm-3">
						<input type="password" class="form-control" name="pwchk"
							id="pwchk" required oninput="setCustomValidity('')"
							oninvalid="this.setCustomValidity('${pwChkMsg }')"
							value="1111">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">우편번호</label>
					<div class="col-sm-3">
						<input type="text" name="zipNo" id="zipNo" readonly
							class="form-control" required>
					</div>
					<div class="col-sm-2">
						<input type="button" class="btn btn-outline-secondary" value="검색"
							onclick="goPopup()">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">도로명 주소</label>
					<div class="col-sm-6">
						<input type="text" name="admAdd1" id="admAdd1"
							class="form-control" required>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">상세 주소</label>
					<div class="col-sm-3">
						<input type="text" name="admAdd2" id="admAdd2"
							class="form-control" required>
					</div>
					<div class="col-sm-3">
						<input type="text" name="admAdd3" id="admAdd3"
							class="form-control" required oninput="setCustomValidity('')"
							oninvalid="this.setCustomValidity('${addMsg }')">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">전화번호</label>
					<div class="col-sm-3">
						<input type="tel" class="form-control" name="admPhone"
							id="admPhone" required oninput="setCustomValidity('')"
							oninvalid="this.setCustomValidity('${phMsg }')"
							value="010-1111-1122">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">이메일</label>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="email1" id="email1">
					</div>
					@
					<div class="col-sm-2">
						<input type="text" class="form-control" name="email2" id="email2">
					</div>
					<div class="col-sm-2">
						<select id="email3">
							<option value="self">직접 입력</option>
							<option value="gmail">gmail.com</option>
							<option value="naver">naver.com</option>
						</select>
					</div>
				</div>

				<div class="head" style="">[ 선택 ]</div>

				<div class="form-group row">
					<label class="col-sm-2">생년월일</label>
					<div class="col-sm-3">
						<input type="date" class="form-control" name="admBirth"
							id="admBirth" min="1900-01-01" max="2030-12-31">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">우리 사이트 접속 경로</label>
					<div class="col-sm-3">
						<label><input type="radio" class="" name="path" id="path sns">SNS </label> 
							<label><input type="radio" class="" name="path" id="path cafe">카페 </label> <label><input
							type="radio" class="" name="path" id="path friend">지인추천 </label>
						<label><input type="radio" class="" name="path" id="path blog">블로그 </label>
						<label><input type="radio" class="radio-value" name="path"
						              id="path write" value="write">직접입력
							<input type="text" class="radio-value-detail" placeholder="직접입력"
							value="" />
							<!-- <script>
								$('.radio-value').on('click',function() {
											var valueCheck = $(
													'.radio-value:checked')
													.val(); // 체크된 Radio 버튼의 값을 가져옵니다.

											if (valueCheck == 'write') {
												$('.radio-value-detail').attr(
														'disabled', false); // 과일 종류를 입력하는 input 을 활성화합니다.
												$('.radio-value-detail')
														.focus(); // 과일 종류를 입력하는 input 에 커서를 이동시킵니다.
											} else {
												$('.radio-value-detail')
														.val(''); // 입력된 과일 종류 값이 있으면, 초기화합니다.
												$('.radio-value-detail').attr(
														'disabled', true); // 과일 종류를 입력하는 input 을 비활성화합니다.
											}

										});
							</script> --></label>
					</div>
				</div>


				<div style="display: flex; justify-content: center; align-items: center;">
					<input type="button" class="btn btn-secondary" onclick="history.back()" value="취소">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" class="btn btn-info" onclick="return pwEmailChk()" value="등록">
				</div>
				<input type="hidden" name="admEmail" id="admEmail">
			</form>
		</div>
	</main>

	<br>
	<br>
	<br>

	<%@ include file="../include/footer.jsp"%>
	
	<script>
	function goPopup(){
	//경로는 시스템에 맞게 수정하여 사용
	//호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를
	//호출하게 됩니다.
	console.log('popup');
	                       //경로 지정해줄때 컨트롤러에서 넘어오기 때문에 ./으로 하면 경로를 못찾음
	var pop = window.open("/talkdog/common/jusoPopup.jsp","pop","width=570,height=420, left=500, top=200, scrollbars=yes, resizable=yes"); 
	//** 2017년 5월 모바일용 팝업 API 기능 추가제공 **/
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서
	// 실제 주소검색 URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	// var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	function jusoCallBack(roadAddrPart1,addrDetail,roadAddrPart2,zipNo){
	 // 2017년 2월 제공항목이 추가되었습니다. 원하시는 항목을 추가하여 사용하시면 됩니다.
	 $('#zipNo').val(zipNo);
	 $('#admAdd1').val(roadAddrPart1);
	 $('#admAdd2').val(addrDetail);
	 $('#admAdd3').val(roadAddrPart2);
	 
// 	 document.form.roadFullAddr.value = roadFullAddr;
// 	 document.form.roadAddrPart1.value = roadAddrPart1;
// 	 document.form.roadAddrPart2.value = roadAddrPart2;
// 	 documentform.addrDetail.value = addrDetail;
// 	 document.form.zipNo.value = zipNo;
};	
</script>
	
</body>
</html>