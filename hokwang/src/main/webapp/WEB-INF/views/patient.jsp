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
		//dignosisDetail2();//상세진료

	})
	function RPAD(str, padStr, padLen) {
		str = str.toString().substr(1, 1); //주민번호 첫글자
		while (padLen > 1) {
			str += padStr; //뒤에서 부터
			padLen--; //글자길이만큼 뒤에서부터 감소
		}
		return str;
	}
	
	
	
	function patientList(keyword) {

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
	function patientListResult(data) {//전체환자리스트
		console.log("patientListResult전체환자 리스트 출력 콘솔" );
		
		$("#patientList").empty();
		$.each(data, function(idx, item) {
			var regno2 = item.baby_regno2;
			console.log("patientListResult전체환자 " + regno2);
			regno2 = RPAD(regno2, '*', 7);
			$("<tr>").append(
					$("<td id='baby_no' value= '"+item.baby_no+"'>").html(
							item.baby_no)).append(
					$("<td>").html(item.baby_name)).append(
					$("<td id='regno "+idx+"'>").html(item.baby_regno1+" - "+ regno2))
					.append($('<td style="display:none;">').html(item.baby_no))
					.appendTo('#patientList');
			//console.log("예약번호 : "+td.eq(5).text());
		})/* end of ajax  */
	}

	// 예약환자명 검색
	function searchPatient() {
		var keyword = $("#keyword2").val();
		console.log("keyword : " + keyword);
		patientList(keyword);
		$("#keyword2").val("");
	}
	function diagnosisRecord() {//환자 진료내역

		$("body").on("click", "#patientList tr", function() {
			var tdArr = new Array();
			var td = $(this).children();
			$("#mediName").empty();
			$("#diagDetail1").empty();
			$("#diagDetail2").empty();
			
			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});//end of each function

			console.log("환자클릭시 진료기록 요청");
			console.log("아기번호 : " + td.eq(3).text());
			$.ajax({
				url : "ajax/diagDetailAndInfo",
				data : {
					baby_no : td.eq(3).text()
				},
				dataType : "JSON",
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 : 일단진료기록에러임" + msg);
				},
				success : function(result) {
					
					diagnosisRecordResult(result.diagnosisRecord)
					patientInfoResult(result.patientInfo)
					chartListRuselt(result.chart)
					payPatientRuselt(result.payPatient)//수납내역
				}
			});//end of ajax
		});//end of onclick function
	}//end of function

	
	function payPatientRuselt(data) {//수납상태
		console.log("수납내역 리스트 출력");
		$("#pay_Stat2").empty();
		var text = "";
		$.each(data,function(idx, item) {
			if (item.PAY_STATE == "Y") {
					text = "결제 완료";
					$("<tr>").append($("<td id='pay_date2'>").html(item.PAY_DATE))
					.append($("<td id='price" +idx+"'>").html(item.PAY_PRICE+ " 원"))
					.append($("<td>").attr("id", 'pay_statePatient').attr('value',item.PAY_STATE).html(text))
					.appendTo('#pay_Stat2');
			}	
			if (item.PAY_STATE == "W") {
				text = "결제 대기";
				$("<tr>").append($("<td id='pay_date2'>").html(item.PAY_DATE))
				.append($("<td id='price" +idx+"'>").html(item.PAY_PRICE+ " 원"))
				.append($("<td>").attr("id", 'pay_statePatient').attr('value',item.PAY_STATE).html(text))
				.appendTo('#pay_Stat2');
			}	
			if (item.PAY_STATE == "N") {
				text = "미수납";
				$("<tr>").append($("<td id='pay_date2'>").html(item.PAY_DATE))
				.append($("<td id='price" +idx+"'>").html(item.PAY_PRICE+ " 원"))//style="background:#a0c49d;color:white;
				.append($("<td>").attr("id", 'pay_statePatient').attr('value',item.PAY_STATE).attr("style","background:#a0c49d;color:white;")
						.html(text))
				.appendTo('#pay_Stat2');
		}	
				/* 	//Y(결제완료)/W(결제대기)/N(미수납).css("background", "#bed3c3")
					if (item.PAY_STATE == "Y") {
						console.log(">>결제완료 " + item.PAY_STATE+idx);
						text = "결제 완료";
						$("#price2" + idx).eq(-1).after('<td id="pay_statePatient" >' + text + '</td>');
					}
					
					else if (item.PAY_STATE == "W"){
						console.log(">>결제완료 " +  item.PAY_STATE+idx);
						text = "결제 대기";
						$("price2"+idx).eq(-1).after('<td id="pay_statePatient">'+text+'</td>');
					}
					else if (item.PAY_STATE == "N") {
						console.log(">>미수납 " +  item.PAY_STATE+idx);
						text = "미수납";
						$("#price2" + idx).eq(-1).after(
								'<td id="pay_statePatient" style="background:#a0c49d;color:white;">' + text + '</td>');
					} */
				});//endonf each function
	}
	function patientInfoResult(data) {//환자정보
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
						"주민번호: " + data.BABY_REGNO1 + "-" + regno2))
				.append($("<p>").html("방문 여부 : " + data.BABY_VISIT)).append(
						$("<hr>")).append(
						$("<p>").html("보호자명 : " + data.PARENT_NAME)).append(
						$("<p>").html("연락처 : " + data.PARENT_TEL)).append(
						$("<p>").html(
								"주소 : " + data.PARENT_ADDR + " "))
	}

	function diagnosisRecordResult(data) {//진료기록
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

	function dignosisDetail1() {//환자상세 

		$("body").on("click", "#diagnosisRecord tr", function() {
			var td = $(this).children();
			console.log("진료내역클릭시 -> 진료기록 요청 dignosisDetail1");
			console.log("예약번호 : " + td.eq(2).text());
			$.ajax({
				url : "ajax/diagDetail",
				data : {
					resv_no : td.eq(2).text(),
					diag_no : td.eq(0).text()
				},
				dataType : "JSON",
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 : 상세진료내역" + msg);
				},
				success : function(result) {
					
					dignosisDetailResult(result.medicine);//resv_no//약이름
					dignosisDetailResult2(result.diag2);//diag_no//질병이름
					dignosisDetailResult3(result.diag3);//diag_no//메모
				}
			});//end of ajax

		});//end of onclick function
	}

	function dignosisDetailResult(data) {

		console.log("약이름 출력");
		//console.log(key);
		
		/* 	$("#mediName")
			.append($("<p>").html("약이름 : " + key)).append($("<hr>"))
		 */
			$("#mediName").empty();
		$.each(data, function(idx, item) {
			var key = Object.values(data[idx]);
			console.log(">>>>>>>>>>>>>>>>>>>" + data)
			$("#mediName").append($("<p>" + idx).html("약이름 : " + key)).append(
					$("<hr>"))
		});

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
	var chartLabels = [];
	var chartData = [];
	var chartData2 = [];

	function chartListRuselt(data) {
		chartData = [];
		chartData2 = [];
		$.each(data, function(idx, item) {
			chartData.push(item.body_height);
			chartData2.push(item.body_weight);
		})//end of function
		createChart();
		console.log("차트생성")
	}

	function createChart() {
		//차트 옵션 설정
		var speedCanvas = document.getElementById("myChart");

		Chart.defaults.global.defaultFontFamily = "Lato";
		Chart.defaults.global.defaultFontSize = 18;
		var dataHeight = {
			label : "신장",
			data : chartData,
			lineTension : 0,
			fill : false,
			borderColor : 'blue'
		};
		var dataChartall = {
			labels : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월",
					"10월", "11월", "12월" ],
			datasets : [ {
				label : "체중",
				data : chartData2,
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
			}, dataHeight ]
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
						labelString : "월",
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
						labelString : "cm/kg",
						fontColor : "green"
					}
				} ]
			}
		};

		var lineChart = new Chart(speedCanvas, {
			type : 'line',
			data : dataChartall,
			options : chartOptions
		});
	}
