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
  height:100px;
  display:inline;
}
#reserv{
  width:53px;
  height:100px;
  display:inline;
}
#resvname{
display:inline;
}
</style>
</head>
<body>

	<div class="row mb-2 mb-xl-3">
		<div class="col-auto ml-auto text-right mt-n1">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb bg-transparent p-0 mt-1 mb-0">
					<input type="button" class="btn btn-primary btn-sm" value="모바일 아기 수첩">
				</ol>
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
								<input type="button" class="btn btn-primary" value="당일" id="today">
								<h5 id ="resvname" class="card-title mb-4">예약/접수</h5>
								<input type="button" class="btn btn-primary" value="예약" id="reserv">
							</div>
						</div>
					</div>
					<div id="card2" class="card">
						<div class="card-body">
							<h5 class="card-title mb-4">증명서발급</h5>
							<div class="mb-1">
								<span class="text-success"> <i
									class="mdi mdi-arrow-bottom-right"></i> 6.65%
								</span> <span class="text-muted">Since last week</span>
							</div>
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
				<table class="table table-hover my-0">
					<thead>
						<tr>
							<th>Name</th>
							<th>Status</th>
							<th class="d-none d-md-table-cell">Assignee</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Project Apollo</td>
							<td><span class="badge bg-success">Done</span></td>
							<td class="d-none d-md-table-cell">Vanessa Tucker</td>
						</tr>
						<tr>
							<td>Project Fireball</td>
							<td><span class="badge bg-danger">Cancelled</span></td>
							<td class="d-none d-md-table-cell">William Harris</td>
						</tr>
						<tr>
							<td>Project Hades</td>
							<td><span class="badge bg-success">Done</span></td>
							<td class="d-none d-md-table-cell">Sharon Lessman</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

<!-- 병원 위치, 오시는길/영업일시 -->
	<div class="row">
		<div class="col-12 col-md-12 col-xxl-6 d-flex order-3 order-xxl-2">
			<div class="card flex-fill w-100">
				<div class="card-header">
					<h5 class="card-title mb-0">병원 위치</h5>
				</div>
				<div class="card-body px-4">
					<div id="world_map" style="height: 350px;"></div>
				</div>
			</div>
		</div>
	</div>

	
</body>
</html>