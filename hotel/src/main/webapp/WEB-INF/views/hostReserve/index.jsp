<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/includes/H_header.jsp" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>예약내역</title>
    <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script type="text/javascript">
		function rejectRev(reserv_no){
			if(confirm("예약을 반려하시겠습니까?")){
				$.ajax({
					type:'post',
					data: {reserv_no : reserv_no},
					url:"../hostReserve/rejectRev",
					error: function(er){
						alert("error")
					},
					success:function(response, http){
						$(".rejectBtn"+reserv_no).hide();
						$("#rejected"+reserv_no).show();
						alert("예약번호 "+reserv_no+"가 취소 처리되었습니다");
						console.log(response);
					}
				});
			}
			
		}
	</script>
	
	<script type="text/javascript">
		
		$(function(){
			$(".check").on("click", function(){
				var id = $(this).attr("id")
				id.split("?");
				console.log(id.split("?")[1]);
				var type = id.split("?")[0];
				console.log(type);
				var reserv_no = id.split("?")[1];
				if(type =="checkin"){
					$.ajax({
						type:'post',
						data:{reserv_no : reserv_no},
						url:"../hostReserve/"+id.split("?")[0],
						error:function(er){
							alert("ERROR")
						},
						success:function(response){
							alert("예약번호 "+reserv_no+"번 입실처리 완료");
							window.location.reload();
						}
						
					})
				}
				else{
					$.ajax({
						type:'post',
						data:{reserv_no : reserv_no},
						url:"../hostReserve/"+id.split("?")[0],
						error:function(er){
							alert("ERROR")
						},
						success:function(response){
							alert("예약번호 "+reserv_no+"번 퇴실처리 완료");
							window.location.reload();
						}
						
					})
				}
			})
		
		$(".paycheck").on("click",function(){
			$.ajax({
				type:'post',
				url:"/hotel/reserve/paycheck.do",
				data:{imp_uid : $(this).attr("id")},
				error:function(er){
					alert("ERROR")
				},
				success:function(response){
					alert("입금확인 완료");
					window.location.reload();
				}
				
			})
		})
	})
	</script>

</head>

<style>
	#rejectRev{
		color :red;
		cursor:pointer;
	}
	
	.paycheck{
		color :blue;
		cursor:pointer;
	}
	
	.check{
		color :#54994D;
		cursor:pointer;
	}
</style>


