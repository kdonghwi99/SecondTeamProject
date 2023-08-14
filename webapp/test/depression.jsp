<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/talkdog/resources/js/script.js"></script>
  <style>
    
.inspection-box {
  width: 70%; /* 원하는 너비를 지정해주세요. */
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
<meta charset="UTF-8">
<title>우울 자기진단 검사</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="inspection-box">
    <form method="" action="">
        <fieldset>
            <legend class="hide" title="우울 자기진단 검사">우울 자기진단 검사</legend>
            <div class="con-box">
                <h4 class="h4-tit01">우울</h4>
                <p class="con-p">
                    아래에 있는 항묵들은 지난 일주일 동안의 당신의 상태에 대한 질문입니다. 그와 같은 일들이 지난 일주일 동안 얼마나 자주 일어났었는지 답변해 주십시오.
                </p>
              <p class="txt-blue mg-b10">(1일 이하 : 0점, 1~2일 : 1점, 3~4일 : 2점, 5일 이상 : 3점)</p>
                <table cellpadding="0" cellspacing="0" class="yonsei-table survey-table" summary="우울 관련 자기진단 검사 설문 항목을 보여주는 표">
                    <caption>
                        우울</caption>
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
                                지난 일주일간 나는
                            </th>
                            <th class="border-l" scope="col">
                                1일 이하
                            </th>
                            <th class="border-l" scope="col">
                                1 ~ 2일
                            </th>
                            <th class="border-l" scope="col">
                                3 ~ 4일
                            </th>
                            <th class="border-l no_right" scope="col">
                                5일 이상
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                1
                            </td>
                            <td class="td_left border-l">
                                평소에는 아무렇지도 않던 일들이 괴롭고 귀찮게 느껴졌다.
                            </td>
                            <td class="border-l">
                                <label for="survey1-0" class="hide">1일 이하</label><input type="radio" id="survey1-0" name="survey_num1" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey1-1" class="hide">1~2일</label><input type="radio" id="survey1-1" name="survey_num1" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey1-2" class="hide">3~4일</label><input type="radio" id="survey1-2" name="survey_num1" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey1-3" class="hide">5일 이상</label><input type="radio" id="survey1-3" name="survey_num1" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                2
                            </td>
                            <td class="td_left border-l">
                                먹고 싶지 않고, 식욕이 없었다.
                            </td>
                            <td class="border-l">
                                <label for="survey2-0" class="hide">1일 이하</label><input type="radio" id="survey2-0" name="survey_num2" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey2-1" class="hide">1~2일</label><input type="radio" id="survey2-1" name="survey_num2" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey2-2" class="hide">3~4일</label><input type="radio" id="survey2-2" name="survey_num2" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey2-3" class="hide">5일 이상</label><input type="radio" id="survey2-3" name="survey_num2" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                3
                            </td>
                            <td class="td_left border-l">
                                어느 누가 도와준다 하더라도, 나의 울적한 기분을 떨쳐 버릴 수 없을 것 같았다.
                            </td>
                            <td class="border-l">
                                <label for="survey3-0" class="hide">1일 이하</label><input type="radio" id="survey3-0" name="survey_num3" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey3-1" class="hide">1~2일</label><input type="radio" id="survey3-1" name="survey_num3" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey3-2" class="hide">3~4일</label><input type="radio" id="survey3-2" name="survey_num3" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey3-3" class="hide">5일 이상</label><input type="radio" id="survey3-3" name="survey_num3" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                4
                            </td>
                            <td class="td_left border-l">
                                무슨 일을 하든 정신을 집중하기가 힘들었다.
                            </td>
                            <td class="border-l">
                                <label for="survey4-0" class="hide">1일 이하</label><input type="radio" id="survey4-0" name="survey_num4" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey4-1" class="hide">1~2일</label><input type="radio" id="survey4-1" name="survey_num4" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey4-2" class="hide">3~4일</label><input type="radio" id="survey4-2" name="survey_num4" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey4-3" class="hide">5일 이상</label><input type="radio" id="survey4-3" name="survey_num4" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                5
                            </td>
                            <td class="td_left border-l">
                                비교적 잘 지냈다.
                            </td>
                            <td class="border-l">
                                <label for="survey5-3" class="hide">1일 이하</label><input type="radio" id="survey5-3" name="survey_num5" value="3">
                            </td>
                            <td class="border-l">
                                <label for="survey5-2" class="hide">1~2일</label><input type="radio" id="survey5-2" name="survey_num5" value="2">
                            </td>
                            <td class="border-l">
                                <label for="survey5-1" class="hide">3~4일</label><input type="radio" id="survey5-1" name="survey_num5" value="1">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey5-0" class="hide">5일 이상</label><input type="radio" id="survey5-0" name="survey_num5" value="0">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                6
                            </td>
                            <td class="td_left border-l">
                                상당히 우울했다.
                            </td>
                            <td class="border-l">
                                <label for="survey6-0" class="hide">1일 이하</label><input type="radio" id="survey6-0" name="survey_num6" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey6-1" class="hide">1~2일</label><input type="radio" id="survey6-1" name="survey_num6" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey6-2" class="hide">3~4일</label><input type="radio" id="survey6-2" name="survey_num6" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey6-3" class="hide">5일 이상</label><input type="radio" id="survey6-3" name="survey_num6" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                7
                            </td>
                            <td class="td_left border-l">
                                모든 일들이 힘들게 느껴졌다.
                            </td>
                            <td class="border-l">
                                <label for="survey7-0" class="hide">1일 이하</label><input type="radio" id="survey7-0" name="survey_num7" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey7-1" class="hide">1~2일</label><input type="radio" id="survey7-1" name="survey_num7" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey7-2" class="hide">3~4일</label><input type="radio" id="survey7-2" name="survey_num7" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey7-3" class="hide">5일 이상</label><input type="radio" id="survey7-3" name="survey_num7" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                8
                            </td>
                            <td class="td_left border-l">
                                앞 일이 암담하게 느껴졌다.
                            </td>
                            <td class="border-l">
                                <label for="survey8-0" class="hide">1일 이하</label><input type="radio" id="survey8-0" name="survey_num8" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey8-1" class="hide">1~2일</label><input type="radio" id="survey8-1" name="survey_num8" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey8-2" class="hide">3~4일</label><input type="radio" id="survey8-2" name="survey_num8" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey8-3" class="hide">5일 이상</label><input type="radio" id="survey8-3" name="survey_num8" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                9
                            </td>
                            <td class="td_left border-l">
                                지금까지의 내 인생은 실패작이라는 생각이 들었다.
                            </td>
                            <td class="border-l">
                                <label for="survey9-0" class="hide">1일 이하</label><input type="radio" id="survey9-0" name="survey_num9" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey9-1" class="hide">1~2일</label><input type="radio" id="survey9-1" name="survey_num9" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey9-2" class="hide">3~4일</label><input type="radio" id="survey9-2" name="survey_num9" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey9-3" class="hide">5일 이상</label><input type="radio" id="survey9-3" name="survey_num9" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                10
                            </td>
                            <td class="td_left border-l">
                                적어도 보통 사람들만큼의 능력은 있었다고 생각한다.
                            </td>
                            <td class="border-l">
                                <label for="survey10-3" class="hide">1일 이하</label><input type="radio" id="survey10-3" name="survey_num10" value="3">
                            </td>
                            <td class="border-l">
                                <label for="survey10-2" class="hide">1~2일</label><input type="radio" id="survey10-2" name="survey_num10" value="2">
                            </td>
                            <td class="border-l">
                                <label for="survey10-1" class="hide">3~4일</label><input type="radio" id="survey10-1" name="survey_num10" value="1">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey10-0" class="hide">5일 이상</label><input type="radio" id="survey10-0" name="survey_num10" value="0">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                11
                            </td>
                            <td class="td_left border-l">
                                잠을 설쳤다(잠을 잘 이루지 못했다).
                            </td>
                            <td class="border-l">
                                <label for="survey11-0" class="hide">1일 이하</label><input type="radio" id="survey11-0" name="survey_num11" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey11-1" class="hide">1~2일</label><input type="radio" id="survey11-1" name="survey_num11" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey11-2" class="hide">3~4일</label><input type="radio" id="survey11-2" name="survey_num11" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey11-3" class="hide">5일 이상</label><input type="radio" id="survey11-3" name="survey_num11" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                12
                            </td>
                            <td class="td_left border-l">
                                두려움을 느꼈다.
                            </td>
                            <td class="border-l">
                                <label for="survey12-0" class="hide">1일 이하</label><input type="radio" id="survey12-0" name="survey_num12" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey12-1" class="hide">1~2일</label><input type="radio" id="survey12-1" name="survey_num12" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey12-2" class="hide">3~4일</label><input type="radio" id="survey12-2" name="survey_num12" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey12-3" class="hide">5일 이상</label><input type="radio" id="survey12-3" name="survey_num12" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                13
                            </td>
                            <td class="td_left border-l">
                                평소에 비해 말수가 적었다.
                            </td>
                            <td class="border-l">
                                <label for="survey13-0" class="hide">1일 이하</label><input type="radio" id="survey13-0" name="survey_num13" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey13-1" class="hide">1~2일</label><input type="radio" id="survey13-1" name="survey_num13" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey13-2" class="hide">3~4일</label><input type="radio" id="survey13-2" name="survey_num13" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey13-3" class="hide">5일 이상</label><input type="radio" id="survey13-3" name="survey_num13" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                14
                            </td>
                            <td class="td_left border-l">
                                세상에 홀로 있는 듯한 외로움을 느꼈다.
                            </td>
                            <td class="border-l">
                                <label for="survey14-0" class="hide">1일 이하</label><input type="radio" id="survey14-0" name="survey_num14" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey14-1" class="hide">1~2일</label><input type="radio" id="survey14-1" name="survey_num14" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey14-2" class="hide">3~4일</label><input type="radio" id="survey14-2" name="survey_num14" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey14-3" class="hide">5일 이상</label><input type="radio" id="survey14-3" name="survey_num14" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                15
                            </td>
                            <td class="td_left border-l">
                                큰 불만없이 생활했다.
                            </td>
                            <td class="border-l">
                                <label for="survey15-3" class="hide">1일 이하</label><input type="radio" id="survey15-3" name="survey_num15" value="3">
                            </td>
                            <td class="border-l">
                                <label for="survey15-2" class="hide">1~2일</label><input type="radio" id="survey15-2" name="survey_num15" value="2">
                            </td>
                            <td class="border-l">
                                <label for="survey15-1" class="hide">3~4일</label><input type="radio" id="survey15-1" name="survey_num15" value="1">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey15-0" class="hide">5일 이상</label><input type="radio" id="survey15-0" name="survey_num15" value="0">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                16
                            </td>
                            <td class="td_left border-l">
                                사람들이 나에게 차갑게 대하는 것 같았다.
                            </td>
                            <td class="border-l">
                                <label for="survey16-0" class="hide">1일 이하</label><input type="radio" id="survey16-0" name="survey_num16" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey16-1" class="hide">1~2일</label><input type="radio" id="survey16-1" name="survey_num16" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey16-2" class="hide">3~4일</label><input type="radio" id="survey16-2" name="survey_num16" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey16-3" class="hide">5일 이상</label><input type="radio" id="survey16-3" name="survey_num16" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                17
                            </td>
                            <td class="td_left border-l">
                                갑자기 울음이 나왔다.
                            </td>
                            <td class="border-l">
                                <label for="survey17-0" class="hide">1일 이하</label><input type="radio" id="survey17-0" name="survey_num17" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey17-1" class="hide">1~2일</label><input type="radio" id="survey17-1" name="survey_num17" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey17-2" class="hide">3~4일</label><input type="radio" id="survey17-2" name="survey_num17" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey17-3" class="hide">5일 이상</label><input type="radio" id="survey17-3" name="survey_num17" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                18
                            </td>
                            <td class="td_left border-l">
                                마음이 슬펐다.
                            </td>
                            <td class="border-l">
                                <label for="survey18-0" class="hide">1일 이하</label><input type="radio" id="survey18-0" name="survey_num18" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey18-1" class="hide">1~2일</label><input type="radio" id="survey18-1" name="survey_num18" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey18-2" class="hide">3~4일</label><input type="radio" id="survey18-2" name="survey_num18" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey18-3" class="hide">5일 이상</label><input type="radio" id="survey18-3" name="survey_num18" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                19
                            </td>
                            <td class="td_left border-l">
                                사람들이 나를 싫어하는 것 같았다.
                            </td>
                            <td class="border-l">
                                <label for="survey19-0" class="hide">1일 이하</label><input type="radio" id="survey19-0" name="survey_num19" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey19-1" class="hide">1~2일</label><input type="radio" id="survey19-1" name="survey_num19" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey19-2" class="hide">3~4일</label><input type="radio" id="survey19-2" name="survey_num19" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey19-3" class="hide">5일 이상</label><input type="radio" id="survey19-3" name="survey_num19" value="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                20
                            </td>
                            <td class="td_left border-l">
                                도무지 뭘 해 나갈 엄두가 나지 않았다.
                            </td>
                            <td class="border-l">
                                <label for="survey20-0" class="hide">1일 이하</label><input type="radio" id="survey20-0" name="survey_num20" value="0">
                            </td>
                            <td class="border-l">
                                <label for="survey20-1" class="hide">1~2일</label><input type="radio" id="survey20-1" name="survey_num20" value="1">
                            </td>
                            <td class="border-l">
                                <label for="survey20-2" class="hide">3~4일</label><input type="radio" id="survey20-2" name="survey_num20" value="2">
                            </td>
                            <td class="border-l no_right">
                                <label for="survey20-3" class="hide">5일 이상</label><input type="radio" id="survey20-3" name="survey_num20" value="3">
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
<% String userId = (String) session.getAttribute("sid"); %>
<a href="#a" title="검사 점수 확인" onclick="calculateScore()" data-userid="<%=userId%>">점수확인</a></div>
                <table cellpadding="0" cellspacing="0" class="yonsei-table no_mg" summary="채점 결과를 보여주는 표">
                    
                    <colgroup>
                        <col width="20%">
                        <col width="*">
                    </colgroup>
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">0 ~ 15점</th>
                            <td class="td_left border-l no_right">
                                때때로 일상적인 경험으로 인해 기분이 나빠질 수 있지만, 우울한 상태는 아닙니다. 기분좋은 일을 하면서 기분을 전환해 
                                보세요.
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">16 ~ 20점</th>
                            <td class="td_left border-l no_right">
                                살짝 기분이 가라앉아있는 상태입니다. 현재 심각하게 우울한 상태는 아니지만, 이러한 기분이 지속되거나 더 악화된다면, 전문적인 도움을 찾는 것이 바람직합니다.
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">21점 이상</th>
                            <td class="td_left border-l no_right">
                                임상적인 수준에서 우울증을 의심해볼 수 있는 상태입니다. 전문가와 의논을 통해 도움을 받는 것이 필요합니다. 교내 심리상담소, 혹은 정신건강의학과등 전문 기관을 방문할 것을 권고합니다.
                            </td>
                        </tr>
                    </tbody>
                </table>
                <p class="mark-p mg-t10">출처 : 조맹제, 김계희(1993): 중요우울증 환자 예비 평가에서 the Center for Epidemiologic Studies Depression Scale(CES-D)의 진단적 타당성 연구. 신경정신의학 32: 381-399</p>
            </div>
        </fieldset>
    </form>
</div>

</body>
</html>