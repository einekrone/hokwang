<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		//$(document).ready() = $(function(){}) 
		//body태그의 모든 태그들이 
		//출력된 다음에 호출이 되는 코드입니다.
		var keyword = "";
		patientList(keyword); //전체 환자 리스트
		diagnosisRecord();//진료기록

		dignosisDetail1();//상세 진료 약이름
		dignosisDetail2();//상세진료
	})

	function patientList(keyword) {

		var keyword = "";

		$.ajax({
			url : "ajax/patientList",
			type : "GET",
			dataType : "JSON",
			data : {
				keyword : keyword
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : patientListResult

		});/* end of ajax */

	}/* end of function */
	function patientListResult(data) {
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

	function diagnosisRecord() {//환자 진료내역

		$("body").on("click", "#patientList tr", function() {
			var tdArr = new Array();
			var td = $(this).children();

			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});//end of each function

			console.log("환자클릭시 진료기록 요청");
			console.log("아기번호 : " + td.eq(4).text());
			$.ajax({
				url : "ajax/diagnosisRecord",
				data : {
					baby_no : td.eq(4).text()
				},
				dataType : "JSON",
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 : 일단진료기록에러임" + msg);
				},
				success : diagnosisRecordResult
			});//end of ajax
			$.ajax({
				url : "ajax/patientInfo",
				data : {
					baby_no : td.eq(4).text()
				},
				dataType : "json",
				error : function(xhr, status, msg) {
					alert("상태값" + status + " Http에러메세지: " + msg)
				},
				success : patientInfoResult
			});
		});//end of onclick function
	}//end of function
	function RPAD(str, padStr, padLen) {
		str = str.toString().substr(1, 1); //주민번호 첫글자
		while (padLen > 1) {
			str += padStr; //뒤에서 부터
			padLen--; //글자길이만큼 뒤에서부터 감소
		}
		return str;
	}

	function patientInfoResult(data) {
		$("#ptInfo2").empty();

		var regno2 = data.BABY_REGNO2;
		console.log("주민번호: " + data.BABY_REGNO2 + "이름 : " + data.BABY_NAME);
		regno2 = RPAD(regno2, '*', 7);
		console.log(regno2);
		$("#ptInfo2").append(
				$("<p>").html(
						"이름 : " + data.BABY_NAME + " (" + data.BABY_BLOOD
								+ "형, " + data.BABY_GENDER + ")")).append(
				$("<p>").html(
						"주민번호: " + data.BABY_REGNO1 + "-" + data.BABY_REGNO2))
				.append($("<p>").html("방문 여부 : " + data.BABY_VISIT)).append(
						$("<hr>")).append(
						$("<p>").html("보호자명 : " + data.PARENT_NAME)).append(
						$("<p>").html("연락처 : " + data.PARENT_TEL)).append(
						$("<p>").html(
								"주소 : " + data.PARENT_ADDR + " "
										+ data.PARENT_ADDRDETAIL + " "
										+ data.PARENT_POST))
	}

	function diagnosisRecordResult(data) {
		console.log("진료기록 리스트 출력");
		$("#diagnosisRecord").empty();

		$.each(data, function(idx, item) {
			$("<tr>").append($("<td>").html(item.diag_no)).append(
					$("<td>").html(item.diag_time)).append(
					$('<td style="display:none;">').html(item.resv_no)).append(
					$('<td style="display:none;">').html(item.diag_no))
					.appendTo('#diagnosisRecord');

		});//endonf each function

	}//end of fucntion

	function dignosisDetail1() {

		$("body").on("click", "#diagnosisRecord tr", function() {
			var td = $(this).children();
			console.log("진료내역클릭시 -> 진료기록 요청");
			console.log("진료번호 : " + td.eq(0).text());
			$.ajax({
				url : "ajax/dignosisDetail1",
				data : {
					diag_no : td.eq(0).text()

				},
				dataType : "JSON",
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 : 상세진료내역" + msg);
				},
				success : dignosisDetailResult
			});//end of ajax

		});//end of onclick function
	}
	function dignosisDetailResult(data) {
		var key = Object.values(data[0]);
		console.log("약이름 출력");
		console.log(key);
		$("#mediName").empty();
		$("#mediName").append($("<p>").html("약이름 : " + key)).append($("<hr>"))
	}

	function dignosisDetail2() {

		$("body").on("click", "#diagnosisRecord tr", function() {
			var td = $(this).children();
			console.log("진료내역클릭시 -> 진료기록 요청");
			console.log("진료번호 : " + td.eq(0).text());
			$.ajax({
				url : "ajax/dignosisDetail2",
				data : {
					diag_no : td.eq(0).text()

				},
				dataType : "JSON",
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 : 상세진료내역" + msg);
				},
				success : dignosisDetailResult2
			});//end of ajax
			$.ajax({
				url : "ajax/dignosisDetail2",
				data : {
					diag_no : td.eq(0).text()

				},
				dataType : "JSON",
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 : 상세진료내역" + msg);
				},
				success : dignosisDetailResult2
			});//end of ajax
			$.ajax({
				url : "ajax/dignosisDetail3",
				data : {
					diag_no : td.eq(0).text()

				},
				dataType : "JSON",
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 : 상세진료내역" + msg);
				},
				success : dignosisDetailResult3
			});//end of ajax

		});//end of onclick function
	}
	function dignosisDetailResult2(data) {
		var key = Object.values(data)
		console.log("상세진료 병,메모 ->" + key);
		$("#diagDetail1").empty();

		$("#diagDetail1").append($("<p>").html("질병이름 : " + key)).append(
				$("<hr>"))

	}

	function dignosisDetailResult3(data) {
		var key = Object.values(data)
		console.log("상세진료 병,메모 ->" + key);
		$("#diagDetail2").empty();

		$("#diagDetail2").append($("<p>").html("메모 : " + key))
				.append($("<hr>"))
	}
