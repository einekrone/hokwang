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

			<!-- 1 -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card shadow py-2" style="height: 400px;">
					<div class="card-body">환자정보</div>
				</div>
				<div class="card shadow py-2" style="height: 400px;">
					<div class="card-body">
						체중 신장 차트
						<div class="chart-area">
							<canvas id="myAreaChart"></canvas>
						</div>
					</div>
				</div>
			</div>

			<!-- 2-->
			<div class="col-xl-6 col-md-6 mb-4">
				<div class="card shadow py-2" style="height: 400px;">
					전체환자 리스트
					<!--전체환자 리스트  -->
				</div>
				<div class="card shadow py-2"
					style="height: 400px; float: left; width: 50%">
					환자 진료 내역
					<!-- 전체환자 리스트 -->
				</div>
				<div class="card shadow py-2"
					style="height: 400px; float: left; width: 50%">
					환자 진료 내역
					<!-- 전체환자 리스트 -->
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
									접종</div>
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