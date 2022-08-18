<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>회원가입</title>
   <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
    	function goSave() {
    		if ($("#host_id").val().trim() == '') {
    			alert('아이디를 입력해 주세요');
    			$("#host_id").focus();
    			return;
    		}
    		if ($("#host_email").val().trim() == '') {
    			alert('이메일을 입력해 주세요');
    			$("#host_email").focus();
    			return;
    		}
    		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
    		if(!reg_email.test($("#host_email").val())) {
    			alert('이메일 형식이 올바르지 않습니다.');
    			return;
    		}
    		var isCon = true;
    		$.ajax({
				url : 'emailDupCheck.do',
				data:{host_email:$("#host_email").val()},
				async:false,
				success:function(res) {
					if (res == 'true') {
						alert('입력한 이메일이 중복되었습니다. 다른 이메일을 입력해 주세요.');
						$("#host_email").val('');
						$("#host_email").focus();
						isCon = false;
						//return;
					}
				}
			});
    		$.ajax({
				url : 'idDupCheck.do',
				data:{email:$("#host_id").val()},
				async:false,
				success:function(res) {
					if (res == 'true') {
						alert('입력한 아이디가 중복되었습니다. 다른 아이디를 입력해 주세요.');
						$("#host_id").val('');
						$("#host_id").focus();
						isCon = false;
						//return;
					}
				}
			});
    		$.ajax({
    			url: "hpDupCheck.do",
    			data: {host_hp:$("#host_hp").val()},
    			async: false,
    			success:function(res){
    				if(res=='true'){
    					alert('입력한 휴대폰번호가 중복되었습니다. 다른 번호를 입력해 주세요');
    					$('#host_hp').val('');
    					$('#host_hp').focus();
    					isCon=false;
    				}
    			}
    		});
    		if (!isCon) return;
    		if ($("#host_pwd").val().trim() == '') {
    			alert('비밀번호를 입력해 주세요');
    			$("#host_pwd").focus();
    			return;
    		}
    		var reg_pwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
    		if( !reg_pwd.test($("#host_pwd").val()) ) {
    			alert("비밀번호는 영문,숫자,특수문자 조합으로 8자 이상 입력하세요.");
    			return;
    		}
    		if ($("#host_pwd").val() != $("#host_pwd_check").val()) {
    			alert('비밀번호를 확인해주세요.');
    			$("#host_pwd_check").focus();
    			return;
    		}
    		if ($("#host_name").val().trim() == '') {
    			alert('이름을 입력해 주세요');
    			$("#host_name").focus();
    			return;
    		}
    		if($("#host_hp").val().trim()==''){
    			alert('휴대폰번호를 입력해 주세요');
    			$("#host_hp"),focus();
    			return;
    		}
    		$("#frm").submit();
    		alert('가입을 축하드립니다');
    		
    	}
    	$(function(){
    		$("#edupCheckBtn").click(function(){
    			if ($("#host_email").val().trim() == '') {
    				alert('이메일을 입력해 주세요');
    				$("#host_email").focus();
    			} else {
	    			$.ajax({
	    				url : 'emailDupCheck.do',
	    				data:{host_email:$("#host_email").val()},
	    				success:function(res) {
	    					if (res == 'true') {
	    						alert('사용 불가');
	    					} else {
	    						alert('사용 가능');
	    					}
	    				}
	    			});
    			}
    		});
    		$("#idupCheckBtn").click(function(){
    			if ($("#host_id").val().trim() == '') {
    				alert('아이디를 입력해 주세요');
    				$("#host_id").focus();
    			} else {
	    			$.ajax({
	    				url : 'idDupCheck.do',
	    				data:{host_id:$("#host_id").val()},
	    				success:function(res) {
	    					if (res == 'true') {
	    						alert('사용 불가');
	    					} else {
	    						alert('사용 가능');
	    					}
	    				}
	    			});
    			}
    		});
    	
    	$("#hpdupCheckBtn1").click(function(){
			if ($("#host_hp").val().trim() == '') {
				alert('휴대폰번호를 입력해 주세요');
				$("#host_hp").focus();
			} else{
				$.ajax({
					url : 'hpDupCheck.do',
					data:{host_hp:$("#host_hp").val()},
					success:function(res) {
						if (res == 'true') {
							alert('사용 불가');
						} else {
							alert('사용 가능');
						}
					}
				});
			}
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
	                document.getElementById("addr1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("addr2").focus();
	            }
	        }).open();
	    }
	</script>
</head>
<body>
     <jsp:include page="/WEB-INF/views/includes/H_header.jsp"/>
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">HOST 회원가입</h3>
                <form name="frm" id="frm" action="join.do" method="post">
                <table class="board_write">
                    <caption>회원가입</caption>
                    <colgroup>
                        <col width="20%" />
                        <col width="*" />
                    </colgroup>
                    <tbody>
                    	<tr>
                            <th>*ID</th>
                            <td>
                                <input type="text" name="host_id" id="host_id" class="inNextBtn" style="float:left;">
                                <span class="host_id_check"><a href="javascript:;"  class="btn bgGray" style="float:left; width:auto; clear:none;" id="idupCheckBtn">중복확인</a></span>
                            </td>
                        </tr>
                        <tr>
                            <th>*이메일</th>
                            <td>
                                <input type="text" name="host_email" id="host_email" class="inNextBtn" style="float:left;">
                                <span class="host_email_check"><a href="javascript:;"  class="btn bgGray" style="float:left; width:auto; clear:none;" id="edupCheckBtn">중복확인</a></span>
                            </td>
                        </tr>
                        <tr>
                            <th>*비밀번호</th>
                            <td><input type="password" name="host_pwd" id="host_pwd" style="float:left;"> <span class="ptxt">비밀번호는 숫자, 영문, 특수문자 조합으로 8자 이상으로 입력해주세요.</span> </td>
                        </tr>
                        <tr>
                            <th>*비밀번호<span>확인</span></th>
                            <td><input type="password" name="host_pwd_check" id="host_pwd_check" style="float:left;"></td>
                        </tr>
                        <tr>
                            <th>*이름</th>
                            <td><input type="text" name="host_name" id="host_name" style="float:left;" maxlength="5" required> </td>
                        </tr>                   
                        <tr>
                            <th>*휴대폰 번호</th>
                            <td>
                                <input type="text" name="host_hp" id="host_hp" maxlength="15" style="float:left;">
                            	<span class="host_hp_check"><a href="javascript:;" class="btn bgGray" style="float:left; width:auto; clear:none;" id="hpdupCheckBtn1">중복확인</a></span>
                            </td>
                        </tr>
                        <tr>
                            <th>은행</th>
                            <td>
                                <input type="text" name="host_bank" id="host_bank" value=""  maxlength="15" style="float:left;">
                            	<span class="host_bank_check"><a href="javascript:;"  class="btn bgGray" style="float:left; width:auto; clear:none;" id="dupCheckBtn">은행확인</a></span>
                            </td>
                        </tr>
                        <tr>
                            <th>계좌번호</th>
                            <td>
                                <input type="text" name="host_accountno" id="host_accountno" value=""  maxlength="15" style="float:left;">
                                <span class="host_accountno_check"><a href="javascript:;"  class="btn bgGray" style="float:left; width:auto; clear:none;" id="dupCheckBtn">계좌확인</a></span>
                            </td>
                        </tr>
                    </tbody>
                </table>
                        <input type="hidden" name="host_checkEmail" id="host_checkEmail" value="0"/>
                </form>
                <!-- //write--->
                <div class="btnSet clear">
                	<div>
                    	<a class="btn bgGray" href="javascript:;"  onclick="goSave()">가입</a> &nbsp;&nbsp;
                    	<a class="btn bgGray" href="javascript:;"  onclick="history.back()">취소</a> &nbsp;&nbsp;
                    	<a class="btn bgGray" href="login.do" >로그인 </a>
                    </div>
            </div>
        </div>
        
</body>
</html>