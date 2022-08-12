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
    <style>
    	.sub_a{text-align: center; font-size:22px;}
    </style>
<body>
<jsp:include page="/WEB-INF/views/includes/G_header.jsp" />
    	<form id="frm" name="frm" method="post" action="myinfoModify.do">
            <div class="sub">
            	<div class="size">
                    <h1 class="sub_title">내정보 관리</h1>
                        <p class="sub_a">GUEST</p>
                       <table class="board_write">
                    	<caption>회원가입</caption>
                        <tbody>
                        	<tr>
                        		<th>아이디</th>
                        		<td>${loginInfo.guest_id}</td>
                        		<td></td>
                        	</tr>
                       
                        	<tr>
                        		<th>이름</th>
                        		<td>${loginInfo.guest_name}</td>
                        		<td></td>
                        	</tr>
                        	<tr>
                        		<th>이메일</th>
                        		<td>${loginInfo.guest_email}</td>
                        		<td><input type="button" href="javascript:;" onclick="emainlChange();" value="이메일바꾸기" /></td>
                        	</tr>
                        
                        	<tr>
                        		<th>휴대폰번호</th>
                        		<td>${loginInfo.guest_hp}</td>
                        		<td><input type="button" href="javascript:;" onclick="hpChange();" value="휴대폰번호바꾸기" /></td>
                        	</tr>
                        	<tr>
                        		<th>계좌번호</th>
                      			<td>${loginInfo.g_bank }&nbsp;&nbsp;&nbsp;${loginInfo.g_accountno }</td>
                      			<td><input type="button" href="javascript:;" onclick="g_acnoChange();" value="계좌번호바꾸기" /></td>
                        	</tr>
                        </tbody>
                        </table>
                        <br><br><br>
                        <table class="board_write">
                        <tbody>
                        	<tr>
                        		<th>비밀번호</th>
                        			<td><input type="password" id="guest_pwd" name="guest_pwd" />기존 비밀번호</td><br>
      								<td><input type="password" id="guest_pwd" name="guest_pwd" />새로운 비밀번호</td>
      							
                        		<td><input type="button" href="javascript:;" onclick="pwdChange();" value="비밀번호바꾸기" /></td>
                        	</tr>
                        </tbody>
                        </table>
                        <br><br>
                        <table class="board_write">
                        <tbody>
                        	<tr>
                        		<th>생일</th>
                        		<td>${loginInfo.guest_birth}</td>
                        		
                        	</tr>
                        
                        	<tr>
                        		<th>주소</th>
                        		<td>${loginInfo.guest_addr1}&nbsp;&nbsp;&nbsp;&nbsp;${loginInfo.guest_addr2 }</td>
                        	</tr>
                    	</tbody>
                      </table>
              		</div>
              </div>
       </form>
</body>
</html>