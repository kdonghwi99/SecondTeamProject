// ==================================================김소영
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


// ==================================================김소영
