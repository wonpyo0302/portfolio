/**
 * 
 */
 $(function(){
	var roomScore =$("#roomScore").val();
	console.log(roomScore);
	console.log(parseInt(roomScore));
	
	if(parseInt(roomScore) > 45){
		$("#star_img img").attr("src", "/hotel/image/mypage/star_score_50.png");
	}else if(parseInt(roomScore) > 40){
		$("#star_img img").attr("src", "/hotel/image/mypage/star_score_45.png");
	}else if(parseInt(roomScore) > 35){
		$("#star_img img").attr("src", "/hotel/image/mypage/star_score_40.png");
	}else if(parseInt(roomScore) > 30){
		$("#star_img img").attr("src", "/hotel/image/mypage/star_score_35.png");
	}else if(parseInt(roomScore) > 25){
		$("#star_img img").attr("src", "/hotel/image/mypage/star_score_30.png");
	}else if(parseInt(roomScore) > 20){
		$("#star_img img").attr("src", "/hotel/image/mypage/star_score_25.png");
	}else if(parseInt(roomScore) > 15){
		$("#star_img img").attr("src", "/hotel/image/mypage/star_score_20.png");
	}else if(parseInt(roomScore) > 10){
		$("#star_img img").attr("src", "/hotel/image/mypage/star_score_15.png");
	}else{
		$("#star_img img").attr("src", "/hotel/image/mypage/star_score_10.png");
	}
	
})
 