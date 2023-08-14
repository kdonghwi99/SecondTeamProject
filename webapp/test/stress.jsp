<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="/talkdog/resources/js/script.js"></script>
<script>
window.onload = function() {
    // 기존 변수들
    var resultBtn = document.querySelector('#result02 a');
    var resultCnt = document.querySelector('.result-cnt');
    var resultNum = document.querySelector('.result-num');

    // 체크박스들의 리스트
    var surveyCheckboxes = document.querySelectorAll('input[name="survey_chk_num"]');

    function updateRadioEnableState(checkbox) {
        var checkboxId = checkbox.id.slice('survey_chk'.length);
        var surveyRadios = document.querySelectorAll('input[name="survey_num' + checkboxId + '"]');
        surveyRadios.forEach(function(radio) {
            radio.disabled = !checkbox.checked;
            if (!checkbox.checked) {
                radio.checked = false;
            }
        });
    }

    surveyCheckboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            updateRadioEnableState(checkbox);
        });

        // 초기 상태 설정
        updateRadioEnableState(checkbox);
    });

    resultBtn.onclick = function(e) {
        e.preventDefault();

        var checkedCheckboxes = document.querySelectorAll('input[name="survey_chk_num"]:checked');
        var totalCount = checkedCheckboxes.length;

        var totalScore = 0;
        checkedCheckboxes.forEach(function(checkbox) {
            var checkboxId = checkbox.id.slice('survey_chk'.length);
            var selectedRadio = document.querySelector('input[name="survey_num' + checkboxId + '"]:checked');
            if (selectedRadio) {
                totalScore += parseInt(selectedRadio.value);
            }
        });

        resultCnt.textContent = totalCount;
        resultNum.textContent = totalScore;

        document.querySelector('.result-num-box').classList.remove('stress-hidden');
    }
}
</script>
<style>
    
.inspection-box {
  width: 50%; /* 원하는 너비를 지정해주세요. */
  margin: 0 auto; /* 요소를 가운데 정렬합니다. */
}
    .con-box {
      padding: 10px;
    }

    h4 {
      margin: 0;
    }

   
    .result-box {
      margin-bottom: 20px;
    }

    .result {
      margin-top: 20px;
    }
  </style>
  <title>스트레스 자기진단 검사</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>


