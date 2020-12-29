<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/diagnosis.css">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
<style>
div.dataTables_wrapper div.dataTables_paginate {
	margin-right: 30%;
}
</style>
<script src="./resources/json.min.js"></script>
<script type="text/javascript">
	$(function() {
		var searchType = "";
		var keyword = "";
		
		waitList();
		resvHstList();
		resvUniq();
		
		$('.tgl-flat').change(function() {
			searchType = "chkType";
			if ($('.rsvTg').is(":checked")) {
				keyword = "Y";
			} 
		console.log(">> " + keyword);
		resvList(searchType, keyword);
		
		google.load('visualization','1',{
		    'packages' : ['corechart']
		});
		 google.setOnLoadCallback(drawChart);
	});
});
	//구글차트(키/몸무게)
	function drawChart() {
		$.ajax({
			url : 'ajax/BodyInfo',
			type : 'GET',
			//contentType:'application/json;charset=utf-8',
			dataType : 'json',
			data : {
				searchType : searchType,
				keyword : keyword
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : waitListResult
		});
	}
	//대기환자 함수
	function waitList(searchType, keyword) {
		$.ajax({
			url : 'ajax/waitList',
			type : 'GET',
			//contentType:'application/json;charset=utf-8',
			dataType : 'json',
			data : {
				searchType : searchType,
				keyword : keyword
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : waitListResult
		});
	}
	
	//대기환자 리스트 출력
	function waitListResult(data) {
		$("#waitList").empty();
		$.each(data, function(idx, item) {
			var date = item.RESV_DATETIME.substring(0,10);
			var d = new Date();
		    var today = d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate();
			
			$('<tr>')
			.append($('<td id="resvNo" value="'+item.RESV_NO+'">').html(item.RESV_NO))
			.append($('<td>').html(item.RESV_DATETIME))
			.append($('<td>').html(item.BABY_NAME))
			.append($('<td id="regno'+idx+'">').html(item.BABY_REGNO1))
			.append($('<td style="display:none;">').html(item.BABY_NO))
		    .appendTo('#waitList');
		});
		// Korean
		  var lang_kor = {
		        "paginate" : {
		            "first" : "첫 페이지",
		            "last" : "마지막 페이지",
		            "next" : "다음",
		            "previous" : "이전"
		        }
		}
		$('#waitList_table').DataTable({
			// 표시 건수기능 숨기기
			lengthChange: false,
			// 검색 기능 숨기기
			searching: false,
			// 정렬 기능 숨기기
			ordering: false,
			// 정보 표시 숨기기
			info: false,
			scrollY: 200,
			language : lang_kor});
	}
	// 진료/예약 이력 목록 클릭 시 특이사항 출력
	function resvUniq() {
		$("body").on("click", "#HistoryList tr", function() {
			var tdArr = new Array();
			var td = $(this).children();
			
			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});
			
			console.log("예약번호 : "+td.eq(0).text());
	
			$.ajax({
				url : 'ajax/MemoInfo',
				data : {
					resv_no : td.eq(0).text()
				},
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : MemoResult
			});
		});
	}
	
	function MemoResult(data) {
		$("#baby_unusual").empty();
		$("#baby_unusual").append(data.RESV_MEMO);
	}
	
	// 환자목록 클릭 시 진료/예약 이력 목록 출력
	function resvHstList() {
		$("body").on("click", "#waitList tr", function(){

			var tdArr = new Array();
			var td = $(this).children();
			
			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});
			
			console.log("아기번호 : "+td.eq(4).text());
			
			$.ajax({
				url : 'ajax/HistoryList',
				data : {
					baby_no : td.eq(4).text()
				},
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : HistoryListResult
			});
			
			$.ajax({
				url : 'ajax/Info',
				data : {
					baby_no : td.eq(4).text()
				},
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : InfoResult
			});
		});
	}
	
	function HistoryListResult(data) {
		$("#HistoryList").empty();
		$.each(data, function(idx, item) {
			$('<tr>')
			.append($('<td style="display:none;">').html(item.RESV_NO))
			.append($('<td>').html(item.RESV_DATE))
			.append($('<td style="display:none;">').html(item.RESV_DETAIL))
			.append($('<td style="display:none;">').html(item.RESV_NO))
			.append($('<td style="display:none;">').html(item.BABY_NO))
		    .appendTo('#HistoryList');
		});
	}

	function InfoResult(data) {
		$("#Info").empty();
		//var regno2 = data.BABY_REGNO2;
		$("#Info")
		.append($('<p>').html('NO : '+ data.BABY_NO))
		.append($('<p>').html('이름 : ' + data.BABY_NAME+" ("+data.BABY_BLOOD+"형, "+data.BABY_GENDER+")"))
		.append($('<p>').html('주민번호 : ' + data.BABY_REGNO1+'-'+data.BABY_REGNO2))
		.append($('<hr>'))
		.append($('<p>').html('보호자명 : ' + data.PARENT_NAME))
		.append($('<p>').html('연락처 : ' + data.PARENT_TEL))
		.append($('<p>').html('주소 : ' + data.PARENT_ADDR+' '+data.PARENT_ADDRDETAIL+' '+data.PARENT_POST))
	}


