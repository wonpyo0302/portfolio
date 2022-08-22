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
    <title>이메일 찾기</title>
   <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
    	function findGuestId() {
    		if ($("#guest_name").val() == '') {
    			alert('이름을 입력해 주세요');
    			$("#guest_name").focus();
    			return false;
    		}
    		if ($("#guest_hp").val() == '') {
    			alert('전화번호를 입력해 주세요');
    			$("#guest_hp").focus();
    			return false;
    		}
    		// ajax조회
    		$.ajax({
    			url : 'findGuestId.do',
    			method : 'post',
    			data : {
    				guest_name : $("#guest_name").val(),
    				guest_hp : $("#guest_hp").val()
    			},
    			success : function(res) {
    				if (res.trim() == '') {
    					$("#msg").html('입력하신 정보는 존재하지 않습니다.');
    				} else {
    					$("#msg").html('아이디는 "'+res.trim()+'" 입니다.');
    				}
    			}
    		});
    		return false;
    	}
    </script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/includes/G_header.jsp"/>
        <form action="findGuestEmail.do" method="post" id="loginFrm1" name="loginFrm1" onsubmit="return findGuestId();"><!-- header에서 id="board"이미 사용중이라서 board2로 함 -->
            <div class="sub">
                <div class="size">
                    <h3 class="sub_title">GUEST 아이디 찾기</h3>
                    
                    <div class="member">
                        <div class="box">
                            <fieldset class="login_form">
                                <ul>
                                    <li><input type="text" id="guest_name" name="guest_name" placeholder="이름"></li>
                                    <li><input type="text" id="guest_hp" name="guest_hp" placeholder="전화번호"></li>
                                    <li id="msg"></li>
                                </ul>
                                <div class="login_btn"><input type="submit" href="javascript:;" onclick="findGuestId();" value="아이디 찾기" alt="아이디 찾기" /></div>
                            </fieldset>
                            <div class="btnSet clear" style="display:inline-block; width:500px;">
                                <a href="join.do" class="btn" style="width:160px;">회원가입</a> 
                                <a href="findGuestPwd.do" class="btn" style="width:160px;">비밀번호 찾기</a> 
                                <a href="login.do" class="btn" style="width:160px;">로그인</a>                                  
                            </div>
                        </div>
                    </div>
       
                </div>
            </div>
        </form>
        
</body>
</html>