<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="/talkdog/resources/js/script.js"></script>
<style>
    
.inspection-box {
  width: 80%; /* 원하는 너비를 지정해주세요. */
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
  <title>불안 자기진단 검사</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
<div class="inspection-box">
    <form method="" action="">
        <fieldset>
            <legend class="hide" title="불안 자기진단 검사">불안 자기진단 검사</legend>
            <div class="con-box">
                <h4 class="h4-tit01">불안</h4>
                <p class="con-p">
                    아래의 항목들은 불안한 상태에서 경험할 수 있는 것들입니다. 각 항목을 주의 깊게 읽고 지난 한 주 동안 당신의 경험이나 상태를 아래와 같이 그 정도에 따라 적절한 숫자로 표시하세요.
                </p>
                <p class="txt-blue mg-b10">(전혀 아니다 : 0점, 조금 느꼈다 : 1점, 상당히 느꼈다 : 2점, 심하게 느꼈다 : 3점)</p>
                <table cellpadding="0" cellspacing="0" class="yonsei-table survey-table" summary="불안 관련 자기진단 검사 설문 항목을 보여주는 표">
                    <caption>
                        불안</caption>
                    <colgroup>
                        <col width="10%">
                        <col width="*">
                        <col width="11%">
                        <col width="11%">
                        <col width="11%">
                        <col width="11%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">
                                번호
                            </th>
                            <th class="border-l" scope="col">
                                지난 한 주 동안 당신의 경험이나 상태
                            </th>
                            <th class="border-l" scope="col">
                                전혀 아니다
                            </th>
                            <th class="border-l" scope="col">
                                조금 느꼈다
                            </th>
                            <th class="border-l" scope="col">
                                상당히 느꼈다
                            </th>
                            <th class="border-l no_right" scope="col">
                                심하게 느꼈다
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                1
                            </td>
                            <td class="td_left border-l">
                                가끔 몸이 저리고 쑤시며 감각이 마비된 느낌을 받는다.
                            </td>
                            <td class="border-l">
                                <label for="survey1-0" class="hide">전혀 아니다</label><input type="radio" id="survey1-0" name="survey_num1" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey1-1" class="hide">조금느꼈다</label><input type="radio" id="survey1-1" name="survey_num1" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey1-2" class="hide">상당히느꼈다</label><input type="radio" id="survey1-2" name="survey_num1" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey1-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey1-3" name="survey_num1" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                2
                            </td>
                            <td class="td_left border-l">
                                흥분된 느낌을 받는다.
                            </td>
                            <td class="border-l">
                                <label for="survey2-0" class="hide">전혀 아니다</label><input type="radio" id="survey2-0" name="survey_num2" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey2-1" class="hide">조금느꼈다</label><input type="radio" id="survey2-1" name="survey_num2" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey2-2" class="hide">상당히느꼈다</label><input type="radio" id="survey2-2" name="survey_num2" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey2-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey2-3" name="survey_num2" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                3
                            </td>
                            <td class="td_left border-l">
                                가끔씩 다리가 떨리곤 한다.
                            </td>
                            <td class="border-l">
                                <label for="survey3-0" class="hide">전혀 아니다</label><input type="radio" id="survey3-0" name="survey_num3" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey3-1" class="hide">조금느꼈다</label><input type="radio" id="survey3-1" name="survey_num3" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey3-2" class="hide">상당히느꼈다</label><input type="radio" id="survey3-2" name="survey_num3" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey3-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey3-3" name="survey_num3" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                4
                            </td>
                            <td class="td_left border-l">
                                편안하게 쉴 수가 없다.
                            </td>
                            <td class="border-l">
                                <label for="survey4-0" class="hide">전혀 아니다</label><input type="radio" id="survey4-0" name="survey_num4" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey4-1" class="hide">조금느꼈다</label><input type="radio" id="survey4-1" name="survey_num4" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey4-2" class="hide">상당히느꼈다</label><input type="radio" id="survey4-2" name="survey_num4" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey4-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey4-3" name="survey_num4" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                5
                            </td>
                            <td class="td_left border-l">
                                매우 나쁜 일이 일어날 것 같은 두려움을 느낀다.
                            </td>
                            <td class="border-l">
                                <label for="survey5-0" class="hide">전혀 아니다</label><input type="radio" id="survey5-0" name="survey_num5" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey5-1" class="hide">조금느꼈다</label><input type="radio" id="survey5-1" name="survey_num5" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey5-2" class="hide">상당히느꼈다</label><input type="radio" id="survey5-2" name="survey_num5" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey5-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey5-3" name="survey_num5" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                6
                            </td>
                            <td class="td_left border-l">
                                어지러움(현기증)을 느낀다.
                            </td>
                            <td class="border-l">
                                <label for="survey6-0" class="hide">전혀 아니다</label><input type="radio" id="survey6-0" name="survey_num6" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey6-1" class="hide">조금느꼈다</label><input type="radio" id="survey6-1" name="survey_num6" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey6-2" class="hide">상당히느꼈다</label><input type="radio" id="survey6-2" name="survey_num6" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey6-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey6-3" name="survey_num6" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                7
                            </td>
                            <td class="td_left border-l">
                                가끔씩 심장이 두근거리고 빨리 뛴다.
                            </td>
                            <td class="border-l">
                                <label for="survey7-0" class="hide">전혀 아니다</label><input type="radio" id="survey7-0" name="survey_num7" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey7-1" class="hide">조금느꼈다</label><input type="radio" id="survey7-1" name="survey_num7" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey7-2" class="hide">상당히느꼈다</label><input type="radio" id="survey7-2" name="survey_num7" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey7-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey7-3" name="survey_num7" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                8
                            </td>
                            <td class="td_left border-l">
                                침착하지 못하다.
                            </td>
                            <td class="border-l">
                                <label for="survey8-0" class="hide">전혀 아니다</label><input type="radio" id="survey8-0" name="survey_num8" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey8-1" class="hide">조금느꼈다</label><input type="radio" id="survey8-1" name="survey_num8" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey8-2" class="hide">상당히느꼈다</label><input type="radio" id="survey8-2" name="survey_num8" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey8-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey8-3" name="survey_num8" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                9
                            </td>
                            <td class="td_left border-l">
                                자주 겁을 먹고 무서움을 느낀다.
                            </td>
                            <td class="border-l">
                                <label for="survey9-0" class="hide">전혀 아니다</label><input type="radio" id="survey9-0" name="survey_num9" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey9-1" class="hide">조금느꼈다</label><input type="radio" id="survey9-1" name="survey_num9" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey9-2" class="hide">상당히느꼈다</label><input type="radio" id="survey9-2" name="survey_num9" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey9-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey9-3" name="survey_num9" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                10
                            </td>
                            <td class="td_left border-l">
                                신경이 과민되어 있다.
                            </td>
                            <td class="border-l">
                                <label for="survey10-0" class="hide">전혀 아니다</label><input type="radio" id="survey10-0" name="survey_num10" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey10-1" class="hide">조금느꼈다</label><input type="radio" id="survey10-1" name="survey_num10" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey10-2" class="hide">상당히느꼈다</label><input type="radio" id="survey10-2" name="survey_num10" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey10-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey10-3" name="survey_num10" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                11
                            </td>
                            <td class="td_left border-l">
                                가끔씩 숨이 막히고 질식할 것 같다.
                            </td>
                            <td class="border-l">
                                <label for="survey11-0" class="hide">전혀 아니다</label><input type="radio" id="survey11-0" name="survey_num11" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey11-1" class="hide">조금느꼈다</label><input type="radio" id="survey11-1" name="survey_num11" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey11-2" class="hide">상당히느꼈다</label><input type="radio" id="survey11-2" name="survey_num11" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey11-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey11-3" name="survey_num11" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                12
                            </td>
                            <td class="td_left border-l">
                                자주 손이 떨린다.
                            </td>
                            <td class="border-l">
                                <label for="survey12-0" class="hide">전혀 아니다</label><input type="radio" id="survey12-0" name="survey_num12" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey12-1" class="hide">조금느꼈다</label><input type="radio" id="survey12-1" name="survey_num12" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey12-2" class="hide">상당히느꼈다</label><input type="radio" id="survey12-2" name="survey_num12" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey12-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey12-3" name="survey_num12" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                13
                            </td>
                            <td class="td_left border-l">
                                안절부절 못한다.
                            </td>
                            <td class="border-l">
                                <label for="survey13-0" class="hide">전혀 아니다</label><input type="radio" id="survey13-0" name="survey_num13" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey13-1" class="hide">조금느꼈다</label><input type="radio" id="survey13-1" name="survey_num13" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey13-2" class="hide">상당히느꼈다</label><input type="radio" id="survey13-2" name="survey_num13" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey13-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey13-3" name="survey_num13" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                14
                            </td>
                            <td class="td_left border-l">
                                미칠 것 같은 두려움을 느낀다.
                            </td>
                            <td class="border-l">
                                <label for="survey14-0" class="hide">전혀 아니다</label><input type="radio" id="survey14-0" name="survey_num14" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey14-1" class="hide">조금느꼈다</label><input type="radio" id="survey14-1" name="survey_num14" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey14-2" class="hide">상당히느꼈다</label><input type="radio" id="survey14-2" name="survey_num14" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey14-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey14-3" name="survey_num14" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                15
                            </td>
                            <td class="td_left border-l">
                                가끔씩 숨쉬기가 곤란할 때가 있다.
                            </td>
                            <td class="border-l">
                                <label for="survey15-0" class="hide">전혀 아니다</label><input type="radio" id="survey15-0" name="survey_num15" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey15-1" class="hide">조금느꼈다</label><input type="radio" id="survey15-1" name="survey_num15" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey15-2" class="hide">상당히느꼈다</label><input type="radio" id="survey15-2" name="survey_num15" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey15-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey15-3" name="survey_num15" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                16
                            </td>
                            <td class="td_left border-l">
                                죽을 것 같은 두려움을 느낀다.
                            </td>
                            <td class="border-l">
                                <label for="survey16-0" class="hide">전혀 아니다</label><input type="radio" id="survey16-0" name="survey_num16" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey16-1" class="hide">조금느꼈다</label><input type="radio" id="survey16-1" name="survey_num16" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey16-2" class="hide">상당히느꼈다</label><input type="radio" id="survey16-2" name="survey_num16" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey16-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey16-3" name="survey_num16" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                17
                            </td>
                            <td class="td_left border-l">
                                불안한 상태에 있다.
                            </td>
                            <td class="border-l">
                                <label for="survey17-0" class="hide">전혀 아니다</label><input type="radio" id="survey17-0" name="survey_num17" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey17-1" class="hide">조금느꼈다</label><input type="radio" id="survey17-1" name="survey_num17" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey17-2" class="hide">상당히느꼈다</label><input type="radio" id="survey17-2" name="survey_num17" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey17-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey17-3" name="survey_num17" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                18
                            </td>
                            <td class="td_left border-l">
                                자주 소화가 안되고 뱃속이 불편하다.
                            </td>
                            <td class="border-l">
                                <label for="survey18-0" class="hide">전혀 아니다</label><input type="radio" id="survey18-0" name="survey_num18" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey18-1" class="hide">조금느꼈다</label><input type="radio" id="survey18-1" name="survey_num18" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey18-2" class="hide">상당히느꼈다</label><input type="radio" id="survey18-2" name="survey_num18" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey18-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey18-3" name="survey_num18" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                19
                            </td>
                            <td class="td_left border-l">
                                가끔씩 기절할 것 같다.
                            </td>
                            <td class="border-l">
                                <label for="survey19-0" class="hide">전혀 아니다</label><input type="radio" id="survey19-0" name="survey_num19" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey19-1" class="hide">조금느꼈다</label><input type="radio" id="survey19-1" name="survey_num19" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey19-2" class="hide">상당히느꼈다</label><input type="radio" id="survey19-2" name="survey_num19" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey19-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey19-3" name="survey_num19" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                20
                            </td>
                            <td class="td_left border-l">
                                자주 얼굴이 붉어지곤 한다.
                            </td>
                            <td class="border-l">
                                <label for="survey20-0" class="hide">전혀 아니다</label><input type="radio" id="survey20-0" name="survey_num20" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey20-1" class="hide">조금느꼈다</label><input type="radio" id="survey20-1" name="survey_num20" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey20-2" class="hide">상당히느꼈다</label><input type="radio" id="survey20-2" name="survey_num20" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey20-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey20-3" name="survey_num20" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                21
                            </td>
                            <td class="td_left border-l">
                                땀을 많이 흘린다.
                            </td>
                            <td class="border-l">
                                <label for="survey21-0" class="hide">전혀 아니다</label><input type="radio" id="survey21-0" name="survey_num21" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey21-1" class="hide">조금느꼈다</label><input type="radio" id="survey21-1" name="survey_num21" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey21-2" class="hide">상당히느꼈다</label><input type="radio" id="survey21-2" name="survey_num21" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey21-3" class="hide">심하게 느꼈다</label><input type="radio" id="survey21-3" name="survey_num21" value="3">
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
       <div class="result-box" id="result01">
    <p><span class="result-num"></span> 점</p>
    <a href="#a" title="검사 점수 확인" onclick="calculateScore()">점수확인</a>
</div>
                <table cellpadding="0" cellspacing="0" class="yonsei-table no_mg" summary="채점 결과를 보여주는 표">
                    
                    <colgroup>
                        <col width="20%">
                        <col width="*">
                    </colgroup>
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">0 ~ 10점</th>
                            <td class="td_left border-l no_right">
                                현재 불안하지 않은 상태입니다.
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">11 ~ 30점</th>
                            <td class="td_left border-l no_right">
                                가벼운 불안 상태에 있어 보입니다. 불안을 전환할 수 있는 노력이 필요합니다.
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">31 ~ 43점</th>
                            <td class="td_left border-l no_right">
                                상당한 정도의 불안 상태에 있어 보입니다. 불안상태를 극복하기 위한 적극적인 노력이 필요하며 이런 상태가 두어달 이상 지속된 경우에는 전문가의 도움을 구하십시오.
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">44점 이상</th>
                            <td class="td_left border-l no_right">
                                심각한 불안 상태에 있어 보입니다. 가능한 한 빨리 전문가의 도움을 받으십시오.
                            </td>
                        </tr>
                    </tbody>
                </table>                
            </div>
        </fieldset>
    </form>
</div>

</body></html>