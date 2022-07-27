<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../main/top2.jsp"/>
<link rel="stylesheet" href="../css/map.css" type="text/css">
	<article id="map-content">
		<div class="container">
			<p id="contact">Contact</p>
			<p id="place">서울 서대문구 신촌로 141 은하빌딩</p>
			<div id="map" style="width: 904px; height: 400px;"></div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=98f0ad90bb67a160e584f6fc04e144a7"></script>
			<script type="text/javascript">
				var container = document.getElementById('map');
				var options = {
					center : new kakao.maps.LatLng(37.556831, 126.941553),
					level : 2
				};

				var map = new kakao.maps.Map(container, options);

				var markerPosition = new kakao.maps.LatLng(37.556831,
						126.941553);

				var marker = new kakao.maps.Marker({
					position : markerPosition
				});

				marker.setMap(map);
			</script>
		</div>
	</article>
<jsp:include page="../main/bottom.jsp"/>


