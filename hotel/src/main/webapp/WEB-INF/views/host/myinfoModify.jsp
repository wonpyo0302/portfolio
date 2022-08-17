<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <script language="javascript">
		function pwdChangePopup() {
			window.open("pwdChangePopup.do","hp","width=600px, height=400px");
		}
	</script>
	<script>
		function updateSave() {
			frm.submit();
			alert('수정에 성공하였습니다');
		};
	</script>
    <style>
    	.sub_a{text-align: center; font-size:22px;}
    </style>
<body>
<jsp:include page="/WEB-INF/views/includes/H_header.jsp" />
    	<form method="post" name="frm" id="frm" action="update.do" >
		<input type="hidden" name="host_no" value="${loginInfo2.host_no }" />
            <div class="sub">
            	<div class="size">
                    <h1 class="sub_title">내정보수정</h1>
                        <p class="sub_a">HOST</p>
                       <table class="board_write">
                    	<caption>회원수정</caption>
                        <tbody>
                        	<tr>
                        		<th>아이디</th>
                        		<td>${loginInfo2.host_id}</td>
                        		<td></td>
                        	</tr>
                       
                        	<tr>
                        		<th>이름</th>
                        		<td>${loginInfo2.host_name}</td>
                        		<td></td>
                        	</tr>
                        	<tr>
								<th>이메일</th>
								<td><input type="text" name="host_email" id="host_email" value="${loginInfo2.host_email}" /></td>
							</tr>
                        
                        	<tr>
								<th>휴대폰번호</th>
								<td><input type="text" name="host_hp" id="host_hp" value="${loginInfo2.host_hp}" /></td>
							</tr>
                        	<tr>
								<th>계좌번호</th>
								<td><input type="text" name="host_bank" id="host_bank" value="${loginInfo2.host_bank }" />
								&nbsp;&nbsp;&nbsp;<input type="text" name="host_accountno" id="host_accountno" value="${loginInfo2.host_accountno }" /></td>
							</tr>
                        </tbody>
                        </table>
                        <br><br><br>
                        <table class="board_write">
							<tbody>
								<tr>
									<th>비밀번호</th>
									<td><input type="button" href="javascript:;" onclick="pwdChangePopup();" value="비밀번호바꾸기" /></td>
								</tr>
							</tbody>
						</table>
                        <div class="btnSet" style="positon:relative; reft:50%;">
							<input type="submit" class="bgGrayBtn" href="jacascript:;" onclick="updateSave();" />
						</div>
              		</div>
              </div>
       </form>
</body>
</html>