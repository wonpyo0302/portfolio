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
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
    	function findHostEmail() {
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
    			url : 'findHostEmail.do',
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
        <form action="findHostEmail.do" method="post" id="loginFrm1" name="loginFrm1" onsubmit="return findHostEmail();"><!-- header에서 id="board"이미 사용중이라서 board2로 함 -->
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
                                <div class="login_btn"><input type="submit" href="javascript:;" onclick="findHostEmail();" value="이메일 찾기" alt="이메일 찾기" /></div>
                            </fieldset>
                            <div class="btnSet clear">
                                <div>
                                    <a href="join.do" class="btn">회원가입</a> 
                                    <a href="findHostPwd.do" class="btn">비밀번호 찾기</a>
                                </div>
                            </div>
                        </div>
                    </div>
       
                </div>
            </div>
        </form>
        
</body>
</html>