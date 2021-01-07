<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>부트스트랩 차트그리기</title>
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
	});
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
	}
</script>
<style>
@media ( min-width : 768px).col-md-6 {
	-ms-flex
	:
	 
	0
	 
	0
	 
	50
	%;
	
    
	flex
	:
	 
	0
	 
	0
	 
	100
	%;
	
    
	max-width
	:
	 
	100
	%;
	

}
</style>
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
					<div class="col">
						
					</div>
				</div>
				<div class="row my-2">
					<div class="col-md-6" style="flex: 0 0 100%; max-width: 100%;">
						<div class="card">
							<div class="card-body">
								<canvas class="myChart"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
			integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
			integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
			crossorigin="anonymous"></script>
		<!-- 차트 -->
		<script>
			const bardata = [ 10, 20, 30, 40 ]; //bar 입력값 (일,월)	
			const linedataHalf = [ 5, 10, 20, 7 ]; // line 입력될 데이터값 (연)
			var ctx = document.getElementById("myChart");
			var ctx = document.getElementsByClassName("myChart");
			var mixedChart = {
				type : 'bar',
				labels : [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
				datasets : [ {
					label : 'Bar Dataset',
					data : bardata,
					backgroundColor : 'rgba(256, 0, 0, 0.1)' //bar 차트 색상
				}, {
					label : 'Line Dataset',
					data : linedataHalf,
					backgroundColor : 'transparent',
					borderColor : 'skyblue', //line 차트 색상
					type : 'line'
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
		</script>

	</div>

</body>
</html>