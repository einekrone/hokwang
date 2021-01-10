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

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>

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
ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li{
  display: inline-block;
	background: #898989;
	color: white;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #e0e0e0;
	color: #222;
}

.tab-content{
  display: none;
	background: #ffffff;
	padding: 12px;
}
.tab-content.current{
	display: inherit;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {

		$('ul.tabs li').click(function() { //선택자를 통해 tabs 메뉴를 클릭 이벤트를 지정해줍니다.
			var tab_id = $(this).attr('data-tab');
		
			$('ul.tabs li').removeClass('current'); //선택 되있던 탭의 current css를 제거하고 
			$('.tab-content').removeClass('current');

			$(this).addClass('current'); ////선택된 탭에 current class를 삽입해줍니다.
			$("#" + tab_id).addClass('current');
		})
	});
</script>
</head>
<body>
	<!-- 1 -->
	<div class="row">
		<div class="col-5 col-lg-8 col-xxl-9 d-flex">
			<div class="card flex-fill">
				<div class="card-header">
					<div>여기사진들어갈곳</div>
					<input type="button" class="card-title mb-0" value="예약하기">
				</div>
			</div>
		</div>
		<div class="col-7 col-lg-8 col-xxl-9 d-flex">
			<div class="card flex-fill">
				<div class="card-header">
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
			<div class="card flex-fill">
				<div class="card-body px-4 " style="height: 300px;">
					<div class="container">
						<!-- 탭 메뉴 상단 시작 -->
						<ul class="tabs">
							<li class="tab-link current" data-tab="tab-1">메뉴_하나</li>
							<li class="tab-link" data-tab="tab-2">메뉴_둘</li>
							<li class="tab-link" data-tab="tab-3">메뉴_셋</li>
						</ul>
						<!-- 탭 메뉴 상단 끝 -->
						<!-- 탭 메뉴 내용 시작 -->
						<div id="tab-1" class="tab-content current">
							<h1>탭 메뉴 1 내용입니다.</h1>
						</div>
						<div id="tab-2" class="tab-content">
								<h1>탭 메뉴 2 내용입니다.</h1>
						</div>
						<div id="tab-3" class="tab-content">
							<h1>탭 메뉴 3 내용입니다.</h1>
						</div>
						<!-- 탭 메뉴 내용 끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>