</script>

<script type="text/javascript">
	//차트 옵션 설정
	var speedCanvas = document.getElementById("myChart");

	Chart.defaults.global.defaultFontFamily = "Lato";
	Chart.defaults.global.defaultFontSize = 18;
	var dataSecond = {
		label : "신장",
		data : [ 20, 15, 60, 60, 65, 30, 70 ],
		lineTension : 0,
		fill : false,
		borderColor : 'blue'
	};
	var speedData = {
		labels : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월",
				"11월", "12월" ],
		datasets : [ {
			label : "체중",
			data : [ 0, 59, 75, 20, 20, 55, 40 ],
			lineTension : 0,
			fill : false,
			borderColor : 'orange',
			backgroundColor : 'transparent',
			pointBorderColor : 'orange',
			pointBackgroundColor : 'rgba(255,150,0,0.5)',
			borderDash : [ 5, 5 ],
			pointRadius : 5,
			pointHoverRadius : 10,
			pointHitRadius : 30,
			pointBorderWidth : 2,
			pointStyle : 'rectRounded'
		}, dataSecond ]
	};

	var chartOptions = {
		legend : {
			display : true,
			position : 'top',
			labels : {
				boxWidth : 80,
				fontColor : 'black'
			}
		},
		scales : {
			xAxes : [ {
				gridLines : {
					display : false,
					color : "black"
				},
				scaleLabel : {
					display : true,
					labelString : "Time in Seconds",
					fontColor : "red"
				}
			} ],
			yAxes : [ {
				gridLines : {
					color : "black",
					borderDash : [ 2, 5 ],//실선 길이
				},
				scaleLabel : {
					display : true,
					labelString : "cm",
					fontColor : "green"
				}
			} ]
		}
	};

	var lineChart = new Chart(speedCanvas, {
		type : 'line',
		data : speedData,
		options : chartOptions

	});
</script>
</head>
<body>
	<!-- Content Row -->
	<div class="row">

		<!-- 1 -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card shadow py-2" style="height: 400px;">
				<div class="card-body">
					<p class="text-s font-weight-bold text-success">환자정보</p>
					<div style="width: 100%; height: 300px; overflow: auto;"
						id="ptInfo2"></div>
				</div>
			</div>
			<div class="card shadow py-2" style="height: 400px;">
				<div class="card-body">
					<p class="text-s font-weight-bold text-success">체중 신장 차트</p>
					<div class="chart-area" style="width: 100%; margin: 0 auto;">
						<canvas id="myChart" style="width: 100%; height: 100%;"></canvas>
					</div>
				</div>
			</div>
		</div>

		<!-- 2-->
		<div class="col-xl-6 col-md-6 mb-4">
			<div class="card shadow py-2" style="height: 400px;">
				<div class="text-s font-weight-bold"
					style="margin-bottom: 20px; width: 100%; height: 250px; overflow: auto;">
					<span class="text-primary">전체 환자 리스트</span>
					<table class="table text-center">
						<thead>
							<tr>
								<th class="text-center">환자번호</th>
								<th class="text-center">성명</th>
								<th class="text-center">생년월일</th>
								<th class="text-center">주민번호</th>
							</tr>
						</thead>
						<tbody id="patientList"></tbody>
					</table>
				</div>
				<!--전체환자 리스트  -->
			</div>
			<div class="card shadow py-2"
				style="height: 400px; float: left; width: 50%; overflow: auto;">
				<p class="text-s font-weight-bold text-success">환자 진료 내역</p>
				<table border="1">
					<thead>
						<tr align=center>
							<th>진료 번호</th>
							<th>진료 시간</th>
						</tr>
					</thead>
					<tbody id="diagnosisRecord"></tbody>
				</table>
				<!-- 환자 진료 리스트 -->
			</div>
			<!-- 상세 진료 기록 -->
			<div class="card shadow py-2"
				style="height: 400px; float: left; width: 50%">
				<p class="text-s font-weight-bold text-danger"
					style="margin-bottom: 3px !important;">환자 상세 진료 내역</p>
				<div class="card-body">
					<p class="text-s font-weight-bold text-info">질병이름</p>
					<div style="width: 100%; height: 70px; overflow: auto;"
						id="diagDetail1"></div>
					<p class="text-s font-weight-bold text-info">메모</p>
					<div style="width: 100%; height: 70px; overflow: auto;"
						id="diagDetail2"></div>
					<p class="text-s font-weight-bold text-info">약제 이름</p>
					<div style="width: 100%; height: 80px; overflow: auto;" id=mediName></div>
				</div>
			</div>
			<!-- 환자 상세 진료 -->
		</div>

		<!-- Pending Requests Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card shadow py-2" style="height: 800px;">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-s font-weight-bold text-warning text-uppercase mb-1">
								접종</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800"
								style="float: left">
								18
								<table border="1" style="">
									<tr>
										<td align=center>접종명</td>
										<td align=center>상태</td>
									</tr>
									<tr>
										<td align=center>접종이름</td>
										<td align=center><input type="text" id="" name=""
											value="접종완료"></td>
									</tr>
									<tr>
										<td align=center>접종이름</td>
										<td align=center><input type="text" id="" name=""
											value="접종완료"></td>
									</tr>
									<tr>
										<td align=center>접종이름</td>
										<td align=center><input type="text" id="" name=""
											value="접종완료"></td>
									</tr>
									<tr>
										<td align=center>접종이름</td>
										<td align=center><input type="text" id="" name=""
											value="접종완료"></td>
									</tr>
								</table>
								<input type="text" id="" name="" value="접종완료"
									style="width: 250px; text-align: center;">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>