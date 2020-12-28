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
		diagnosisRecord();
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
		//console.log("예약번호 : "+td.eq(5).text());
		$("#patientList").empty();
		$.each(data, function(idx, item) {

			$("<tr>").append(
					$("<td id=' ' value= '"+item.BABY_NO+"'>").html(item.BABY_NO))
					.append($("<td>").html(item.BABY_NAME))
					.append($("<td id='regno "+idx+"'>").html(item.BABY_REGNO1))
					.append($("<td>").html(item.BABY_REGNO2))
					.append($('<td style="display:none;">').html(item.resv_no))
					.appendTo('#patientList');
		})/* end of ajax  */
	}
	
	 function diagnosisRecord(){//환자 진료내역
		$("body").on("click", "#patientList tr",function(){
			var tdArr = new Array();
			var td = $(this).children();
			
			td.each(function(i){
				tdArr.push(td.eq(i).text());
			});//end of each function
			console.log("예약번호 호출 : "+td.eq(5).text());
			console.log("환자클릭시 진료기록 요청");
			$.ajax({
				url: "ajax/diagnosisRecord",
				data : {
					resv_no : td.eq(5).text()
				},
				dataType : "JSON",
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 : 일단진료기록에러임" + msg);
				},
				success : diagnosisRecordResult
			});//end of ajax
		});//end of onclick function
	}//end of function
	
	function diagnosisRecordResult(data){
		console.log("진료기록 리스트 출력");
		$("#diagnosisRecord").empty();
		 var data = item.DIAG_TIME.substring(0,10);
		 var d = new Date();
		 var today = d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate();
		$.each(data,function(idx,item){
			$("<tr>")
			.append($("<td>").html(item.DIAG_NO))
			.append($("<td>").html(item.DIAG_TIME))
			.append($('<td style="display:none;">').html(item.resv_no))
			.appendTo('#diagnosisRecord');
			
		});//endonf each function
	}//end of fucntion 
	
</script>
</head>
<body>
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
				<div class="text-s font-weight-bold" style="margin-bottom: 20px;">
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
				style="height: 400px; float: left; width: 50%">
				환자 진료 내역
				<table border="1">
				<thead>
					<tr align=center>
						<td>번호</td>
						<td>진료 시간</td>
					</tr>
					</thead>
					<tbody id="diagnosisRecord"></tbody>
				</table>
				<!-- 환자 진료 리스트 -->
			</div>
			<div class="card shadow py-2"
				style="height: 400px; float: left; width: 50%">
				환자 진료 내역
				<!-- 환지 진료 리스트 -->
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
							<div class="h5 mb-0 font-weight-bold text-gray-800"
								style="float: left">
								18
								<table border="1" width="250px">
									<tr>
										<td align=center>접종명</td>
										<td align=center>상태</td>
									</tr>
									<tr>
										<td align=center>접종명</td>
										<td align=center><input type="button" id="" name=""
											value="접종완료"></td>
									</tr>
								</table>
								<input type="text" id="" name="" value="접종완료"
									style="width: 250px">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>