</script>
</head>
<body>
	<!-- Content Row -->
	<div class="row">

		<!-- 1 -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card shadow py-2" style="height: 400px; margin:10px 0;">
				<div class="card-body">
					<p class="text-s font-weight-bold text-success">환자정보</p>
					<div style="width: 100%; height: 300px; overflow: auto;"
						id="ptInfo2"></div>
				</div>
			</div>
			<div class="card shadow py-2" style="height: 400px;">
				<div class="card-body" style="padding: 0.5rem;">
					<p class="text-s font-weight-bold text-success">체중 신장 차트</p>
					<div class="chart-area" style="width: 100%; margin: 0 auto;">
						<canvas id="myChart" style="width: 100%; height: 100%;"></canvas>
					</div>
				</div>
			</div>
		</div>

		<!-- 2-->
		<div class="col-xl-6 col-md-6 mb-4">
			<div class="card shadow py-2" style="height: 400px; margin:10px 0; padding:5px;">
				<div class="text-s font-weight-bold"
					style="margin-bottom: 20px; width: 100%; height: 400px; overflow: auto;">

					<span class="text-primary">전체 환자 리스트</span>
					<form style="margin: 0 0 10px 0 !important; width: 100%;"
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group"
							style="width: 400px; float: right; margin-right: 10px;">
							<input type="text" class="form-control border-0 small"
								name="keyword" id="keyword2" placeholder="환자이름"
								aria-label="Search" aria-describedby="basic-addon2"
								onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchPatient();}">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button" id="searchPati2"
									onclick="searchPatient()">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>
					<table class="table text-center">
						<thead>
							<tr>
								<th class="text-center">환자번호</th>
								<th class="text-center">성명</th>
								<th class="text-center">생년월일</th>
							</tr>
						</thead>
						<tbody id="patientList"></tbody>
					</table>
				</div>
				<!--전체환자 리스트  -->
			</div>
			<div class="card shadow py-2"
				style="height: 400px; float: left; width: 49%; overflow: auto; padding:5px; margin-right: 15px;">
				<p class="text-s font-weight-bold text-success">환자 진료 내역</p>
				<table class="table text-center">
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
				style="height: 400px; float: left; width: 49%; padding:5px;">
				<p class="text-s font-weight-bold text-danger"
					style="margin-bottom: 3px !important;">환자 상세 진료 내역</p>
				<div class="card-body22">
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
			<div class="card shadow py-2" style="height: 800px; margin:10px 0;">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="font-weight-bold text-warning text-uppercase mb-1"> 수납</div>
							<div class="mb-0 font-weight text-black-800"
								style="float: left">
								<table class="table text-center" style="width:400px">
									<thead>
										<tr align=center>
											<th>결제 일자</th>
											<th>결제 금액</th>
											<th>결제 상태</th>
										</tr>
									</thead>
									<tbody id="pay_Stat2"></tbody>
								</table>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>