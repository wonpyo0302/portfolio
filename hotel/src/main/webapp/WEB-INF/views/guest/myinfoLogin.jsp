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
    <title>내정보로그인</title>
    <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
		function confirm() {
			if($("#guest_pwd").val().trim() == ''){
				alert('비밀번호를 입력해주세요');
				$("#guest_pwd").focus();
				return;
			} else{
				$.ajax({
					type: "post",
					url : "myinfoLogin.do",
					data : {guest_pwd:$("#guest_pwd").val()},
					success:function(res){
						if(res=='true') {
							alert('환영합니다');
							$("#frm").submit();
						}else {
							alert('다시입력하세요');
							$("#guest_pwd").val('');
							$("#guest_pwd").focus();
						}
						
					}
				});
			}
		};
	
	</script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/includes/G_header.jsp" />
    	<form id="frm" name="frm" method="post" action="myinfoModify.do">
            <div class="sub">
            	<div class="size">
                    <h1 class="sub_title">내정보 관리</h1>
                        <p class="sub_a">GUEST</p>
                        <table class="bordersize">
                        	<tr>
                        		<th>아이디</th>
                        		<td>${loginInfo.guest_id}</td>
                        		<td></td>
                        	</tr>
                        	<tr>
                        		<th>비밀번호</th>
                        		<td><input type="password" id="guest_pwd" name="guest_pwd" /></td>
                        		<td><input type="button" href="javascript:;" onclick="confirm();" value="비밀번호확인" /></td>
                        	</tr>
                        </table>
              		</div>
              </div>
       </form>
</body>
</html>