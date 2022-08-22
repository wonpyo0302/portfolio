<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5d133f411d7216df47f409d9f8b79bd"></script>
<body>

<div>${hotel.addr }</div>
<div id="map" style="width:500px;height:300px;display: inline-block;vertical-align: middle"></div>
<script>
		console.log(${hotel.lat})
		var container = document.getElementById('map');
		var options = {
						center: new kakao.maps.LatLng(${hotel.lat}, ${hotel.lot}),
						level: 3
					  };
		var map = new kakao.maps.Map(container, options);
		var markerPosition  = new kakao.maps.LatLng(${hotel.lat}, ${hotel.lot}); 
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
							    position: markerPosition
							});
							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);
	</script>	
</body>
</html>