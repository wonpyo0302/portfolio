<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	function pwdChange() {
		if($("#xpwd").val() == ''){
			alert('이전 번호를 입력하세요');
			$("#xpwd").focus();
			return false;
		}
		if($("#newpwd").val() == ''){
			alert('새 번호를 입력하세요');
			$("#nepwd").focus();
			return false;
		}if($("#xpwd").val() != '${loginInfo2.host_pwd}'){
			alert('이전 번호를 바르게 입력하세요');
			$("#xpwd").focus();
			return false;
		}
		$.ajax({
			url : 'updatePwd.do',
			type : "post",
			data:{guest_pwd:$("#newpwd").val()},
			success:function(res) {
				if(res == 'true') {
				alert('비밀번호가 정상적으로 변경되었습니다');
				self.close();
				}else{
					alert('변경실패하였습니다');
				}
			}
		});
	};
	
</script>
</head>
<body>
<body onload="window.resizeTo(600,400)">
<h1>비밀번호 바꾸기</h1>
<br><br>
이전PW<input type="password" id="xpwd" />
<div class="new" rowspan="2">
	새&nbsp;&nbsp;&nbsp;PW<input type="password" id="newpwd" />
	<input type="button" href="javascript;;" onclick="pwdChange();" value="수정" />
</div>
<br>
<input type="button" value="닫기" onclick="self.close();" style="position:relative; left:50%;"/>
</body>
</html>