<div class="inspection-box">
    <form method="" action="">
        <fieldset>
            <legend class="hide" title="스트레스 자기진단 검사">스트레스 자기진단 검사</legend>
            <div class="con-box">
                <h4 class="h4-tit01">스트레스 : 일상적 스트레스 척도(The Hassle Scale)</h4>
                <p class="con-p">
                    지시: 일상의 스트레스는 사소한 성가심으로부터 큰 압박감, 중요한 문제나 어려움에 이르는 자극입니다. 이러한 자극은 드물게 혹은 자주 일어날 수 있습니다. 아래에 개인이 일상적으로 스트레스를 느낄 수 있는 사건들의 목록이 있습니다. 먼저, 지난 달에 당신이 경험한 일상적 스트레스들에 동그라미를 치세요. 그 다음에 당신이 선택한 문항의 오른 편에 있는 숫자들을 보고 각 스트레스가 얼마나 자주 일어났는지를 표시하세요. 
                </p>
                <p class="txt-blue mg-b10">(다소 1점, 중간 2점, 매우 3점)</p>
                <table cellpadding="0" cellspacing="0" class="yonsei-table survey-table02" summary="스트레스 관련 자기진단 검사 설문 항목을 보여주는 표">
                    <caption>
                        스트레스</caption>
                    <colgroup>
                        <col width="10%">
                        <col width="*">
                        <col width="11%">
                        <col width="11%">
                        <col width="11%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col" rowspan="2">
                                번호
                            </th>
                            <th class="border-l" scope="col" rowspan="2">
                                일상적 스트레스
                            </th>
                            <th class="border-l no_right" scope="col" colspan="3">
                                얼마나 자주
                            </th>
                        </tr>
                        <tr>
                            <th class="border-l" scope="col">
                                다소
                            </th>
                            <th class="border-l" scope="col">
                                중간
                            </th>
                            <th class="border-l no_right" scope="col">
                                매우
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                1
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk1" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk1">물건을 다른 자리에 두거나 잃어버림</label>
                            </td>
                            <td class="border-l">
                                <label for="survey1-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey1-1" name="survey_num1" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey1-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey1-2" name="survey_num1" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey1-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey1-3" name="survey_num1" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                2
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk2" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk2">문제를 일으키는 이웃</label>
                            </td>
                            <td class="border-l">
                                <label for="survey2-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey2-1" name="survey_num2" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey2-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey2-2" name="survey_num2" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey2-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey2-3" name="survey_num2" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                3 
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk3" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk3">사회적 의무(예를 들 것)</label>
                            </td>
                            <td class="border-l">
                                <label for="survey3-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey3-1" name="survey_num3" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey3-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey3-2" name="survey_num3" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey3-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey3-3" name="survey_num3" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                4
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk4" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk4">남을 배려하지 않는 흡연자</label>
                            </td>
                            <td class="border-l">
                                <label for="survey4-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey4-1" name="survey_num4" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey4-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey4-2" name="survey_num4" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey4-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey4-3" name="survey_num4" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                5
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk5" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk5">자신의 미래에 대한 생각의 어려움</label>
                            </td>
                            <td class="border-l">
                                <label for="survey5-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey5-1" name="survey_num5" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey5-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey5-2" name="survey_num5" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey5-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey5-3" name="survey_num5" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                6
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk6" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk6">죽음에 대한 생각</label>
                            </td>
                            <td class="border-l">
                                <label for="survey6-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey6-1" name="survey_num6" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey6-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey6-2" name="survey_num6" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey6-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey6-3" name="survey_num6" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                7
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk7" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk7">가족의 건강</label>
                            </td>
                            <td class="border-l">
                                <label for="survey7-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey7-1" name="survey_num7" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey7-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey7-2" name="survey_num7" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey7-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey7-3" name="survey_num7" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                8
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk8" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk8">의복에 대한 돈이 충분하지 않음</label>
                            </td>
                            <td class="border-l">
                                <label for="survey8-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey8-1" name="survey_num8" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey8-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey8-2" name="survey_num8" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey8-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey8-3" name="survey_num8" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                9
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk9" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk9">주거에 대한 돈이 충분하지 않음</label>
                            </td>
                            <td class="border-l">
                                <label for="survey9-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey9-1" name="survey_num9" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey9-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey9-2" name="survey_num9" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey9-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey9-3" name="survey_num9" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                10
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk10" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk10">돈을 빌리는 것에 대한 걱정</label>
                            </td>
                            <td class="border-l">
                                <label for="survey10-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey10-1" name="survey_num10" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey10-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey10-2" name="survey_num10" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey10-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey10-3" name="survey_num10" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                11
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk11" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk11">외상을 하는 것에 대한 걱정</label>
                            </td>
                            <td class="border-l">
                                <label for="survey11-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey11-1" name="survey_num11" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey11-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey11-2" name="survey_num11" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey11-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey11-3" name="survey_num11" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                12
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk12" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk12">응급 상황에 필요한 돈에 대한 걱정</label>
                            </td>
                            <td class="border-l">
                                <label for="survey12-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey12-1" name="survey_num12" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey12-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey12-2" name="survey_num12" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey12-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey12-3" name="survey_num12" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                13
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk13" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk13">누군가가 당신에게 돈을 빌려감</label>
                            </td>
                            <td class="border-l">
                                <label for="survey13-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey13-1" name="survey_num13" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey13-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey13-2" name="survey_num13" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey13-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey13-3" name="survey_num13" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                14
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk14" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk14">당신과 같이 살지 않는 누군가를 위한 재정적 책임감</label>
                            </td>
                            <td class="border-l">
                                <label for="survey14-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey14-1" name="survey_num14" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey14-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey14-2" name="survey_num14" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey14-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey14-3" name="survey_num14" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                15
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk15" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk15">수도, 전기 등이 끊김</label>
                            </td>
                            <td class="border-l">
                                <label for="survey15-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey15-1" name="survey_num15" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey15-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey15-2" name="survey_num15" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey15-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey15-3" name="survey_num15" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                16
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk16" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk16">너무 많이 담배를 피움</label>
                            </td>
                            <td class="border-l">
                                <label for="survey16-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey16-1" name="survey_num16" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey16-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey16-2" name="survey_num16" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey16-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey16-3" name="survey_num16" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                17
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk17" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk17">음주</label>
                            </td>
                            <td class="border-l">
                                <label for="survey17-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey17-1" name="survey_num17" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey17-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey17-2" name="survey_num17" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey17-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey17-3" name="survey_num17" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                18 
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk18" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk18">(처방받지 않은)약물의 개인적 사용</label>
                            </td>
                            <td class="border-l">
                                <label for="survey18-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey18-1" name="survey_num18" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey18-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey18-2" name="survey_num18" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey18-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey18-3" name="survey_num18" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                19
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk19" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk19">너무나 많은 책임감</label>
                            </td>
                            <td class="border-l">
                                <label for="survey19-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey19-1" name="survey_num19" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey19-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey19-2" name="survey_num19" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey19-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey19-3" name="survey_num19" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                20
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk20" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk20">아이를 가질지에 대한 결정</label>
                            </td>
                            <td class="border-l">
                                <label for="survey20-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey20-1" name="survey_num20" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey20-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey20-2" name="survey_num20" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey20-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey20-3" name="survey_num20" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                21
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk21" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk21">가족이 아닌 사람과 한 집에 사는 것</label>
                            </td>
                            <td class="border-l">
                                <label for="survey21-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey21-1" name="survey_num21" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey21-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey21-2" name="survey_num21" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey21-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey21-3" name="survey_num21" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                22
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk22" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk22">반려동물을 돌보는 것</label>
                            </td>
                            <td class="border-l">
                                <label for="survey22-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey22-1" name="survey_num22" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey22-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey22-2" name="survey_num22" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey22-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey22-3" name="survey_num22" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                23
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk23" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk23">식사 계획세우기</label>
                            </td>
                            <td class="border-l">
                                <label for="survey23-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey23-1" name="survey_num23" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey23-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey23-2" name="survey_num23" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey23-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey23-3" name="survey_num23" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                24
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk24" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk24">인생의 의미에 대한 걱정</label>
                            </td>
                            <td class="border-l">
                                <label for="survey24-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey24-1" name="survey_num24" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey24-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey24-2" name="survey_num24" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey24-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey24-3" name="survey_num24" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                25
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk25" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk25">쉬는 것이 어려움(문제)</label>
                            </td>
                            <td class="border-l">
                                <label for="survey25-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey25-1" name="survey_num25" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey25-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey25-2" name="survey_num25" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey25-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey25-3" name="survey_num25" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                26
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk26" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk26">결정을 내리는 것이 어려움</label>
                            </td>
                            <td class="border-l">
                                <label for="survey26-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey26-1" name="survey_num26" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey26-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey26-2" name="survey_num26" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey26-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey26-3" name="survey_num26" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                27
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk27" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk27">동료 직원들과 지내는 것에 대한 문제</label>
                            </td>
                            <td class="border-l">
                                <label for="survey27-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey27-1" name="survey_num27" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey27-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey27-2" name="survey_num27" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey27-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey27-3" name="survey_num27" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                28
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk28" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk28">당신을 힘들게 하는 고객이나 손님</label>
                            </td>
                            <td class="border-l">
                                <label for="survey28-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey28-1" name="survey_num28" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey28-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey28-2" name="survey_num28" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey28-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey28-3" name="survey_num28" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                29
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk29" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk29">집 유지(내부)</label>
                            </td>
                            <td class="border-l">
                                <label for="survey29-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey29-1" name="survey_num29" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey29-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey29-2" name="survey_num29" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey29-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey29-3" name="survey_num29" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                30
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk30" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk30">직업 안정성에 대한 걱정</label>
                            </td>
                            <td class="border-l">
                                <label for="survey30-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey30-1" name="survey_num30" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey30-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey30-2" name="survey_num30" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey30-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey30-3" name="survey_num30" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                31
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk31" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk31">은퇴에 대한 걱정</label>
                            </td>
                            <td class="border-l">
                                <label for="survey31-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey31-1" name="survey_num31" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey31-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey31-2" name="survey_num31" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey31-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey31-3" name="survey_num31" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                32
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk32" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk32">일시 해고 혹은 실직</label>
                            </td>
                            <td class="border-l">
                                <label for="survey32-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey32-1" name="survey_num32" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey32-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey32-2" name="survey_num32" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey32-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey32-3" name="survey_num32" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                33
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk33" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk33">현재 업무를 좋아하지 않음</label>
                            </td>
                            <td class="border-l">
                                <label for="survey33-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey33-1" name="survey_num33" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey33-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey33-2" name="survey_num33" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey33-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey33-3" name="survey_num33" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                34
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk34" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk34">동료들을 좋아하지 않음</label>
                            </td>
                            <td class="border-l">
                                <label for="survey34-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey34-1" name="survey_num34" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey34-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey34-2" name="survey_num34" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey34-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey34-3" name="survey_num34" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                35
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk35" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk35">생활 필수품을 사는데 돈이 충분하지 않음</label>
                            </td>
                            <td class="border-l">
                                <label for="survey35-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey35-1" name="survey_num35" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey35-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey35-2" name="survey_num35" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey35-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey35-3" name="survey_num35" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                36
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk36" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk36">음식을 사는 데 돈이 충분하지 않음</label>
                            </td>
                            <td class="border-l">
                                <label for="survey36-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey36-1" name="survey_num36" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey36-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey36-2" name="survey_num36" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey36-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey36-3" name="survey_num36" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                37
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk37" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk37">너무나 많은 방해들</label>
                            </td>
                            <td class="border-l">
                                <label for="survey37-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey37-1" name="survey_num37" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey37-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey37-2" name="survey_num37" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey37-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey37-3" name="survey_num37" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                38
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk38" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk38">기대하지 않은 손님</label>
                            </td>
                            <td class="border-l">
                                <label for="survey38-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey38-1" name="survey_num38" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey38-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey38-2" name="survey_num38" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey38-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey38-3" name="survey_num38" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                39
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk39" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk39">시간이 너무나 많음</label>
                            </td>
                            <td class="border-l">
                                <label for="survey39-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey39-1" name="survey_num39" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey39-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey39-2" name="survey_num39" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey39-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey39-3" name="survey_num39" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                40
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk40" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk40">기다려야만 함</label>
                            </td>
                            <td class="border-l">
                                <label for="survey40-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey40-1" name="survey_num40" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey40-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey40-2" name="survey_num40" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey40-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey40-3" name="survey_num40" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                41
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk41" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk41">사고에 대한 걱정</label>
                            </td>
                            <td class="border-l">
                                <label for="survey41-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey41-1" name="survey_num41" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey41-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey41-2" name="survey_num41" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey41-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey41-3" name="survey_num41" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                42
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk42" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk42">외로운 것</label>
                            </td>
                            <td class="border-l">
                                <label for="survey42-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey42-1" name="survey_num42" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey42-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey42-2" name="survey_num42" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey42-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey42-3" name="survey_num42" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                43
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk43" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk43">건강 관리에 쓸 돈이 충분하지 않음</label>
                            </td>
                            <td class="border-l">
                                <label for="survey43-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey43-1" name="survey_num43" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey43-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey43-2" name="survey_num43" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey43-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey43-3" name="survey_num43" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                44
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk44" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk44">직면해야 것에 대한 두려움</label>
                            </td>
                            <td class="border-l">
                                <label for="survey44-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey44-1" name="survey_num44" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey44-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey44-2" name="survey_num44" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey44-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey44-3" name="survey_num44" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                45
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk45" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk45">재정적 안정성</label>
                            </td>
                            <td class="border-l">
                                <label for="survey45-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey45-1" name="survey_num45" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey45-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey45-2" name="survey_num45" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey45-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey45-3" name="survey_num45" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                46
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk46" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk46">멍청한 실수들</label>
                            </td>
                            <td class="border-l">
                                <label for="survey46-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey46-1" name="survey_num46" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey46-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey46-2" name="survey_num46" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey46-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey46-3" name="survey_num46" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                47
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk47" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk47">자신을 표현할 수 없었음</label>
                            </td>
                            <td class="border-l">
                                <label for="survey47-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey47-1" name="survey_num47" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey47-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey47-2" name="survey_num47" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey47-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey47-3" name="survey_num47" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                48
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk48" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk48">신체적 질병</label>
                            </td>
                            <td class="border-l">
                                <label for="survey48-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey48-1" name="survey_num48" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey48-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey48-2" name="survey_num48" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey48-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey48-3" name="survey_num48" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                49
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk49" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk49">거절당하는것에 대한 두려움</label>
                            </td>
                            <td class="border-l">
                                <label for="survey49-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey49-1" name="survey_num49" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey49-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey49-2" name="survey_num49" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey49-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey49-3" name="survey_num49" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                50
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk50" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk50">임신의 어려움</label>
                            </td>
                            <td class="border-l">
                                <label for="survey50-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey50-1" name="survey_num50" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey50-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey50-2" name="survey_num50" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey50-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey50-3" name="survey_num50" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                51
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk51" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk51">신체적 문제에서 기인한 성적인 문제</label>
                            </td>
                            <td class="border-l">
                                <label for="survey51-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey51-1" name="survey_num51" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey51-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey51-2" name="survey_num51" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey51-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey51-3" name="survey_num51" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                52
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk52" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk52">전반적인 건강에 대한 걱정</label>
                            </td>
                            <td class="border-l">
                                <label for="survey52-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey52-1" name="survey_num52" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey52-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey52-2" name="survey_num52" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey52-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey52-3" name="survey_num52" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                53
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk53" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk53">사람들을 충분히 만나지 않음</label>
                            </td>
                            <td class="border-l">
                                <label for="survey53-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey53-1" name="survey_num53" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey53-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey53-2" name="survey_num53" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey53-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey53-3" name="survey_num53" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                54
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk54" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk54">친구나 친척이 너무 멀리 있음</label>
                            </td>
                            <td class="border-l">
                                <label for="survey54-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey54-1" name="survey_num54" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey54-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey54-2" name="survey_num54" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey54-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey54-3" name="survey_num54" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                55
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk55" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk55">식사 준비</label>
                            </td>
                            <td class="border-l">
                                <label for="survey55-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey55-1" name="survey_num55" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey55-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey55-2" name="survey_num55" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey55-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey55-3" name="survey_num55" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                56
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk56" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk56">시간 낭비</label>
                            </td>
                            <td class="border-l">
                                <label for="survey56-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey56-1" name="survey_num56" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey56-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey56-2" name="survey_num56" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey56-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey56-3" name="survey_num56" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                57
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk57" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk57">자동차 유지 관리</label>
                            </td>
                            <td class="border-l">
                                <label for="survey57-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey57-1" name="survey_num57" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey57-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey57-2" name="survey_num57" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey57-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey57-3" name="survey_num57" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                58
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk58" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk58">서류 양식 채우기</label>
                            </td>
                            <td class="border-l">
                                <label for="survey58-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey58-1" name="survey_num58" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey58-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey58-2" name="survey_num58" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey58-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey58-3" name="survey_num58" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                59
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk59" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk59">이웃의 수준 저하</label>
                            </td>
                            <td class="border-l">
                                <label for="survey59-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey59-1" name="survey_num59" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey59-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey59-2" name="survey_num59" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey59-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey59-3" name="survey_num59" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                60
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk60" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk60">자녀 교육에 대한 자금 조달</label>
                            </td>
                            <td class="border-l">
                                <label for="survey60-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey60-1" name="survey_num60" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey60-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey60-2" name="survey_num60" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey60-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey60-3" name="survey_num60" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                61
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk61" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk61">피고용인과의 문제</label>
                            </td>
                            <td class="border-l">
                                <label for="survey61-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey61-1" name="survey_num61" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey61-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey61-2" name="survey_num61" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey61-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey61-3" name="survey_num61" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                62
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk62" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk62">여성/남성이기 때문에 생기는 직업 문제</label>
                            </td>
                            <td class="border-l">
                                <label for="survey62-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey62-1" name="survey_num62" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey62-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey62-2" name="survey_num62" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey62-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey62-3" name="survey_num62" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                63
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk63" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk63">신체적 능력의 저하</label>
                            </td>
                            <td class="border-l">
                                <label for="survey63-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey63-1" name="survey_num63" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey63-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey63-2" name="survey_num63" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey63-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey63-3" name="survey_num63" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                64
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk64" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk64">학대당함</label>
                            </td>
                            <td class="border-l">
                                <label for="survey64-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey64-1" name="survey_num64" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey64-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey64-2" name="survey_num64" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey64-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey64-3" name="survey_num64" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                65
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk65" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk65">신체 기능에 대한 걱정</label>
                            </td>
                            <td class="border-l">
                                <label for="survey65-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey65-1" name="survey_num65" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey65-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey65-2" name="survey_num65" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey65-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey65-3" name="survey_num65" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                66
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk66" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk66">물가 상승</label>
                            </td>
                            <td class="border-l">
                                <label for="survey66-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey66-1" name="survey_num66" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey66-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey66-2" name="survey_num66" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey66-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey66-3" name="survey_num66" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                67
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk67" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk67">충분히 쉴 수 없는 것</label>
                            </td>
                            <td class="border-l">
                                <label for="survey67-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey67-1" name="survey_num67" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey67-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey67-2" name="survey_num67" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey67-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey67-3" name="survey_num67" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                68
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk68" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk68">충분히 수면을 취할 수 없는 것</label>
                            </td>
                            <td class="border-l">
                                <label for="survey68-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey68-1" name="survey_num68" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey68-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey68-2" name="survey_num68" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey68-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey68-3" name="survey_num68" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                69
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk69" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk69">늙어가는 부모와의 문제</label>
                            </td>
                            <td class="border-l">
                                <label for="survey69-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey69-1" name="survey_num69" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey69-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey69-2" name="survey_num69" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey69-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey69-3" name="survey_num69" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                70
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk70" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk70">자녀와의 문제</label>
                            </td>
                            <td class="border-l">
                                <label for="survey70-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey70-1" name="survey_num70" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey70-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey70-2" name="survey_num70" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey70-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey70-3" name="survey_num70" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                71
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk71" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk71">당신보다 어린 사람과의 문제</label>
                            </td>
                            <td class="border-l">
                                <label for="survey71-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey71-1" name="survey_num71" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey71-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey71-2" name="survey_num71" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey71-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey71-3" name="survey_num71" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                72
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk72" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk72">애인과의 문제</label>
                            </td>
                            <td class="border-l">
                                <label for="survey72-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey72-1" name="survey_num72" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey72-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey72-2" name="survey_num72" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey72-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey72-3" name="survey_num72" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                73
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk73" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk73">시력 혹은 청력의 어려움</label>
                            </td>
                            <td class="border-l">
                                <label for="survey73-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey73-1" name="survey_num73" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey73-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey73-2" name="survey_num73" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey73-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey73-3" name="survey_num73" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                74
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk74" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk74">가족에 대한 책임감으로 부담이 큼</label>
                            </td>
                            <td class="border-l">
                                <label for="survey74-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey74-1" name="survey_num74" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey74-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey74-2" name="survey_num74" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey74-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey74-3" name="survey_num74" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                75
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk75" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk75">할 일이 너무나 많음</label>
                            </td>
                            <td class="border-l">
                                <label for="survey75-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey75-1" name="survey_num75" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey75-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey75-2" name="survey_num75" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey75-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey75-3" name="survey_num75" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                76
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk76" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk76">도전적이지 않은 일</label>
                            </td>
                            <td class="border-l">
                                <label for="survey76-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey76-1" name="survey_num76" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey76-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey76-2" name="survey_num76" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey76-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey76-3" name="survey_num76" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                77
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk77" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk77">높은 기준을 충족시키는 것에 대한 걱정</label>
                            </td>
                            <td class="border-l">
                                <label for="survey77-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey77-1" name="survey_num77" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey77-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey77-2" name="survey_num77" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey77-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey77-3" name="survey_num77" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                78
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk78" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk78">친구 혹은 지인과의 재정적인 거래</label>
                            </td>
                            <td class="border-l">
                                <label for="survey78-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey78-1" name="survey_num78" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey78-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey78-2" name="survey_num78" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey78-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey78-3" name="survey_num78" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                79
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk79" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk79">직업 불만족</label>
                            </td>
                            <td class="border-l">
                                <label for="survey79-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey79-1" name="survey_num79" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey79-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey79-2" name="survey_num79" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey79-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey79-3" name="survey_num79" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                80
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk80" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk80">직업을 바꾸는 결정에 대한 걱정</label>
                            </td>
                            <td class="border-l">
                                <label for="survey80-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey80-1" name="survey_num80" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey80-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey80-2" name="survey_num80" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey80-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey80-3" name="survey_num80" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                81
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk81" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk81">읽기, 쓰기 또는 철자법 능력에 대한 문제</label>
                            </td>
                            <td class="border-l">
                                <label for="survey81-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey81-1" name="survey_num81" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey81-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey81-2" name="survey_num81" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey81-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey81-3" name="survey_num81" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                82
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk82" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk82">너무나 많은 회의</label>
                            </td>
                            <td class="border-l">
                                <label for="survey82-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey82-1" name="survey_num82" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey82-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey82-2" name="survey_num82" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey82-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey82-3" name="survey_num82" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                83
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk83" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk83">이혼 혹은 별거에 대한 문제</label>
                            </td>
                            <td class="border-l">
                                <label for="survey83-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey83-1" name="survey_num83" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey83-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey83-2" name="survey_num83" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey83-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey83-3" name="survey_num83" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                84
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk84" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk84">숫자 계산 능력에 대한 문제</label>
                            </td>
                            <td class="border-l">
                                <label for="survey84-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey84-1" name="survey_num84" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey84-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey84-2" name="survey_num84" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey84-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey84-3" name="survey_num84" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                85
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk85" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk85">뒷공론, 뒷담화</label>
                            </td>
                            <td class="border-l">
                                <label for="survey85-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey85-1" name="survey_num85" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey85-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey85-2" name="survey_num85" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey85-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey85-3" name="survey_num85" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                86
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk86" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk86">법적인 문제</label>
                            </td>
                            <td class="border-l">
                                <label for="survey86-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey86-1" name="survey_num86" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey86-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey86-2" name="survey_num86" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey86-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey86-3" name="survey_num86" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                87
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk87" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk87">체중에 관한 걱정</label>
                            </td>
                            <td class="border-l">
                                <label for="survey87-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey87-1" name="survey_num87" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey87-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey87-2" name="survey_num87" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey87-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey87-3" name="survey_num87" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                88
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk88" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk88">당신이 해야할 필요가 있는 일을 하기에 시간이 충분하지 않음</label>
                            </td>
                            <td class="border-l">
                                <label for="survey88-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey88-1" name="survey_num88" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey88-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey88-2" name="survey_num88" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey88-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey88-3" name="survey_num88" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                89
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk89" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk89">텔레비젼</label>
                            </td>
                            <td class="border-l">
                                <label for="survey89-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey89-1" name="survey_num89" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey89-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey89-2" name="survey_num89" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey89-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey89-3" name="survey_num89" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                90
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk90" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk90">개인적인 에너지가 충분하지 않음</label>
                            </td>
                            <td class="border-l">
                                <label for="survey90-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey90-1" name="survey_num90" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey90-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey90-2" name="survey_num90" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey90-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey90-3" name="survey_num90" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                91
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk91" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk91">내적 갈등에 대한 걱정</label>
                            </td>
                            <td class="border-l">
                                <label for="survey91-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey91-1" name="survey_num91" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey91-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey91-2" name="survey_num91" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey91-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey91-3" name="survey_num91" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                92
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk92" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk92">무엇을 할 지에 대해 갈등을 느낌</label>
                            </td>
                            <td class="border-l">
                                <label for="survey92-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey92-1" name="survey_num92" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey92-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey92-2" name="survey_num92" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey92-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey92-3" name="survey_num92" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                93
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk93" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk93">과거 결정에 대한 후회</label>
                            </td>
                            <td class="border-l">
                                <label for="survey93-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey93-1" name="survey_num93" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey93-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey93-2" name="survey_num93" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey93-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey93-3" name="survey_num93" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                94
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk94" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk94">생리 주기의 문제들</label>
                            </td>
                            <td class="border-l">
                                <label for="survey94-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey94-1" name="survey_num94" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey94-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey94-2" name="survey_num94" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey94-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey94-3" name="survey_num94" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                95
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk95" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk95">날씨</label>
                            </td>
                            <td class="border-l">
                                <label for="survey95-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey95-1" name="survey_num95" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey95-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey95-2" name="survey_num95" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey95-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey95-3" name="survey_num95" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                96
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk96" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk96">악몽들</label>
                            </td>
                            <td class="border-l">
                                <label for="survey96-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey96-1" name="survey_num96" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey96-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey96-2" name="survey_num96" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey96-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey96-3" name="survey_num96" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                97
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk97" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk97">출세하는 것에 대한 걱정</label>
                            </td>
                            <td class="border-l">
                                <label for="survey97-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey97-1" name="survey_num97" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey97-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey97-2" name="survey_num97" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey97-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey97-3" name="survey_num97" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                98
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk98" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk98">사장 혹은 감독자로부터 오는 괴롭힘</label>
                            </td>
                            <td class="border-l">
                                <label for="survey98-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey98-1" name="survey_num98" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey98-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey98-2" name="survey_num98" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey98-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey98-3" name="survey_num98" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                99
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk99" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk99">친구들과의 어려움</label>
                            </td>
                            <td class="border-l">
                                <label for="survey99-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey99-1" name="survey_num99" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey99-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey99-2" name="survey_num99" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey99-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey99-3" name="survey_num99" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                100
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk100" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk100">가족에게 쓸 시간이 충분하지 않음</label>
                            </td>
                            <td class="border-l">
                                <label for="survey100-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey100-1" name="survey_num100" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey100-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey100-2" name="survey_num100" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey100-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey100-3" name="survey_num100" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                101
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk101" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk101">교통수단의 문제</label>
                            </td>
                            <td class="border-l">
                                <label for="survey101-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey101-1" name="survey_num101" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey101-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey101-2" name="survey_num101" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey101-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey101-3" name="survey_num101" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                102
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk102" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk102">교통수단에 쓸 돈이 충분하지 않음</label>
                            </td>
                            <td class="border-l">
                                <label for="survey102-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey102-1" name="survey_num102" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey102-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey102-2" name="survey_num102" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey102-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey102-3" name="survey_num102" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                103
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk103" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk103">놀이와 휴양을 위한 돈이 충분하지 않음</label>
                            </td>
                            <td class="border-l">
                                <label for="survey103-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey103-1" name="survey_num103" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey103-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey103-2" name="survey_num103" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey103-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey103-3" name="survey_num103" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                104
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk104" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk104">쇼핑</label>
                            </td>
                            <td class="border-l">
                                <label for="survey104-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey104-1" name="survey_num104" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey104-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey104-2" name="survey_num104" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey104-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey104-3" name="survey_num104" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                105
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk105" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk105">타인의 편견과 차별</label>
                            </td>
                            <td class="border-l">
                                <label for="survey105-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey105-1" name="survey_num105" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey105-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey105-2" name="survey_num105" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey105-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey105-3" name="survey_num105" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                106
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk106" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk106">재산, 투자 혹은 세금</label>
                            </td>
                            <td class="border-l">
                                <label for="survey106-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey106-1" name="survey_num106" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey106-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey106-2" name="survey_num106" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey106-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey106-3" name="survey_num106" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                107
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk107" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk107">정원 또는 집 외관 관리</label>
                            </td>
                            <td class="border-l">
                                <label for="survey107-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey107-1" name="survey_num107" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey107-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey107-2" name="survey_num107" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey107-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey107-3" name="survey_num107" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                108
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk108" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk108">뉴스에 나오는 사건에 대한 걱정</label>
                            </td>
                            <td class="border-l">
                                <label for="survey108-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey108-1" name="survey_num108" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey108-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey108-2" name="survey_num108" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey108-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey108-3" name="survey_num108" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                109
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk109" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk109">소음</label>
                            </td>
                            <td class="border-l">
                                <label for="survey109-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey109-1" name="survey_num109" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey109-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey109-2" name="survey_num109" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey109-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey109-3" name="survey_num109" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                110
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk110" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk110">범죄</label>
                            </td>
                            <td class="border-l">
                                <label for="survey110-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey110-1" name="survey_num110" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey110-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey110-2" name="survey_num110" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey110-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey110-3" name="survey_num110" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                111
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk111" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk111">교통</label>
                            </td>
                            <td class="border-l">
                                <label for="survey111-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey111-1" name="survey_num111" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey111-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey111-2" name="survey_num111" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey111-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey111-3" name="survey_num111" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                112
                            </td>
                            <td class="td_left border-l">
                                <input type="checkbox" id="survey_chk112" name="survey_chk_num" class="survey-chk">
                                <label for="survey_chk112">환경오염</label>
                            </td>
                            <td class="border-l">
                                <label for="survey112-1" class="hide">다소</label><input type="radio" class="survey-radio" id="survey112-1" name="survey_num112" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey112-2" class="hide">중간</label><input type="radio" class="survey-radio" id="survey112-2" name="survey_num112" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey112-3" class="hide">매우</label><input type="radio" class="survey-radio" id="survey112-3" name="survey_num112" value="3">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </fieldset>
        <fieldset>
            <div class="con-box">
                <h4 class="h4-tit01">
                    채점결과
                </h4>
                <div class="result-box" id="result02">
                    <a href="#a" title="결과확인">결과확인</a>
                    <div class="result-num-box"> <!-- stress-hidden  -->
                        <p>선택한 항목 수 : <span class="result-cnt"></span></p>
                        <p>척도의 총점 : <span class="result-num"></span></p>
                    </div>
                    <p><!-- stress-hidden -->
                        당신이 경험하는 일상적인 골치거리의 수는 <span class="result-cnt"></span>입니다. 그리고 일상적 스트레스의 강도 점수는 <span class="result-num"></span>입니다.
                    </p>
                </div>
                <table cellpadding="0" cellspacing="0" class="yonsei-table no_mg" summary="해석지침을 보여주는 표"> <!-- stress-hidden -->
                    <caption>
                        해석지침</caption>
                    <colgroup>
                        <col width="20%">
                        <col width="*">
                    </colgroup>
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">해석지침</th>
                            <td class="td_left border-l no_right">
                                어느 시점에서든 전형적으로 대부분의 사람들은 25 - 30 개의 일상적인 골칫거리를 경험합니다. 만약 당신이 그것보다 더 많은 수의 일상적인 골칫거리를 경험한다면, 당신은 일상 생활의 좌절되는 작은 사건들로부터 평균이상의 스트레스를 경험하고 있을 것입니다. 그리고 이런 경우, 스트레스에 관련된 질환을 가질 위험성이 더 커집니다.
                                <br>
                                <br>
                                만약 스트레스 강도 점수가 골칫거리의 갯수보다 2배 이상이라면(즉, 골칫거리의 갯수X2 이상. 예를 들어, 골칫거리의 수가 30개일때, 60점 이상),작은 좌절들로부터 오는 스트레스 반응을 조절하기 위해 전문적인 도움을 받을 것을 추천합니다. 심리상담소나 정신건강의학과를 방문하는 것이 좋은 해결책을 찾는데 도움이 될 수 있습니다.
                            </td>
                        </tr>
                    </tbody>
                </table>
                <p class="mark-p mg-t10"><!-- stress-hidden -->
                    출처 : Anita DeLongis, James C. Coyne, Gayle Dakof,Susan Folkman, and Richard S. Lazarus, “Relationship of Daily Hassles, Uplifts, and Major Life Events to Health Status,” Health Psychology 1(1982):119-136.
                </p>
            </div>
        </fieldset>
    </form>
</div>


</body></html>