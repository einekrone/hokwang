<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<title>Insert title here</title>

<script>
	$(function() {
		allSales();
		createChart();
		Month1()
	});

	function Month1() {
		$.ajax({
			url : "ajax/getMonth1",
			Type : "POST",
			dataType : "json",
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + "Http에러메시지 : " + msg);
			},
			success : createChart

		});
	}

	/* allSales() */
	function allSales() {
		$.ajax({
			url : "ajax/allSales",
			type : "GET",
			dataType : "json",
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				if (data.day == null) {
					data.day = 0;
				}
				if (data.month == null) {
					data.month = 0;
				}
				if (data.year == null) {
					data.year = 0;
				}
				if (data.resv == null) {
					data.resv = 0;
				}

				$('#yearSales').append(data.year).append('원');
				$('#monthSales').append(data.month).append('원');
				$('#daySales').append(data.day).append('원');
				$('#countResv').append(data.resv).append('건');
			}

		});
	} /* allSales() end */

	/* createChart() */
	function createChart(data) {

		var monthdata = [ data ]; //bar 입력값 (일,월)	
		var linedataHalf = []; // line 입력될 데이터값 (연)	
		//var ctx = document.getElementById("myChart");
		var ctx = document.getElementsByClassName("myChart");
		var mixedChart = {
			type : 'bar',
			labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
					'10월', '11월', '12월' ],
			datasets : [ {
				label : '월 매출',
				data : monthdata,
				backgroundColor : 'rgba(256, 0, 0, 0.1)' //bar 차트 색상
			} ]
		};
		var myChart = new Chart(ctx, {
			type : 'bar',
			data : mixedChart,
			options : {
				legend : {
					display : true
				}
			}
		}); // var myChart = new Chart(ctx, {  type: 'bar',  data: mixedChart,  options: {  legend: {  display: true  }  }  });
	} /* createChart() */

	$('#myDropdown').on('show.bs.dropdown', function() {

		$('#myTab a[href="#profile"]').tab('show') // Select tab by name
		$('#myTab a:first').tab('show') // Select first tab
		$('#myTab a:last').tab('show') // Select last tab
		$('#myTab li:eq(2) a').tab('show') // Select third tab (0-indexed)
	})
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
		<div class="row">
			<div class="container">
				<div class="row my-3">
					<div class="col"></div>
				</div>
				<div class="row my-2">
					<div class="col-md-6" style="flex: 0 0 100%; max-width: 100%;">
						<div class="card">
							<div class="card-body">
								<div class="btn-group">
									<button type="button" class="btn btn-secondary dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">선택</button>
									<div class="dropdown-menu dropdown-menu-right">
										<button class="dropdown-item" type="button">2021</button>
										<button class="dropdown-item" type="button">2020</button>
										<button class="dropdown-item" type="button">2019</button>
									</div>
								</div>
								<canvas class="myChart"></canvas>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>