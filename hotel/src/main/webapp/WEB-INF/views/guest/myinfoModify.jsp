<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/includes/G_header.jsp"  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    />
<meta name="format-detection" content="telephone=no, address=no, email=no">
<meta name="keywords" content="">
<meta name="description" content="">
<title>내정보로그인</title>
<link rel="stylesheet" href="/hotel/css/reset.css" />
<link rel="stylesheet" href="/hotel/css/contents.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script language="javascript">
	function pwdChangePopup() {
		window.open("pwdChangePopup.do","hp","width=600px, height=400px");
	}
</script>
<script>
	function updateSave() {
		frm.submit();
		alert('수정에 성공하였습니다');
	};
	$(function(){
	$( "#birthday" ).datepicker({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
            ,minDate: "-100Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
        });
	});
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function zipcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    //document.getElementById("sample6_extraAddress").value = extraAddr;
	                	addr += extraAddr;
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zipcode').value = data.zonecode;
	                document.getElementById("guest_addr1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("guest_addr2").focus();
	            }
	        }).open();
	    };
</script>
<style>
.sub_a {
	text-align: center;
	font-size: 22px;
}
</style>
<body>
	 
	<form method="post" name="frm" id="frm" action="update.do" >
		<input type="hidden" name="guest_no" value="${loginInfo.guest_no }" />
		<div class="sub">
			<div class="size">
				<h1 class="sub_title">내정보수정</h1>
				<p class="sub_a">GUEST</p>
				<table class="board_write">
					<caption>회원수정</caption>
					<tbody>
						<tr>
							<th>아이디</th>
							<td>${loginInfo.guest_id}</td>
							<td></td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${loginInfo.guest_name}</td>
							<td></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="guest_email" id="guest_email" value="${loginInfo.guest_email}" /></td>
						</tr>
						<tr>
							<th>휴대폰번호</th>
							<td><input type="text" name="guest_hp" id="guest_hp" value="${loginInfo.guest_hp}" /></td>
						</tr>
						<tr>
							<th>계좌번호</th>
							<td><input type="text" name="g_bank" id="g_bank" value="${loginInfo.g_bank }" />
							&nbsp;&nbsp;&nbsp;<input type="text" name="g_accountno" id="g_accountno" value="${loginInfo.g_accountno }" /></td>
						</tr>
					</tbody>
				</table>
				<br>
				<br>
				<br>
				<table class="board_write">
					<tbody>
						<tr>
							<th>비밀번호</th>
							<td><input type="button" href="javascript:;" onclick="pwdChangePopup();" value="비밀번호바꾸기" /></td>
						</tr>
					</tbody>
				</table>
				<br>
				<br>
				<table class="board_write">
					<tbody>
						<tr>
							<th>생년월일</th>
                            <td><input type="text" name="guest_birth" id="birthday" style="float:left;" autocomplete="off" value="${loginInfo.guest_birth}" /> </td>
                        </tr>   		
						<tr>
                            <th rowspan="3">주소</th>
                            <td>
                                <input type="text" name="zipcode" id="zipcode" class="inNextBtn" style="float:left;" readonly>
                                <span class="email_check"><a href="javascript:zipcode();"  class="btn bgGray" style="float:left; width:auto; clear:none;">우편번호</a></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            	<input type="text" name="guest_addr1" id="guest_addr1" style="width:80%" readonly value="${loginInfo.guest_addr1 }">
                            </td>
                        </tr>
                        <tr>
                            <td>
                            	<input type="text" name="guest_addr2" id="geust_addr2" style="width:80%" value="${loginInfo.guest_addr2 }">
                            </td>
                        </tr>
					</tbody>
				</table>
				<div class="btnSet" style="positon:relative; reft:50%;">
					<input type="submit" class="bgGrayBtn" href="jacascript:;" value="수정" onclick="updateSave();" />
					<input type="button" onclick="location.href='deleteGuestInfo.do'" value="회원탈퇴" />
				</div>
			</div>
		</div>
	</form>
</body>
</html>