<body>  
    <!-- room 정보  -->
            <div class="sub">
            <div class="size">
    
                <div class="bbs">
	                <h3 class="sub_title">마이 호텔 예약내역</h3>
                    <table class="list">
                    <p><span><strong>총 ${data.totalCount}개</strong>  |  ${roomVO.page}/${data.totalPage}페이지</span></p>
                        <caption>my rooms</caption>
                        <colgroup>
                            <col width="*" />
                            <col width="*" />
                            <col width="*" />
                            <col width="*" />
                            <col width="*" />
                            <col width="*" />
                            <col width="*" />
                            <col width="*" />
                            <col width="*" />
                            <col width="*" />
                            <col width="*" />
                        </colgroup>
                        <thead style="text-align:center;">
                            <tr>
                                <th>번호</th>
                                <th>예약번호</th>
                                <th>예약일자</th>
                                <th>예약자</th>
                                <th>객실</th>
                                <th>결제금액</th>
                                <th>예약상태</th>
                                <th>결제상태</th>
                                <th>이용상태</th>
                                <th>체크인</th>
                                <th>체크아웃</th>
                            </tr>
                        </thead>
                        <tbody>
							
							<c:if test="${empty data.list}">
	                            <tr>
	                                <td class="first" colspan="5">등록된 글이 없습니다.</td>
	                            </tr>
							</c:if>
							
								
							<c:forEach items="${data.list}" var="row" varStatus="loop">
		                            <tr><!-- 글번호 총갯수 - 인덱스 -(현재페이지 번호 - 1)*페이지당 갯수///다시보자-->
		                                <td>
		                                	${data.totalCount - loop.index -(roomVO.page-1)*roomVO.pageRow}
		                                </td>
		                                
		                                <td>
		                                	${row.reserv_no }
		                                </td>
		                                
		                                <td class="txt_l">
		                                	<fmt:formatDate value="" pattern=""/>
		                                	<fmt:parseDate value=""  pattern="yy-MM-dd"/>
		                                  ${row.startdate} ~ ${row.enddate }
		                                </td>
		                                
		                                <td class="txt_l">
		                                  ${row.rev_name }
		                                </td>
		                                
		                                <td>
		                                	${row.number}
		                                </td>
		                                
		                                
		                                <td class="writer">
		                                    ${row.total_price} 
		                                </td>
		                                 
		                                <td >
		                                	<c:if test="${row.rev_status ==0 }">예약완료</c:if>
		                                	<c:if test="${row.rev_status ==1 }">예약취소</c:if>
		                                </td>
		                               
		                                <td >
		                                	<c:if test="${row.pay_status ==0 }">
		                                		입금대기 <br> <a class="paycheck" id ="${row.imp_uid}">[입금완료]</a>
		                                	</c:if>
		                                	<c:if test="${row.pay_status == 1 }">결제완료</c:if>
		                                	<c:if test="${row.pay_status == 2 }">결제취소</c:if>
		                                </td>
		                                
		                                <td>
		                                	<p id="rejected${row.reserv_no}" style="display:none;">"예약반려(규정위반)"</p>
		                                	<c:if test="${row.rev_status !=1}">
				                                 <div class="rejectBtn${row.reserv_no}">
				                                 	<c:if test="${row.use_status == 0 }">이용전 <br> 
				                                 		<a id="rejectRev" href="javascript:rejectRev(${row.reserv_no});">[예약 반려하기]</a>
				                                 	</c:if>
				                                 </div>
			                                 </c:if>
			                                 <c:if test="${row.use_status == 1}">이용완료</c:if>
			                                 <c:if test="${row.use_status == 2 }">'예약반려(규정위반)'</c:if>
		                                </td>
		                                
		                                <td>
		                                	<div id="in${row.reserv_no }" >
			                                	<%-- <c:if test="${row.rev_status ==1 && row.pay_status !=1} "> --%>
				                                	<c:if test="${row.rev_status ==0 && row.use_status==0 && row.pay_status==1 && row.check_in_out_status == 0 }">
				                                		<a class="check" id="checkin?${row.reserv_no }">[입실처리]</a>
				                                	</c:if>
				                                	<c:if test="${row.check_in_out_status == 1 || row.check_in_out_status ==2  }">
				                                		${row.checkin_date}
				                                	</c:if>
				                                <%-- </c:if> --%>
		                                	</div> 
		                                </td>
		                                <td>
		                                	<div >
		                                		<c:if test="${row.check_in_out_status == 1 }">
		                                			<a class="check" id="checkout?${row.reserv_no}">[퇴실처리]</a>
		                                		</c:if>
		                                		<c:if test="${row.check_in_out_status == 2 || row.check_in_out_status == 1 }">
			                                		${row.checkout_date}
			                                	</c:if>
		                                	</div> 
		                                </td>
		                            </tr>
		                          
							</c:forEach>
					
							
						
                        </tbody>
                    </table>
                   
                    
                    <!-- 페이지 처리 -->
                     <div class="pagenate clear">
		               <ul class='paging'>
			               <c:if test="${data.prev ==true }">
			               		<li><a href ="index.do?page=${data.startPage-1}&stype=${param.stype}&sword=${param.sword}"><</a>
			               </c:if>
			               
			               	<c:forEach var="page" begin="${data.startPage}" end="${data.endPage}">
			               		<li><a href ='index.do?page=${page}&stype=${param.stype}&sword=${param.sword}' <c:if test="${roomVO.page == page}">class='current'</c:if>>${page}</a></li></a>
			               	</c:forEach>
			               	
			               	<c:if test="${data.next ==true }">
			               		<li><a href = "index.do?page=${data.endPage+1}&stype=${param.stype}&sword=${param.sword}">></a></li>
			               	</c:if>
		               </ul>
		            </div>
                
                    <!-- 페이지처리 -->
                    
                 
                </div>
            </div>
        </div>
        
</body>
</html>