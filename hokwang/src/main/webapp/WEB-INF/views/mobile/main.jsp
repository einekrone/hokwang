<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOHO</title>
<meta name="description"
	content="Responsive Admin &amp; 홈 Template based on Bootstrap 5">
<meta name="author" content="호광 병원">
<meta name="keywords"
	content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/icons/icon-48x48.png" />

<title>호광 병원 Demo - Bootstrap 5 Admin Template</title>

<link href="${pageContext.request.contextPath}/resources/css/mobile.css"
	rel="stylesheet">

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCH21zH92cL76dalhNG4zwZXPIXsVwT738"></script>
<style>
#card1 {
	width: 180px;
	display: inline-table;
	margin-top: 5px;
	margin-bottom: 10px;
	margin-right: 5px;
}

#card2 {
	width: 180px;
	display: inline-table;
	margin-top: 5px;
	margin-bottom: 10px;
	margin-left: 1px;
}

#resvname {
	display: inline;
}

#issue {
	width: 180px;
	height: 80px;
}

.resvBtn {
	color: white;
	padding: 30px 15px;
	height: 80px;
}
.docBtn {
	color: white;
	padding: 30px 15px;
	height : 80px;
	width: 100%;
}
</style>

</head>
<body onload="initialize()">
	<script>
		//지도
		function initialize() {
			var myLatlng = new google.maps.LatLng(35.870704, 128.589424);
			var mapOptions = {
				zoom : 17,
				center : myLatlng,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			}
			var map = new google.maps.Map(
					document.getElementById('map_canvas'), mapOptions);
			var marker = new google.maps.Marker({
				position : myLatlng,
				map : map,
				title : "호광병원"
			});
		}; // 지도끝

		$(function() {
			getEmpInfo();
			empInfoListResult();

		})

		//의료진 소개
		function getEmpInfo() {
			$.ajax({
				url : 'ajax/getEmpInfo',
				type : 'GET',
				dataType : 'json',
				success : empInfoListResult,
				error : function() {
					alert("fail")
				}

			});
		}

		function empInfoListResult(data) {
			console.log("aa" + data);
			$('#dcList').empty();
			$.each(data, function(idx, item) {
				$('<tr>')
				.append($('<td>').attr("style","text-align:center;").html(item.emp_name))
				.append($('<td>').attr("style","text-align:center;").html(item.emp_room+" 진료실")).appendTo('#dcList');
			})
		}
	</script>
<body>

	<c:if test="${parent_vo != null }">
		<div class="row mb-2 mb-xl-3">
			<div class="col-auto ml-auto text-right mt-n1">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb bg-transparent p-0 mt-1 mb-0">
					</ol>
					<input type="button" class="btn btn-m"
						style="background-color: #b6e3e9; color: gray;" value="모바일 아기 수첩"
						onclick="location.href='babyDiary'" />
				</nav>
			</div>
		</div>
	</c:if>

	<div class="row">
		<div class="col-xl-6 col-xxl-5 d-flex">
			<div class="w-100">
				<div class="row">
					<!-- 배너 -->
					<div class="col-sm-12">
						<div class="card">
							<div>
								<div id="demo" class="carousel slide" data-ride="carousel">
									<div class="carousel-inner">
										<div class="carousel-item active">
											<img class="d-block w-100" style="height: 150px;"
												src="${pageContext.request.contextPath}/resources/img/hohoLogo.png"
												alt="First slide">
											<div class="carousel-caption d-none d-md-block"></div>
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" style="height: 150px;"
												src="${pageContext.request.contextPath}/resources/img/corona2.jpg"
												alt="Second slide">
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" style="height: 150px;"
												src="${pageContext.request.contextPath}/resources/img/corona.png"
												alt="Third slide">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 예약,증명서 -->
					<div id="card1" class="card">
						<!-- 						<input type="button" class="btn btnt resvBtn resvT" value="당일예약" style="background-color: #fdafab; width:49%; margin-right: 1%;" onclick="location.href='resv?type=T'" > -->
						<!-- 						<input type="button" class="btn btnv resvBtn resvR" value="우선예약" style="background-color: #fad4ae; width:50%;" onclick="location.href='resv?type=R'" > -->
						<a href="resv?type=T" class="btn resvBtn resvT" style="background-color: #fdafab; width:49%; margin-right: 1%;">당일예약</a>
						<a href="resv?type=R" class="btn resvBtn resvR" style="background-color: #fad4ae; width:50%;">우선예약</a>
					</div>
					<div id="card2" class="card">
						<a href="doc" class="btn docBtn docPage" style="background-color: #b6e3e9; width:100%;">증명서 발급</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12 col-lg-8 col-xxl-9 d-flex">
			<div class="card flex-fill">
				<div class="card-header">

					<h5 class="card-title mb-0" style="text-align: center; border-bottom:1px solid; font-size: 20px; font-weight: bold;">코로나 현황</h5>
				</div>
				<div style="height: 200px; overflow: auto;">
					<table class="table" style="text-align: center;">
						<tr>
							<th>시도명</th>
							<th>확진자수</th>
							<th>사망자</th>
							<th>발생률</th>
						</tr>
						<c:forEach var="stat" items="${corona}">
							<tr>
								<td>${stat.title}</td>
								<td>${stat.total}(${stat.beTotal})</td>
								<td>${stat.death}</td>
								<td>${stat.inci}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 의료진 소개 -->
	<div class="row">
		<div class="col-12 col-lg-8 col-xxl-9 d-flex">
			<div class="card flex-fill">
				<div class="card-header">
					<h5 class="card-title mb-0" style="text-align: center; font-size: 20px; border-bottom:1px solid; font-weight: bold;">의료진 소개</h5>
				</div>
				<table id="empinfo" class="table table-hover my-0">
					<thead>
						<tr>
							<th style="text-align: center;">이름</th>
							<th style="text-align: center;">진료실</th>
						</tr>
					</thead>
					<tbody id="dcList">
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- 병원 위치, 오시는길/영업일시 -->
	<div class="row">
		<div class="col-12 col-lg-8 col-xxl-9 d-flex">
			<div class="card flex-fill">
				<div class="card-header">
					<h5 class="card-title mb-0" style="text-align: center; font-size: 20px; border-bottom:1px solid; font-weight: bold;">병원 위치</h5>
				</div>
				<div class="card-body px-4">
					<div id="map_canvas" style="width: 330px; height: 350px;"></div>
				</div>
			</div>
		</div>
	</div>




</body>
</html>