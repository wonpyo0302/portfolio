<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/views/admin/include/headHtml.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
input {
	width:200px;
}
</style>
</head>

<body> 
<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>호스트 정보</h2>
				</div>
				<div id="tableArea">
					<table>
						<tbody>
                        	<tr>
                        		<th>아이디</th>
                        		<td>${host.host_id}</td>
                        		<td></td>
                        	</tr>
                       
                        	<tr>
                        		<th>이름</th>
                        		<td>${host.host_name}</td>
                        		<td></td>
                        	</tr>
                        	<tr>
								<th>이메일</th>
								<td><input type="text" name="host_email" id="host_email" value="${host.host_email}" /></td>
							</tr>
                        
                        	<tr>
								<th>휴대폰번호</th>
								<td><input type="text" name="host_hp" id="host_hp" value="${host.host_hp}" /></td>
							</tr>
                        	<tr>
								<th>계좌번호</th>
								<td><input type="text" name="host_bank" id="host_bank" value="${host.host_bank }" />
								&nbsp;&nbsp;&nbsp;<input type="text" name="host_accountno" id="host_accountno" value="${host.host_accountno }" /></td>
							</tr>
                        	<tr>
								<th>가입일</th>
								<td><input type="text" name="host_joindate" id="host_joindate" value="${host.host_joindate }" /></td>
							</tr>
                        </tbody>
					</table>
				</div>
				<!--//tableArea -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->	
</body>
</html>