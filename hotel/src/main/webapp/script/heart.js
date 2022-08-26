/**
 * 
 */
 	$(function() {
		
		
		$(".like").on("click", function(){
			var id = $(this).data("name");
			var gno = $(this).data("gno");
			var hno = $(this).data("hno");
			
			
			like(id, gno, hno, $(this));
			
		
		})//click event-end
	})//$(function(){})-end
	
	
	function like(id_name, guest_no, hotel_no, obj){
	
		if(!guest_no){
			alert("로그인 후 이용이 가능합니다.")
			return false;
		}
		
		$.ajax({
			type: "GET",
			url: "../fav/"+id_name,
			data: {guest_no:guest_no,
				   hotel_no:hotel_no},
			error:function(er){
				alert("로그인 후 이용이 가능합니다.");
			},
			success: function(res){
				if(id_name == 'del'){
					obj.attr("src","/hotel/image/mypage/emptyHeart.png");
					obj.data("name",'fav');
				}else{
					obj.attr("src","/hotel/image/mypage/heart.png");
					obj.data("name",'del');
				}
			}
			
			
			
		});//ajax-end
	}