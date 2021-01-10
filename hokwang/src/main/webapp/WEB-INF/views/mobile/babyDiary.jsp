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
ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	display: inline-block;
	background: #898989;
	color: white;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current {
	background: #e0e0e0;
	color: #222;
}

.tab-content {
	display: none;
	background: #ffffff;
	padding: 12px;
}

.tab-content.current {
	display: inherit;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#myTab a').on('click', function(e) {
			e.preventDefault()
			$(this).tab('show')
			$('#home').tab('show')
		})
		
		$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
			e.target // newly activated tab
			e.relatedTarget // previous active tab
		})
	});
</script>
</head>
<body>
	<!-- 1 -->
	<div class="row">
		<div class="col-5 col-lg-8 col-xxl-9 d-flex">
			<div class="card flex-fill">
					<div>여기사진들어갈곳</div>
					<input type="button" class="card-title mb-0" value="예약하기">
			</div>
		</div>
		<div class="col-7 col-lg-8 col-xxl-9 d-flex">
			<div class="card flex-fill" >
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
		<div class="col-12 col-lg-8 col-xxl-9 d-flex">
			<div class="card flex-fill" style="height: 400px;">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active" id="home-tab"
						data-toggle="tab" href="#home" role="tab" aria-controls="home"
						aria-selected="true">Home</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false">Profile</a></li>
					<li class="nav-item"><a class="nav-link" id="messages-tab"
						data-toggle="tab" href="#messages" role="tab"
						aria-controls="messages" aria-selected="false">Messages</a></li>
					<li class="nav-item"><a class="nav-link" id="settings-tab"
						data-toggle="tab" href="#settings" role="tab"
						aria-controls="settings" aria-selected="false">Settings</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active" id="home" role="tabpanel"
						aria-labelledby="home-tab"><a>1111111111111111111111111111></a></div>
					<div class="tab-pane" id="profile" role="tabpanel"
						aria-labelledby="profile-tab">2</div>
					<div class="tab-pane" id="messages" role="tabpanel"
						aria-labelledby="messages-tab">3</div>
					<div class="tab-pane" id="settings" role="tabpanel"
						aria-labelledby="settings-tab">4</div>
				</div>
			</div>
		</div>
</body>
</html>