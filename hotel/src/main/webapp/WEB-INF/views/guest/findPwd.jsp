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
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
    	function findGuestPwd() {
    		if ($("#guest_id").val() == '') {
    			alert('아이디를 입력해 주세요');
    			$("#guest_id").focus();
    			return false;
    		}
    		if ($("#guest_hp").val() == '') {
    			alert('전화번호를 입력해 주세요');
    			$("#guest_hp").focus();
    			return false;
    		}
    		if ($("#guest_email").val() == '') {
    			alert('이메일을 입력해 주세요');
    			$("#guest_email").focus();
    			return false;
    		}
    		// ajax조회
    		$.ajax({
    			url : 'findGuestPwd.do',
    			method : 'post',
    			data : {
    				guest_id : $("#guest_id").val(),
    				guest_hp : $("#guest_hp").val(),
    				guest_email : $("#guest_email").val()
    			},
    			success : function(res) {
    				if (res.trim() == '') {
    					alert('해당 회원이 존재하지 않습니다.');
    				} else {
    					alert('임시비밀번호가 이메일로 발송되었습니다.');
    					$("#guest_id, #guest_hp, #guest_email").val('');
    				}
    			}
    		});
    		return false;
    	}
    </script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/includes/G_header.jsp"/>
        <form action="findGuestPwd.do" method="post" id="loginFrm1" name="loginFrm1" onsubmit="return findGuestPwd();"><!-- header에서 id="board"이미 사용중이라서 board2로 함 -->
            <div class="sub">
                <div class="size">
                    <h3 class="sub_title">GUEST 비밀번호 찾기</h3>
                    
                    <div class="member">
                        <div class="box">
                            <fieldset class="login_form">
                                <ul>
                                    <li><input type="text" id="guest_id" name="guest_id" placeholder="아이디"></li>
                                    <li><input type="text" id="guest_hp" name="guest_hp" placeholder="전화번호"></li>
                                    <li><input type="text" id="guest_email" name="guest_email" placeholder="이메일"></li>
                                </ul>
                                <div class="login_btn"><input type="submit" value="비밀번호 찾기" alt="비밀번호 찾기" /></div>
                            </fieldset>
                            <div class="btnSet clear">
                                <div>
                                    <a href="join.do" class="btn">회원가입</a> 
                                    <a href="findGuestEmail.do" class="btn">이메일 찾기</a>
                                    <a href="login.do" style="background-color:black; color:white;">로그인</a>
                                </div>
                            </div>
                        </div>
                    </div>
        
                </div>
            </div>
        </form>
        
</body>
</html>