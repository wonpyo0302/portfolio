<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/views/admin/include/headHtml.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
    	function adminLoginCheck() {
    		if($("#admin_id").val() == '') {
    			alert('아이디를 입력해 주세요');
    			$("#admin_id").focus();
    			return false;
    		}
    		if($("#admin_pwd").val()=='') {
    			alert('비밀번호를 입력해 주세요');
    			$("#admin_pwd").focus();
    			return false;
    		}
    	}
    	$(document).ready(function(){
    		// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    	    var key = getCookie("key");
    	    $("#admin_id").val(key); 
    	     
    	    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
    	    if($("#admin_id").val() != ""){ 
    	        $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    	    }
    	     
    	    $("#checkId").change(function(){ // 체크박스에 변화가 있다면,
    	        if($("#checkId").is(":checked")){ // ID 저장하기 체크했을 때,
    	            setCookie("key", $("#admin_id").val(), 365); // 365일 동안 쿠키 보관
    	        }else{ // ID 저장하기 체크 해제 시,
    	            deleteCookie("key");
    	        }
    	    });
    	     
    	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    	    $("#admin_id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
    	        if($("#checkId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
    	            setCookie("key", $("#admin_id").val(), 365); // 365일 동안 쿠키 보관
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
<body >
<div id="login">
	<div class="title">
		<h1>둘이놀까 <span>관리자모드</span></h1>
		<p>관리자 로그인 후 이용가능합니다.</p>
	</div>
	<div class="login"> 
	<form name="board" id="board" method="post" action="" onsubmit="return loginCheck();">
		<fieldset>
			<legend>관리자모드 로그인</legend>
			<div class="bgBox">
				<div class="infoBox">
					<dl>
						<dt>
							<label for="id"><strong>아이디</strong></label>
						</dt>
						<dd>
							<input type="text" id="admin_id" name="admin_id" value="" title="아이디를 입력해주세요." style="ime-mode:inactive"/>
						</dd>
					</dl>
					<dl>
						<dt>
							<label for="password"><strong>비밀번호</strong></label>
						</dt>
						<dd>
							<input type="password" id="admin_pwd" name="admin_pwd" value="" title="비밀번호를 입력해주세요." />
						</dd>
					</dl>
				</div>
				<!-- //infoBox -->
				<input type="image" src="<%=request.getContextPath()%>/image/admin/member_login_btn.gif" alt="로그인" class="loginBtn" title="" />
			</div>
			<!-- //bgBox -->
			<div class="joinList">
				<input type="checkbox" name="checkId" id="checkId"/> <label for="reg">아이디 저장</label>
			</div>
			<!-- //joinList -->
			<input type="hidden" name="url" id="url" value="<%//=url%>"/>
			<input type="hidden" name="param" id="param" value="<%//=param%>"/>
			<input type="hidden" name="ip" id="ip" value="<%=request.getRemoteAddr()%>"/>
		</fieldset>
	</form>
	</div>
	<div class="footer">
		Copyrights (c) 2020 <a href="#" target="_blank">SAMPLE</a>. All Rights Reserved.  
	</div>
</div>
</body>
</html>