</script>
</head>
<body>
	<!-- 진료 전체 -->
	<div class="container-fluid" style="margin-top: 10px !important;">
		<!-- Content Row -->
		<div class="row">

			<!-- 진료 1 -->
			<div class="col-xl-3 col-md-6 mb-4">
				<!-- 환자정보 -->
				<div class="card shadow py-2" style="height: 280px;">
					<!-- wrapeer -->
					<div class="card-body">

						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-user"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">환자정보</span>
								<div style="width: 100%; height: 160px; overflow: auto;"
									id="Info"></div>
							</div>
						</div>
					</div>
					<!-- end of wrapeer -->
				</div>

				<!-- 특이사항 -->
				<div class="card shadow py-2" style="height: 150px;">
					<div class="card-body">

						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-check"></i>

								<!-- content -->
								<span class="tit" id="baby_unusual_title"
									style="font-weight: 600;">특이사항</span>
							</div>
							<div style="width: 100%; height: 160px; overflow: auto;"
								id="baby_unusual"></div>
						</div>

					</div>
				</div>
				<!-- 환자리스트 -->
				<div class="card shadow py-2" style="height: 410px;">
					<div class="card-body">
						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-user"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">환자리스트</span> <span
									class="mb-0 font-weight-bold"
									style="float: right; margin: 4px 0 0 5px;">진료완료</span> <span
									style="float: right;"><input class="tgl tgl-flat rsvTg"
									id="cb1" type="checkbox" /> <label class="tgl-btn" for="cb1"></label>
								</span>
							</div>
						</div>
						<div id="content">
							<table class="table text-center" id="waitList_table">
								<thead>
									<tr id="nbda">
										<th class="text-center">NO</th>
										<th class="text-center">일시</th>
										<th class="text-center">성명</th>
										<th class="text-center">생년월일</th>
										<th style="display: none;"></th>
									</tr>
								</thead>
								<tbody id="waitList"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>


			<!-- 진료 2 -->
			<div class="col-xl-5 col-md-6 mb-4">

				<!-- 사진 -->
				<div class="card shadow py-2"
					style="height: 300px; float: left; width: 50%">
					<div class="card-body">
						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="far fa-image"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">상세 사진</span>
							</div>
						</div>

						<!-- 사진 -->
						<div>
							<image src="${pageContext.request.contextPath}/DD.JPG"
								id="baby_pic"></image>
						</div>
					</div>
				</div>

				<!-- 성장 차트 -->
				<div class="card shadow py-2"
					style="height: 300px; float: left; width: 50%">
					<div class="card-body">
						<div class="chart-area">
							<canvas id="myAreaChart"></canvas>
						</div>
					</div>
				</div>

				<!-- 환자 기록 -->
				<div class="card shadow py-2" style="height: 540px;">
					<div class="card-body">
						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-file-medical"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">진료 기록</span>
							</div>
						</div>


						<!-- 진료 기록 -->
						<div style="width: 40%; float: left">
							<table id="noborder_table">
								<thead>
									<tr id="nbab">
										<th class="text-center">일시</th>
									</tr>
								</thead>
								<tbody id="HistoryList"></tbody>
							</table>
						</div>

						<!-- 진료 기록 상세 -->
						<div style="width: 60%; float: right;">
							<table id="noborder_table">
								<tr id="nbab">
									<th>날짜</th>
									<td>2020-12-18</td>
								</tr>
								<tr>
									<th>기록</th>
									<td>배가 고파서 밥을 먹었다.</td>
								</tr>
								<tr>
									<th>상병</th>
									<td>급성 배고픔</td>
								</tr>
								<tr>
									<th>처방</th>
									<td>이탈리안 비엠티</td>
									<td>에그마요추가</td>
									<td>아메리칸치즈</td>
									<td>랜치</td>
									<td>후추</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- 진료 4 -->
			<div class="col-xl-4 col-md-6 mb-4">

				<!-- 외래기록 -->
				<div class="card shadow py-2" style="height: 200px;">
					<div class="card-body">
						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-pencil-alt"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">외래기록</span>
							</div>
						</div>

						<!--소견내용  -->
						<div>
							<input class="cont" id="patient_records" name="records">
						</div>
					</div>
				</div>

				<!-- 상병 -->
				<div class="card shadow py-2" style="height: 320px;">
					<div class="card-body">
						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-stethoscope"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">상병</span>
							</div>
						</div>
						<!-- 상병 내용 table -->

						<!-- 						<table>
							<tr>
								<td>코드</td>
								<td>상병명</td>
								<td>좌 우</td>
							</tr>
							<tr>
								<td>123</td>
								<td>급성 비인두염[감기]</td>
								<td><span style="margin: 4px 0 0 5px;">좌</span>
								<input class="chk" type="checkbox">
								<span style="margin: 4px 0 0 5px;">우</span>
								<input class="chk" type="checkbox"></td>
							</tr>
						</table> -->
					</div>
				</div>

				<!-- 처방 -->
				<div class="card shadow py-2" style="height: 320px;">
					<div class="card-body">
						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-capsules"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">처방</span>
							</div>
						</div>

						<!-- 처방 내용 table -->

						<table>
							<tr>
								<td>코드</td>
								<td>처방명</td>
								<td>용량</td>
								<td>일투</td>
								<td>일수</td>
								<td>용법</td>
								<td>특정내역</td>
							</tr>
							<tr>
								<td>123</td>
								<td>어린이부루펜시럽(내복)</td>
								<td>28</td>
								<td>4</td>
								<td>2</td>
								<td>fev</td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>