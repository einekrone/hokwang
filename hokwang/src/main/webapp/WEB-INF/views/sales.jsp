<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	$(function() {
		showDaySale();
		showMonthSale();
		showYearSale();
		showCountResv();
	});

	function showCountResv() {
		$.ajax({
			url : "ajax/showCountResv",
			type : "GET",
			dataType : "json",
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {

				$('#countResv').append(data).append('건');
			}

		});
	}

	function showDaySale() {
		$.ajax({
			url : "ajax/showDaySale",
			type : "GET",
			dataType : "json",
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 : 일매출" + msg);
			},
			success : function(data) {
				
				$('#daySales').append(data).append('원');
			}

		});
	}

	function showMonthSale() {
		$.ajax({
			url : "ajax/showMonthSale",
			type : "GET",
			dataType : "json",
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 : 월매출" + msg);
			},
			success : function(data) {
				$('#monthSales').append(data).append('원');			
			}

		});
	}

	function showYearSale() {
		$.ajax({
			url : "ajax/showYearSale",
			type : "GET",
			dataType : "json",
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 : 년매출" + msg);
			},
			success : function(data) {
				$('#yearSales').append(data).append('원');
			}

		});
	}
</script>

</head>
<body>
	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4"
			style="margin-top: 10px;"></div>

		<!-- Content Row -->
		<div class="row">

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-primary shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xs font-weight-bold text-primary text-uppercase mb-1">
									일 매출</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800"
									id="daySales"></div>
							</div>
							<div class="col-auto">
								<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-success shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xs font-weight-bold text-success text-uppercase mb-1">
									월 매출</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800"
									id="monthSales"></div>
							</div>
							<div class="col-auto">
								<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-info shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xs font-weight-bold text-info text-uppercase mb-1">연
									매출</div>
								<div class="row no-gutters align-items-center">
									<div class="col-auto">
										<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"
											id="yearSales"></div>
									</div>

								</div>
							</div>
							<div class="col-auto">
								<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Pending Requests Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-warning shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xs font-weight-bold text-warning text-uppercase mb-1">
									당일 예약 건수</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800"
									id="countResv"></div>
							</div>
							<div class="col-auto">
								<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 밑부분 -->
		<div class="row"></div>
	</div>

</body>
</html>