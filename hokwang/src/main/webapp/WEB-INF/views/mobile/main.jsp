<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
 <script src="https://maps.googleapis.com/maps/api/js?sensor=true"></script>
	
<style>
#card1{
width:180px;
  display:inline-table;
  margin-top: 5px;
  margin-bottom: 10px;
  margin-right: 5px;
}

#card2{
width:180px;
  display:inline-table;
  margin-top: 5px;
  margin-bottom: 10px;
  margin-left: 1px;

}
#today{

  width:53px;
  height:80px;
  display:inline;
}
#reserv{
  width:53px;
  height:80px;
  display:inline;
}
#resvname{
display:inline;
}
#issue{
width : 180px;
height:80px;
}

</style>

</head>
<body onload="initialize()">
<script>
//지도
function initialize() {
	   var myLatlng = new google.maps.LatLng(35.870704, 128.589424);
	   var mapOptions = {
	        zoom: 17,
	        center: myLatlng,
	        mapTypeId: google.maps.MapTypeId.ROADMAP
	   }
	   var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
	   var marker = new google.maps.Marker({
		    position: myLatlng,
		    map: map,
		    title: "호광병원"
		});
	  }; // 지도끝
	  
$(function(){
	getEmpInfo();
	empInfoListResult();	
	
})
	
	
	//의료진 소개
	function getEmpInfo() {
		$.ajax({
			url : 'ajax/getEmpInfo',
			type : 'GET',
			dataType : 'json',
			success : 
				empInfoListResult
			,
			error : function() {
				alert("fail")
			}

		});
	}
	  
	  function empInfoListResult(data){
		  console.log("aa" + data);
		  $('tbody').empty();
		  $.each(data,function(idx,item){
			  $('<tr>')
			  .append($('<td>').html(item.emp_name))
			  .append($('<td>').html(item.emp_room))
			  .appendTo('tbody');
		  })
	  }
</script>

	<div class="row mb-2 mb-xl-3">
		<div class="col-auto ml-auto text-right mt-n1">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb bg-transparent p-0 mt-1 mb-0">
				</ol>
				<input type="button" class="btn btn-primary btn-sm" value="모바일 아기 수첩" onclick="location.href='babyDiary'"/>
			</nav>
		</div>
	</div>

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
												src="${pageContext.request.contextPath}/resources/img/hohoLogo2.png"
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
						<div >
							<div class="mb-1">
								<input type="button" class="btn btn-primary active" value="당일" id="today">
								<h5 id ="resvname" class="card-title mb-4">예약/접수</h5>
								<input type="button" class="btn btn-danger active" value="예약" id="reserv">
							</div>
						</div>
					</div>
					<div id="card2" class="card">
						<div>
							<input type="button" class="btn btn-info active" value="증명서발급" id="issue">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 의료진 소개 -->
	<div class="row">
		<div class="col-12 col-lg-8 col-xxl-9 d-flex">
			<div class="card flex-fill">
				<div class="card-header">
					<h5 class="card-title mb-0">의료진 소개</h5>
				</div>
				<table id="empinfo" class="table table-hover my-0">
					<thead>
						<tr>
							<th>이름</th>
							<th>진료실</th>
						</tr>
					</thead>
					<tbody>
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
					<h5 class="card-title mb-0">병원 위치</h5>
				</div>
				<div class="card-body px-4">
					<div id="map_canvas" style="width: 330px; height: 350px;"></div>
				</div>
			</div>
		</div>
	</div>




</body>
</html>