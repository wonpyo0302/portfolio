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
   <link rel="stylesheet" href="hotel/css/reset.css"/>
    <link rel="stylesheet" href="hotel/css/contents.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
    	function findGuestEmail() {
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
    			url : 'findGuestEmail.do',
    			method : 'post',
    			data : {
    				guest_name : $("#guest_name").val(),
    				guest_hp : $("#guest_hp").val()
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
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <form action="findGuestEmail.do" method="post" id="loginFrm1" name="loginFrm1" onsubmit="return findGuestEmail();"><!-- header에서 id="board"이미 사용중이라서 board2로 함 -->
            <div class="sub">
                <div class="size">
                    <h3 class="sub_title">이메일 찾기</h3>
                    
                    <div class="member">
                        <div class="box">
                            <fieldset class="login_form">
                                <ul>
                                    <li><input type="text" id="guest_name" name="guest_name" placeholder="이름"></li>
                                    <li><input type="text" id="guest_hp" name="guest_hp" placeholder="전화번호"></li>
                                    <li id="msg"></li>
                                </ul>
                                <div class="login_btn"><input type="submit" href="javascript:;" onclick="findGuestEmail();" value="이메일 찾기" alt="이메일 찾기" /></div>
                            </fieldset>
                            <div class="btnSet clear">
                                <div>
                                    <a href="join.do" class="btn">회원가입</a> 
                                    <a href="findGuestPwd.do" class="btn">비밀번호 찾기</a>
                                </div>
                            </div>
                        </div>
                    </div>
       
                </div>
            </div>
        </form>
        
</body>
</html>