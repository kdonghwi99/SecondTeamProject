/**
 * 메소드들 모음집
 */
//로그아웃
function logout() {
	console.log("test")
	if (confirm('로그아웃 하시겠습니까?')) {
		//logout.jsp로 리다이렉트
		location.href = "/talkdog/common/logout.jsp"
	}
}


//비밀번호 일치 확인, 이메일 합치기
function pwEmailChk() {
	console.log('pwEmailChk');
	var pw = document.querySelector('#admPw').value;
	var pwchk = document.querySelector('#pwchk').value;
	
	/*var email1 = document.querySelector('#email1').value;
	var email2 = document.querySelector('#email2').value;*/

	// 비밀번호 일치하는지 확인
	if (pw != pwchk) {
		//		event.preventDefault();
		document.querySelector('#pwchk').setCustomValidity('비밀번호가 일치하지 않습니다.');
	} else {
		document.querySelector('#pwchk').setCustomValidity('');

	}

	//이메일 합치기

	var emailf = document.getElementById("email1").value;
	var emailb = document.getElementById("email2").value;
	var email = emailf + "@" + emailb;
	
	document.querySelector('#admEmail').value = email;
	console.log("이메일 찍힘?");
}

$(document).ready(function() {
	$("#email3").on("change", function() {
		setEmail();
	});
});


function setEmail(obj) {
	// 이메일 직접 입력 처리
	// 만들어뒀던거 가져오기

	if ($('#email3').val() == 'self') {			// 직접 입력을 선택하면
		$('#email2').prop('disabled', false); 	// 입력 가능하게 disabled 비활성화
		$('#email2').val(""); 					// 텍스트 입력란 비우기
		$('#email2').focus(); 					// 자동 포커스
	} else if ($('#email3').val() == 'gmail') {	// gmail.com을 선택하면
		$('#email2').val('gmail.com');			// value를 gmail.com로 지정
		$('#email2').prop('disabled', true); 	// 입력하지 못하게 disabled 활성화 -> readOnly = true도 가능
	} else {									// naver.com을 선택하면
		$('#email2').val('naver.com');			// value를 naver.com로 지정 
		$('#email2').prop('disabled', true); 	// 입력하지 못하게 disabled 활성화
	}
}