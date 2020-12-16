<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid" style="margin-top: 10px !important;">
		<!-- Content Row -->
		<div class="row">

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<form style="margin: 0 0 10px 0!important; width: 100%;"
					class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control border-0 small"
							placeholder="예약환자명" aria-label="Search"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
				<div class="card shadow py-2" style="height: 250px;">
					<div class="card-body">
						<p>환자정보</p>
					</div>
				</div>
				<div class="card shadow py-2" style="height: 100px; margin: 10px 0;">
					<div class="card-body">
						<p>특이사항</p>
					</div>
				</div>
				<div class="card shadow py-2" style="height: 380px;">
					<div class="card-body">
						<p>진료/예약 이력</p>
						<table border="1" style=" border-collapse: collapse; width: 100%; text-align: center;">
							<tr>
								<td>No</td>
								<td>일시</td>
								<td>설명</td>
								<td>사진</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card shadow py-2" style="height: 800px;">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-s font-weight-bold text-success text-uppercase mb-1">
									전체 예약 환자</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card shadow py-2" style="height: 800px;">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
								</div>
								<div class="row no-gutters align-items-center">
									<div class="col-auto">
										<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
									</div>
									<div class="col">
										<div class="progress progress-sm mr-2">
											<div class="progress-bar bg-info" role="progressbar"
												style="width: 50%" aria-valuenow="50" aria-valuemin="0"
												aria-valuemax="100"></div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-auto">
								<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Pending Requests Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card shadow py-2" style="height: 800px;">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xs font-weight-bold text-warning text-uppercase mb-1">
									Pending Requests</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
							</div>
							<div class="col-auto">
								<i class="fas fa-comments fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>