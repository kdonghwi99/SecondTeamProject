
// 문의글 등록 화면에서 "취소" 버튼 클릭 시 
      $('#cancel').click(function(event) {
          const cancel = confirm('작성하던 글이 모두 사라집니다. \n문의글 등록을 취소하시겠습니까?');
          if (cancel) {
        	  history.back(); 
          }else if(!cancel){
        	  event.preventDefault();
          }
      });
      
function insertCancel(event){
	if(confirm('작성하던 글이 모두 사라집니다. \n문의글 등록을 취소하시겠습니까?')){
		 history.back(); 
    }else if(!cancel){
        	  event.preventDefault();
    };
}   
      

//문의글삭제
function qnaDelChk(qnaNo, category, pageNum){
	if(confirm('해당 글을 삭제하시겠습니까?')){
		//확인 클릭 시
		location.href="./Remove.do?qnaNo=" + qnaNo + "&category=" + category+ "&pageNum=" + pageNum;
	};
}

//문의글 댓글 삭제
function replydelChk(qnaNo, category, pageNum){
	if(confirm('해당 댓글을 삭제하시겠습니까?')){
		//확인 클릭 시
		location.href="./ReplyUpdate.do?pageNum="+pageNum+"&qnaNo=" + qnaNo + "&category=" + category+ "&qnaReply=";
	};
}


//장바구니 비우기 
function cartAllRemove(sid){
	if(confirm('정말 장바구니를 비우시겠습니까?')){
		//확인 클릭 시
		location.href="./CartAllRemove.do?sid="+sid;
	};
}

//개별 장바구니 삭제
function cartRemove(sid, cartNo){
	if(confirm('해당 상품을 삭제하시겠습니까?')){
		//확인 클릭 시
		location.href="./CartRemove.do?sid="+ sid + "&cartNo=" + cartNo;
	};
}


$(document).ready(function() {
    // 수량 조절 버튼 클릭 시 수량 업데이트
    $('.quantity-controls').each(function() {
        const $quantityText = $(this).find('.quantity-text');			//수량 표시
        const $quantityMinus = $(this).find('.quantity-minus');		//수량 감소 버튼
        const $quantityPlus = $(this).find('.quantity-plus');			//수량 증가 버튼
        const productId = $quantityMinus.data('product-id');
        const cartNo = $quantityMinus.data('cart-no');
        const $applyButton = $(this).find('.apply-button');

        $quantityMinus.on('click', function() {
            const currentQuantity = parseInt($quantityText.text(), 10);
            if (currentQuantity > 1) {
                updateQuantity(currentQuantity - 1);
            }
        });

        $quantityPlus.on('click', function() {
            const currentQuantity = parseInt($quantityText.text(), 10);
            updateQuantity(currentQuantity + 1);
        });

        $applyButton.on('click', function() { // 적용 버튼 클릭 시
            location.reload(); // 페이지 새로고침
        });
        
        
        function updateQuantity(newQuan) {
            // AJAX를 사용하여 서버로 수량 업데이트 요청 전송
            $.ajax({
                url: './CartUpdate.do',
                type: 'POST',
                data: { cartNo: cartNo, newQuan: newQuan },
                success: function(response) {
                    // 서버에서 업데이트가 성공적으로 처리되면 수량 표시 업데이트
                    $quantityText.text(newQuan);
                },
                error: function(error) {
                    alert('수량 변경에 실패하였습니다.');
                }
            });
        }
    });
});



/**
 * /resources/js/script.js
 */

 function delChk() {
	 // 공지사항 삭제 시 확인 메서드
	 if(confirm('해당 글을 삭제하시겠습니까?')) {
		$('form').attr('action', './NoticeRemove.do').submit();
		// form의 action 경로를 ./NoticeRemove.do로 바꾸고 submit하기 
 	}
 }
 
function updChk() {
	// 게시물 수정 시 확인 메서드
    if (confirm("해당 글을 수정하시겠습니까?")) {
        document.querySelector("form").submit();
        // 확인 누르면 form의 경로로 submit하기
    }
}

function insChk() {
	// 게시물 등록 시 확인 메서드
    if (confirm("글을 등록하시겠습니까?")) {
        document.querySelector("form").submit();
        // 확인 누르면 form의 경로로 submit하기
    }
}

 function commDelChk() {
	 // 커뮤니티 글 삭제 시 확인 메서드
	 if(confirm('해당 글을 삭제하시겠습니까?')) {
		// $('form').attr('action', './CommRemove.do').submit();
		// form의 action 경로를 ./CommRemove.do로 바꾸고 submit하기 
 	}
 }
 

document.addEventListener('DOMContentLoaded', () => {
  const heartButton = document.getElementById('heartButton');
  const likesCount = document.getElementById('likesCount');

  heartButton.addEventListener('click', () => {
    heartButton.classList.add('clicked'); // 클래스 추가
    likesCount.textContent = parseInt(likesCount.textContent) + 1;	// 공감 수 증가
    setTimeout(() => {
      heartButton.classList.remove('clicked'); // 클래스 제거 (애니메이션 종료 후)
    }, 500); // 0.5초 지연 후 제거 (애니메이션 시간과 동일한 값으로 설정)
  });
});

 function cmreDelChk() {
	 // 커뮤니티 댓글 삭제 시 확인 메서드
	 if(confirm('댓글을 삭제하시겠습니까?')) {
//		$('form').attr('action', './CmreRemove.do').submit();
		// form의 action 경로를 ./CmreRemove.do로 바꾸고 submit하기 
 	}
 }
 

 
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