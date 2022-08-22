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
    	function findHostId() {
    		if ($("#host_name").val() == '') {
    			alert('이름을 입력해 주세요');
    			$("#host_name").focus();
    			return false;
    		}
    		if ($("#host_hp").val() == '') {
    			alert('전화번호를 입력해 주세요');
    			$("#host_hp").focus();
    			return false;
    		}
    		// ajax조회
    		$.ajax({
    			url : 'findHostId.do',
    			method : 'post',
    			data : {
    				host_name : $("#host_name").val(),
    				host_hp : $("#host_hp").val()
    			},
    			success : function(res) {
    				if (res.trim() == '') {
    					$("#msg").html('입력하신 정보는 존재하지 않습니다.');
    				} else {
    					$("#msg").html('이메일은 "'+res.trim()+'" 입니다.');
    				}
    			}
    		});
    		return false;
    	}
    </script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/includes/H_header.jsp"/>
        <form action="findHostId.do" method="post" id="loginFrm1" name="loginFrm1" onsubmit="return findHostId();"><!-- header에서 id="board"이미 사용중이라서 board2로 함 -->
            <div class="sub">
                <div class="size">
                    <h3 class="sub_title">이메일 찾기</h3>
                    
                    <div class="member">
                        <div class="box">
                            <fieldset class="login_form">
                                <ul>
                                    <li><input type="text" id="host_name" name="host_name" placeholder="이름"></li>
                                    <li><input type="text" id="host_hp" name="host_hp" placeholder="전화번호"></li>
                                    <li id="msg"></li>
                                </ul>
                                <div class="login_btn"><input type="submit" href="javascript:;" onclick="findHostId();" value="아이디 찾기" alt="아이디 찾기" /></div>
                            </fieldset>
                            <div class="btnSet clear" style="display:inline-block; width:500px;">
                                <div>
                                    <a href="join.do" class="btn" style="width:160px;">회원가입</a> 
                                    <a href="findHostPwd.do" class="btn" style="width:160px;">비밀번호 찾기</a>
                                    <a href="login.do" class="btn" style="width:160px;">로그인</a>
                                </div>
                            </div>
                        </div>
                    </div>
       
                </div>
            </div>
        </form>
        
</body>
</html>