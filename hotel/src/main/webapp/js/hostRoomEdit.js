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
			
		}
	})//END_ajax
}//END_imgDel
   
   
   
	function readURL(input, rownum) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
			if (rownum) {
				document.getElementById('preview'+rownum).src = e.target.result;
			} else {
	      		document.getElementById('preview').src = e.target.result;
	      	}
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}//END_readURL
	
	
	function delRow(rownum) {
		$("#imgFrame"+rownum).remove();
	}
	$(function(){
			var rownum = 1;
		$("#addImg").click(function(){
		
		  str = ""
		  str +="<tr id='imgFrame"+rownum+"'>";
		  str +="<th> 첨부 파일  </th>"  
          str +="	<td>"
          str +="		<input type='file' name='filename' onchange='readURL(this, "+rownum+");' >"	
          str +="		<img id='preview"+rownum+"'/>"   
          str +="		<button id='delImg' type='button' onclick='delRow("+rownum+");'>[-]</button>"   
          str +="	</td>"  	
          str +="</tr>"	
			console.log(str)
			 $('#imgFrame').after(str);
                rownum++;
		})
	})//END_$(function)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	