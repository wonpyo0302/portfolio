/**
 * 호스트 객실 상세 수정 페이지 입니다.
 */
 //수정 페이지에서 이미지 삭제 ajax
 function imgDel(image_no){
	console.log(image_no)
	$("#imgSpan"+image_no).hide();
	
	$.ajax({
		type: "GET",
		url: "../room/delImg.do",
		data:{image_no: image_no},
		error:function(er){
			
			$("#imgSpan"+image_no).show();
		},
		success: function(res){
			alert(res);
		}
	})//END-ajax
	
	
}