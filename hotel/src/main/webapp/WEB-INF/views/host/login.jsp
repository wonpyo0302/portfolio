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
    <title>로그인</title>
    <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
    	function loginCheck1() {
    		if ($("#host_id1").val() == '') {
    			alert('아이디를 입력해 주세요');
    			$("#host_id1").focus();
    			return false;
    		}
    		if ($("#host_pwd1").val() == '') {
    			alert('비밀번호를 입력해 주세요');
    			$("#host_pwd1").focus();
    			return false;
    		}
    	}
    	$(document).ready(function(){
    		// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    	    var key = getCookie("key");
    	    $("#host_id1").val(key); 
    	     
    	    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
    	    if($("#host_id1").val() != ""){ 
    	        $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    	    }
    	     
    	    $("#checkId").change(function(){ // 체크박스에 변화가 있다면,
    	        if($("#checkId").is(":checked")){ // ID 저장하기 체크했을 때,
    	            setCookie("key", $("#host_id1").val(), 365); // 365일 동안 쿠키 보관
    	        }else{ // ID 저장하기 체크 해제 시,
    	            deleteCookie("key");
    	        }
    	    });
    	     
    	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    	    $("#host_id1").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
    	        if($("#checkId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
    	            setCookie("key", $("#host_id1").val(), 365); // 365일 동안 쿠키 보관
    	        }
    	    });

    	// 쿠키 저장하기 
    	// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
    	function setCookie(cookieName, value, exdays) {
    		var exdate = new Date();
    		exdate.setDate(exdate.getDate() + exdays);
    		var cookieValue = escape(value)
    				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
    		document.cookie = cookieName + "=" + cookieValue;
    	}

    	// 쿠키 삭제
    	function deleteCookie(cookieName) {
    		var expireDate = new Date();
    		expireDate.setDate(expireDate.getDate() - 1);
    		document.cookie = cookieName + "= " + "; expires="
    				+ expireDate.toGMTString();
    	}
         
    	// 쿠키 가져오기
    	function getCookie(cookieName) {
    		cookieName = cookieName + '=';
    		var cookieData = document.cookie;
    		var start = cookieData.indexOf(cookieName);
    		var cookieValue = '';
    		if (start != -1) { // 쿠키가 존재하면
    			start += cookieName.length;
    			var end = cookieData.indexOf(';', start);
    			if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
    				end = cookieData.length;
                console.log("end위치  : " + end);
    			cookieValue = cookieData.substring(start, end);
    		}
    		return unescape(cookieValue);
    	}
    });
    </script>
</head>
<body>
     <jsp:include page="/WEB-INF/views/includes/H_header.jsp"/>
        <form action="login.do" method="post" id="loginFrm1" name="loginFrm1" onsubmit="return loginCheck1();"><!-- header에서 id="board"이미 사용중이라서 board2로 함 -->
            <div class="sub">
                <div class="size">
                    <h3 class="sub_title">HOST 로그인</h3>
                    
                    <div class="member">
                        <div class="box">
                            <fieldset class="login_form">
                                <ul>
                                    <li><input type="text" id="host_id1" name="host_id" placeholder="아이디"></li>
                                    <li><input type="password" id="host_pwd1" name="host_pwd" placeholder="비밀번호"></li>
                                    <li><label><input type="checkbox" name="checkId" id="checkId"/> 아이디저장</label></li>
                                </ul>
                                <div class="login_btn"><input type="submit" value="로그인" alt="로그인" /></div>
                            </fieldset>
                            <div class="btnSet clear">
                                <div>
                                    <a href="join.do" class="btn">회원가입</a> 
                                    <a href="findHostEmail.do" class="btn">이메일/비밀번호 찾기</a>
                                </div>
                            </div>
                        </div>
                    </div>
        
                </div>
            </div>
        </form>
        
</body>
</html>