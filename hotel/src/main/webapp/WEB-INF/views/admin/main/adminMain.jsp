<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/views/admin/include/headHtml.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	#container {
		text-align: center;
	}
	
</style>
<script>
window.onload = function () {
/* 	$.ajax({
		url : "sales.statistics",
		type : "POST",
		success : 
	})
	
	 */
var chart = new CanvasJS.Chart("chartContainer_sales", {
	animationEnabled: true,
	theme: "light2", // "light1", "light2", "dark1", "dark2"
	title:{
		text: "Sales Of Month"
	},
	axisY: {
		title: "Sales : ￦"
	},
	data: [{        
		type: "column",  
		showInLegend: true, 
		legendMarkerColor: "grey",
		legendText: "Month",
		dataPoints: [
			<c:forEach var="sales" items="${sales}" varStatus="idx">
			 { y: ${sales.totalPrice}, label:"${sales.date}"}<c:if test="${!idx.last}">,</c:if>
			</c:forEach>
		]
	}]
});
chart.render();
var chart = new CanvasJS.Chart("chartContainer_guest", {
	animationEnabled: true,
	theme: "light2",
	title:{
		text: "Join guest Of Month"
	},
	axisY: {
		title: "GuestCount"
	},
	data: [{        
		type: "column",  
		showInLegend: true, 
		legendMarkerColor: "grey",
		legendText: "Month",
		dataPoints: [      
			<c:forEach var="guest" items="${guestInfo}" varStatus="idx">
			 { y: ${guest.guestCount}, label:"${guest.gdate}"}<c:if test="${!idx.last}">,</c:if>
			</c:forEach>
		]
	}]
});
chart.render();
var chart = new CanvasJS.Chart("chartContainer_host", {
	animationEnabled: true,
	theme: "light2",
	title:{
		text: "Join host Of Month"
	},
	axisY: {
		title: "HostCount"
	},
	data: [{        
		type: "column",  
		showInLegend: true, 
		legendMarkerColor: "grey",
		legendText: "Month",
		dataPoints: [
			<c:forEach var="host" items="${hostInfo}" varStatus="idx">
			 { y: ${host.hostCount}, label:"${host.hdate}"}<c:if test="${!idx.last}">,</c:if>
			</c:forEach>
		]
	}]
});
chart.render();
var chart = new CanvasJS.Chart("chartContainer_abc", {
	animationEnabled: true,
	theme: "light2",
	title:{
		text: "Sales Of Month"
	},
	axisY: {
		title: "Sales"
	},
	data: [{        
		type: "column",  
		showInLegend: true, 
		legendMarkerColor: "grey",
		legendText: "Month",
		dataPoints: [      
			{ y: 0, label: "Jan" },
			{ y: 266455,  label: "Feb" },
			{ y: 169709,  label: "Mar" },
			{ y: 158400,  label: "Apr" },
			{ y: 142503,  label: "May" },
			{ y: 101500, label: "Jun" },
			{ y: 97800,  label: "Jul" },
			{ y: 80000,  label: "Aug" },
			{ y: 80000,  label: "Sep" },
			{ y: 80000,  label: "Oct" },
			{ y: 80000,  label: "Nov" },
			{ y: 80000,  label: "Dec" }
		]
	}]
});
chart.render();

}
</script>
</head>
<script>

</script>
<style>
	#tableArea {
		margin: 0;
	}
	#tableArea table {
		width: 500px;
		border: 2px solid #d3d3d3;
	}
	#tableArea th {
		border-bottom: 1px solid #d3d3d3;
	}
	#tableArea #graph {
		height: 400px;
	}
	#tableArea #table{
		margin-left: 200px;
	}
</style>
<body> 

<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>관리자 대시보드</h2>
				</div>
				<div id="tableArea">
					<div id="memberArea">
						<div id="guestArea" style="display: inline-block;">
							<table id="table guest" style="margin: 100px 10px 50px 100px;">
								<th>게스트 회원 Info</th>
									<tr id="graph">
										<td><div id="chartContainer_guest" style="height: 300px;"></div></td>
									</tr>
							</table>
						</div>
						<div id="hostArea" style="display: inline-block;">
							<table id="table host" style="margin: 100px 10px 50px 100px;">
								<th>호스트 회원 Info</th>
									<tr id="graph">
										<td><div id="chartContainer_host" style="height: 300px;"></div></td>
									</tr>
							</table>
						</div>
					</div>
					<div id="manageArea">
						<div id="salesArea" style="display: inline-block;">
							<table id="table sales" style="margin: 100px 10px 50px 100px;">
								<th>매출 현황</th>
									<tr id="graph">
										<td><div id="chartContainer_sales" style="height: 300px;"></div></td>
									</tr>
							</table>
						</div>
						<div id="abcArea" style="display: inline-block;">
							<table id="table abc" style="margin: 100px 10px 50px 100px;">
								<th>뭘넣을까?</th>
									<tr id="graph">
										<td><div id="chartContainer_abc" style="height: 300px;"></div></td>
									</tr>
							</table>
						</div>
					</div>
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