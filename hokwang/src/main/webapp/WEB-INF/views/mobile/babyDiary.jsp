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

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./resources/json.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
<%-- <script
	src="${pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script> --%>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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

#today {
	width: 53px;
	height: 80px;
	display: inline;
}

#reserv {
	width: 53px;
	height: 80px;
	display: inline;
}

#resvname {
	display: inline;
}

#issue {
	width: 180px;
	height: 80px; body { margin-top : 100px;
	font-family: 'Trebuchet MS', serif;
	line-height: 1.6
}
}
</style>
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>

<script type="text/javascript">
var checkuplist=[];

function checkuphist() {
	var checkuplist=[];
	$.ajax({
		url : "ajax/",
		type : "GET",
		dataType : "JSON",
		data : {
			
		},
		error : function(xhr, status, msg) {
			alert("상태값 :" + status + " Http에러메시지 :" + msg);
		},
		success : checkuphistResult

	});/* end of ajax */

}/* end of function */	

function checkuphistResult(data) {
	console.log("patientListResult전체환자 리스트 출력 콘솔");

	$("#patientList").empty();
	$.each(data, function(idx, item) {

		$("<tr>").append(
				$("<td id='baby_no' value= '"+item.baby_no+"'>").html(
						item.baby_no)).append(
				$("<td>").html(item.baby_name)).append(
				$("<td id='regno "+idx+"'>").html(item.baby_regno1))
				.append($("<td>").html(item.baby_regno2)).append(
						$('<td style="display:none;">').html(item.baby_no))
				.appendTo('#patientList');
		//console.log("예약번호 : "+td.eq(5).text());
	})/* end of ajax  */
}
</script>
</head>
<body>
	<!-- 1 -->
	<div class="row">
		<div class="col-5 col-lg-8 col-xxl-9 d-flex">
			<div class="card flex-fill">
				<div class="form-group">
					<select class="form-control" name="baby_name">
						<option value="" selected>==자녀선택==</option>
					</select>
				</div>
				<div>여기사진들어갈곳</div>
				<input type="button" class="card-title mb-0" value="예약하기">
			</div>
		</div>
		<div class="col-7 col-lg-8 col-xxl-9 d-flex">
			<div class="card flex-fill">
				<div>
					<h5 class="card-title mb-0">이름</h5>
					<br> <br>
					<h5 class="card-title mb-0">생년월일</h5>
					<br> <br>
					<h5 class="card-title mb-0">나이</h5>
					<br> <br>
					<h5 class="card-title mb-0">혈액형</h5>
				</div>
			</div>
		</div>
	</div>

	<!-- 2 -->
	<div class="row">
		<div class="col-15 col-lg-8 col-xxl-7 d-flex">
			<div class="card flex-fill" style="height: 400px;">
				<!-- Tab을 구성할 영역 설정-->
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-pills card-header-pills pull-right"
							style="float: left" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tab-4">예약/진료</a></li>

							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tab-5">접종</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tab-6">성장</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tab-7">체온</a></li>
						</ul>
					</div>
					<div class="card-body">
						<div class="tab-content" style="height: 310px">
							<div class="tab-pane fade active show" id="tab-4" role="tabpanel">
								<div>
									<div style="height: 190px">
										<div class="card">
											<ul class="nav nav-pills card-header-pills pull-right">
												<li class="nav-item"><a class="nav-link active"
													data-toggle="tab" href="#tab-8">전체</a></li>
												<li class="nav-item"><a class="nav-link"
													data-toggle="tab" href="#tab-9">결제완료</a></li>
												<li class="nav-item"><a class="nav-link"
													data-toggle="tab" href="#tab-10">미결제</a></li>
												<li class="nav-item"><a class="nav-link"
													data-toggle="tab" href="#tab-11">예약</a></li>
											</ul>
										</div>
										<table class="table text-center">
											<thead>
												<tr>
													<th class="text-center">예약일시</th>
													<th class="text-center">병명</th>
													<th class="text-center">문진표</th>
												</tr>
											</thead>
											<tbody id="patientList"></tbody>
										</table>
									</div>
									<div style="height: 150px">
										<table class="table text-center">
											<thead>
												<tr>
													<th class="text-center">예약일시</th>
													<th class="text-center">병명</th>
													<th class="text-center">문진표</th>
												</tr>
											</thead>
											<tbody id="patientList"></tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="tab-pane fade text-center" id="tab-5" role="tabpanel">
								<div class="row">
									<div class="card" style="text-align: center;height:200	px">
										<ul class="nav nav-pills card-header-pills pull-right">
											<li class="nav-item"><a class="nav-link active"
												data-toggle="tab" href="#tab-8">전체</a></li>
											<li class="nav-item"><a class="nav-link"
												data-toggle="tab" href="#tab-9">미접종</a></li>
											<li class="nav-item"><a class="nav-link"
												data-toggle="tab" href="#tab-10">접종완료</a></li>
										</ul>
										<div class="card bg-light py-3 py-md-3 border" style="height:190px">
											<div class="card-body" id="checkup">
											
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="tab-6" role="tabpanel">
										<h5 class="card-title">Card with pills</h5>
										<p class="card-text">3</p>
									</div>
									<div class="tab-pane fade" id="tab-7" role="tabpanel">
										<h5 class="card-title">Card with pills</h5>
										<p class="card-text">3</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
</body>
</html>