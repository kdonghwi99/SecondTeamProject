/**
 * 
 */

/**
 * resources/js/script.js
 */
//1. 필요한 객체들을 찾아오기

//      var email = document.getElementById('email');
//      var email1 = document.getElementById('email1');
//      var email2 = document.getElementById('email2');
//      var email3 = document.getElementById('email3');
  



function calculateScore() {
  const scoreElements = document.querySelectorAll('input[type="radio"]:checked');
  let totalScore = 0;

  scoreElements.forEach((element) => {
    const score = parseInt(element.value);
    totalScore += score;
  });

  const resultNum = document.querySelector('.result-num');
  const totalScoreElement = document.getElementById('total-score');
  const scoreInterpretationElement = document.getElementById('score-interpretation');
  const resultBox = document.getElementById('result01');
  const result = document.getElementById('result');

  resultNum.textContent = totalScore;
  totalScoreElement.textContent = totalScore;
}

function delChk() {
    if (confirm('정말 삭제하시겠습니까?')) {
        $('form').attr('action', './BoardRemove.do').submit();
    }
}

$(document).ready(function() {
   
  $("#email3").on("change", function() {
      setEmail();
    });
    
   $('#submit').on('click', function(){
      pwEmailChk();
   }); 
    
});


function pwEmailChk(){
   
   //alert('pwEmailjChk()');   //함수 들어와졌는지 일단 확인
   
   //회원가입 정보 입력 화면에서 alert으로 띄우거나 
   //비밀번호 일치 확인
   if($('#pw').val() != $('#pwCheck').val() ){
      alert('비밀번호가 일치하지 않습니다.');
      event.preventDefault(); // 폼 제출 막기
       return false;
   }
   
   //이메일 합치기
   if($('#email1').val() !=null && $('#email2').val() != null){
      $('#email').val($('#email1').val() +"@"+ $('#email2').val());
   }
   
}



//function setEmail(obj){      //강사님이 obj는 왜 넣으셨던 거지?
function setEmail(){
   //이메일 직접입력 처리 (직접입력을 클릭했을 경우에)
   //email3 객체가 변경되었을 경우
      $('#email3').on('change',  function (){
         if($('#email3').attr("checked") === '직접 입력'){
            $('#email2').attr("disabled", false);
         }else{
            $('#email2').attr("disabled", true);
            $('#email2').val($('#email3').val());
         }
      });
}
//이 부분에 setEmail해서 onchange로 this 객체를 넘기든지 


 function logout(){
    if(confirm('로그아웃 하시겠습니까?')){
       location.href="../common/logout.jsp";   //logout.jsp로 보내기 ( 방법은 여러 가지 )
       
    }
 }
 
 
 //유효성 검사 - 정규표현식 활용
/* function checkProduct(){
    //패턴을 만듦자
    var pidPtn = /^P\d{4,9}$/;                     //상품코드 : P로 시작, 숫자 포함 5~10글자
    var pnamePth = /^[\w|가-힣|\-|\s]$/;               //상품명 : 영어, 숫자, _, -. 공백, 한글 가능
    var pricePtn = /\d/;                        //상품가격 - 숫자만 가능
    var pricePointPtn = /^\d+(?:[.]?[\d]?[\d])?$/;      //상품가격 - 소수점 둘째 자리까지만
    var stockPtn = /\d/;                        //재고수량 : 숫자만 가능
    
    if( !pidPtn.test( $('#pid').val() ) ){      //상품코드가 pidPtn에 맞지 않으면
       alert('[상품 코드]' + 
            '\nP와 숫자를 조합하여 5~10자로 입력해주세요.' + 
            '\n첫 글자는 반드시 P로 시작!');
       $('#pid').focus();
       
    }else if( !pnamePtn.test( $('#pname').val()) ){   //상품명
       alert('[상품명]' + 
            '\n20자 이내로 입력해주세요.' + 
            '\n특수문자는 _, -, 공백만 가능합니다.');
       $('#pname').focus();
       
    }else if( !pricePtn.test( $('#price').val() ) ) {      //상품 가격 - 숫자
        alert('[상품가격]' + 
               '\n숫자만 입력가능합니다.');
       $('#price').focus();
    }else if( !pricePointPtn.test( $('#price').val() ) ){   //상품 가격 - 소수점 둘째 자리
       
    }else if( !stockPtn.test( $('#stock').val() ) ){   //재고 수량 - 숫자
        alert('[재고수량]' + 
               '\n숫자만 입력가능합니다.');
       $('#stock').focus();
    }else{      
       //폼 전송
       $('form').submit();
    }*/
    

 document.addEventListener("DOMContentLoaded", () => {
  // Portfolio details containers hide/show
  let portfolioItems = document.querySelectorAll('.portfolio-item[data-toggle="modal"]');
  let body = document.querySelector('body');

  portfolioItems.forEach(item => {
    item.addEventListener('click', function() {
      body.classList.toggle('portfolio-modal-open');
    });
  });

  let closeModal = document.querySelector('.portfolio-modal-dismiss');
  closeModal.addEventListener('click', function() {
    body.classList.remove('portfolio-modal-open');
  });

  // Isotope
  var portfolioIsotope = new Isotope('.portfolio-container', {
    itemSelector: '.portfolio-item',
    layoutMode: 'fitRows'
  });

  let portfolioFilters = document.getElementById('portfolio-flters');
  let filters = portfolioFilters.querySelectorAll('li');

  filters.forEach(filter => {
    filter.addEventListener('click', function(e) {
      e.preventDefault();
      portfolioFilters.querySelector('.filter-active').classList.remove('filter-active');
      filter.classList.add('filter-active');

      portfolioIsotope.arrange({
        filter: filter.getAttribute('data-filter')
      });
      portfolioIsotope.on('arrangeComplete', function() {
        AOS.refresh();
      });
    });
  });

});