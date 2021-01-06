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
		var searchDisease = "";
		var searchMedicine = "";

		waitList();
		resvHstList();
		resvUniq();
		getDiagDetail();
		getMedicineList();
		getMediChg();
		
		$(".diagMenu").show();
	});
	
	//질병검색
	$("#schdisease").click(function(){
		var searchDisease = $("#searchDisease").val();
		console.log("searchDisease :" + searchDisease);
		getDisease(searchDisease);
		$("searchDisease").val("");
	});
	
	  //약품 검색
	$("#schmedicine").click(function(){
		var searchMedicine = $("#searchMedicine").val();
		console.log("searchMedicine :" + searchMedicine);
		getMedicineList(searchMedicine);
		$("searchMedicine").val("");
	});  
	

	 //약품리스트 뿌려줌
	 function getMedicineList(){
		 $.ajax({
				url : 'ajax/getMedineList',
				type : 'GET',
				//contentType:'application/json;charset=utf-8',
				dataType : 'json',
				data : {
					
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : getMedineListResult
			});
	 }
	 
	 function getMedineListResult(data){
		 $("#schMedicineTd").empty();
			$.each(data, function(idx, item) {
				$("<tr>").append($('<td>').html(item.MEDI_NO))
						 .append($('<td>').html(item.MEDI_NAME))
						 .appendTo($('#schMedicineTd'));
			});
	 }
	 
	 //약품 이동
	 function getMediChg(){
		 $("body").on("click", "#schMedicineTd tr", function() {
				var tdArr = new Array();
				var td = $(this).children();

				td.each(function(i) {
					tdArr.push(td.eq(i).text());
				});

				console.log("1 : " + td.eq(0).text());
				console.log("2 : " + td.eq(1).text());

				$("<tr>").append($('<td>').html(td.eq(1).text()))
				 .append($('<td> <input name="presAccount" id="presAccount" style="width:50px;"></td>'))
				 .append($('<td> <input name="presccount" id="presccount" style="width:50px;"></td>'))
				 .append($('<td> <input name="presTotal" id="presTotal" style="width:50px;"></td>'))
				 .append($('<td> <button type="button" id="deleteMediTR" style="width:50px;">X</button></td>'))
				 .appendTo($('#insertMedicine'));
			});
	 }
	 
	 
 	//질병뿌려줌
	 function getDisease(searchDisease){
		 console.log(searchDisease);
			$.ajax({
				url : 'ajax/getDisease',
				type : 'GET',
				//contentType:'application/json;charset=utf-8',
				dataType : 'json',
				data : {
					searchDisease : searchDisease
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : getDiseaseResult
			});
	 }
	 
	 function getDiseaseResult(data){
		 console.log("searchDisease :" + searchDisease);
			$("<tr>").append($('<td>').html(data.DIS_CODE))
					 .append($('<td>').html(data.DIS_NAME))
					 .append($('<td>').html(data.DIS_DESC))
					 .append($('<td> <button type="button" id="deleteDiseTR" style="width:50px;">X</button></td>'))
					 .appendTo("#InsertDisease");
	 }
	 
	//진료 기록 상세
	function getDiagDetail() {
		$("body").on(
				"click",
				"#HistoryList tr",
				function() {
					var tdArr = new Array();
					var td = $(this).children();

					td.each(function(i) {
						tdArr.push(td.eq(i).text());
					});

					console.log("진료번호 : " + td.eq(0).text());

					//진료일
					$.ajax({
						url : 'ajax/Alldiag',
						data : {
							diag_no : td.eq(0).text()
						},
						dataType : 'json',
						error : function(xhr, status, msg) {
							alert("상태값 :" + status + " Http에러메시지 :" + msg);
						},
						success :function(result){
							getDiagDetailResult(result.diag1);
							getDiagDetailResult3(result.diag1);
							getMedicineResult(result.medicine);
							getDiagDetailResult2(result.diag2);
							
						} 
					});
				});
	}
	 //진료일 펑션
	function getDiagDetailResult(data) {
		$("#diagDetail").empty();

		$("<tr>").append($("<td>").html(data.diag_time))
				.appendTo('#diagDetail');

	}
	 //병 펑션
	function getDiagDetailResult2(data) {
		$("#diagDetail2").empty();
		$.each(data, function(idx, item) {
			$("<tr>").append($('<td>').html(item.DIS_NAME))
					.appendTo('#diagDetail2');
		});

	}
	 
	//의사 소견 펑션
	function getDiagDetailResult3(data) {

		console.log(data);
		console.log(data.diaglist_memo);
		$('#diagDetail3').empty();
		$('<tr>').append($('<td>').html(data.diaglist_memo)).appendTo(
				'#diagDetail3');
		console.log(data.diag_no);

	}
	//약 펑션
	function getMedicineResult(data) {
		$("#getMedicine").empty();
		 $.each(data, function(idx,item) {
			 var d = data[idx];
			 console.log(item.MEDI_NAME);
			$("<tr>").append($('<td>').html(item.MEDI_NAME)).append(
					$('<td>').html(item.PRES_COUNT)).append(
					$('<td>').html(item.PRES_ACCOUNT)).append(
					$('<td>').html(item.PRES_TOTAL)).appendTo('#getMedicine');		
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
			var date = item.RESV_DATETIME.substring(0, 10);
			var d = new Date();
			var today = d.getFullYear() + '-' + (d.getMonth() + 1) + '-'
					+ d.getDate();

			$('<tr>').append(
					$('<td id="resvNo" value="'+item.RESV_NO+'">').html(
							item.RESV_NO)).append(
					$('<td>').html(item.RESV_DATETIME)).append(
					$('<td>').html(item.BABY_NAME)).append(
					$('<td id="regno'+idx+'">').html(item.BABY_REGNO1)).append(
					$('<td style="display:none;">').html(item.BABY_NO))
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
			lengthChange : false,
			// 검색 기능 숨기기
			searching : false,
			// 정렬 기능 숨기기
			ordering : false,
			// 정보 표시 숨기기
			info : false,
			scrollY : 200,
			language : lang_kor
		});
	}
	// 진료/예약 이력 목록 클릭 시 특이사항 출력
	function resvUniq() {
		$("body").on("click", "#HistoryList tr", function() {
			var tdArr = new Array();
			var td = $(this).children();

			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});

			console.log("진료번호 : " + td.eq(0).text());
			console.log("예약번호 : " + td.eq(2).text());

			$.ajax({
				url : 'ajax/MemoInfo',
				data : {
					resv_no : td.eq(2).text()
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

	// 환자목록 클릭 시 진료기록 목록 출력
	function resvHstList() {
		$("body").on("click", "#waitList tr", function() {

			var tdArr = new Array();
			var td = $(this).children();

			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});

			console.log("아기번호 : " + td.eq(4).text());

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
			$("<tr>")
					.append($('<td style="display:none;">').html(item.diag_no))
					.append($("<td>").html(item.diag_time)).append(
							$('<td style="display:none;">').html(item.resv_no))
					.appendTo('#HistoryList');
			console.log(item.diag_no);
		});
	}

	function InfoResult(data) {
		$("#Info").empty();
		//var regno2 = data.BABY_REGNO2;
		$("#Info").append($('<p>').html('NO : ' + data.BABY_NO)).append(
				$('<p>').html(
						'이름 : ' + data.BABY_NAME + " (" + data.BABY_BLOOD
								+ "형, " + data.BABY_GENDER + ")")).append(
				$('<p>').html(
						'주민번호 : ' + data.BABY_REGNO1 + '-' + data.BABY_REGNO2))
				.append($('<hr>')).append(
						$('<p>').html('보호자명 : ' + data.PARENT_NAME)).append(
						$('<p>').html('연락처 : ' + data.PARENT_TEL)).append(
						$('<p>').html(
								'주소 : ' + data.PARENT_ADDR + ' '
										+ data.PARENT_ADDRDETAIL + ' '
										+ data.PARENT_POST))
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
								<span class="tit" style="font-weight: 600;">환자리스트</span>
							</div>
						</div>
						<div id="content">
							<table class="table text-center" id="waitList_table">
								<thead>
									<tr id="nbda">
										<th class="text-center">NO</th>
										<th class="text-center">일시</th>
										<th class="text-center" style="width: 80%;">성명</th>
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
			<div class="col-xl-3 col-md-6 mb-4">

				<!-- 환자 기록 -->
				<div class="card shadow py-2" style="height: 840px;">
					<div class="card-body">

						<!-- 진료 기록 -->
						<div style="height: 340px; overflow: auto;">
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-file-medical"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">진료 기록</span>
							</div>
							<table id="noborder_table">
								<thead>
									<tr id="nbab">
										<br />
										<th>일시</th>
									</tr>
								</thead>
								<tbody id="HistoryList"></tbody>
							</table>
						</div>

						<!-- 진료 기록 상세 -->
						<div style="height: 500px; overflow: auto;">
							<!-- logo -->
							<div class="title_logo">
								<i class="far fa-clipboard"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">진료 기록 상세</span>
							</div>

							<div class="card-body">

								<div style="height: 70px;">
									<table id="noborder_table">
										<thead>
											<tr id="nbab">
												<th>진료일</th>
											</tr>
										</thead>
										<tbody id="diagDetail" style="overflow: auto; width: 100%;"></tbody>
									</table>
								</div>

								<div style="height: 70px;">
									<table id="noborder_table">
										<thead>
											<tr id="nbab">
												<th>의사 소견</th>
											</tr>
										</thead>
										<tbody id="diagDetail3" style="overflow: auto; width: 100%;"></tbody>
									</table>
								</div>

								<div style="height: 70px;">
									<table id="noborder_table">
										<thead>
											<tr id="nbab">
												<th>상병</th>
											</tr>
										</thead>
										<tbody id="diagDetail2" style="overflow: auto; width: 100%;"></tbody>
									</table>
								</div>

								<div style="height: 70px;">
									<table id="noborder_table">
										<thead>
											<tr id="nbab">
												<th>처방</th>
											</tr>
											<tr>
												<th class="text-center">처방명</th>
												<th class="text-center">용량</th>
												<th class="text-center">일투</th>
												<th class="text-center">일수</th>
											</tr>
										</thead>
										<tbody id="getMedicine" style="overflow: auto; width: 100%;"></tbody>
									</table>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>



			<!-- 진료 3 -->
			<div class="col-xl-3 col-md-6 mb-4">

				<!-- 외래기록 -->
				<div class="card shadow py-2" style="height: 840px;">

					<div class="card-body" style="height: 200px;">
						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-stethoscope"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">상병</span>

								<div>
									<div
										style="margin: 0 0 10px 0 !important; width: 90%; float: left;">
										<form>
											<div class="input-group">
												<input type="text" class="form-control border-0 small"
													name="searchDisease" id="searchDisease" placeholder="질병명"
													aria-label="Search" aria-describedby="basic-addon2">
												<div class="input-group-append">
													<button class="btn btn-primary" type="button"
														id="schdisease">
														<i class="fas fa-search fa-sm"></i>
													</button>
												</div>
											</div>
										</form>
									</div>
									<div style="float: right; height: 50px">
										<button>+</button>
									</div>
								</div>

							</div>
						</div>
						<div style="overflow: auto; width: 100%; height: 300px;">
							<table>
								<thead>
									<tr>
										<th style="width: 200px;">코드</th>
										<th style="width: 400px;">상병명</th>
										<th style="width: 500px;">상병상세</th>
										<th style="width: 150px;">삭제</th>
									</tr>
								</thead>
								<tbody id="InsertDisease" style="overflow: auto; width: 100%;"></tbody>
							</table>
						</div>
					</div>

					<div class="card-body" style="height: 200px;">
						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-pencil-alt"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">의사 소견</span>
							</div>
						</div>

						<!--소견내용  -->
						<div>
							<textarea class="cont" id="patient_records" name="records"
								style="width: 100%; height: 300px;">
							</textarea>
						</div>
					</div>

				</div>
			</div>
		
		<!-- 진료 4 -->
			<div class="col-xl-3 col-md-6 mb-4">
			<!-- 처방 -->
				<div class="card shadow py-2" style="height: 840px;">
					
				<div style="height: 100px; padding: 20px;">
					
					<!-- Title -->
					<div class="title_logo">
						<!-- logo -->
						<i class="fas fa-capsules"></i>
						<!-- content -->
						<span class="tit" style="font-weight: 600;">약품</span>
					</div>

					<!-- 검색버튼 -->
					<div style="margin: 0 0 10px 0 !important; width: 90%;">
						<form>
							<div class="input-group">
								<input type="text" class="form-control border-0 small"
									name="searchMedicine" id="searchMedicine" placeholder="약품검색"
									aria-label="Search" aria-describedby="basic-addon2">
								<div class="input-group-append">
									<button class="btn btn-primary" type="button" id="schmedicine">
										<i class="fas fa-search fa-sm"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
					
				</div>
				
				
					<!-- 약품리스트 -->
					<div class="card-body"
						style="overflow: auto; width: 100%; height: 200px;">
						<div>
							<table>
								<thead>
									<tr>
										<th style="width: 400px;">약품코드</th>
										<th style="width: 400px;">약품명</th>
									</tr>
								</thead>
								<tbody id="schMedicineTd"></tbody>
							</table>
						</div>
					</div>
				
					
					<!-- 처방내용  -->
					<div class="card-body" style="height: 400px;">
						<div>
						<!-- logo -->
							<i class="fas fa-capsules"></i>
							<!-- content -->
							<span class="tit" style="font-weight: 600;">처방전</span>
						</div>
						
						<!-- 처방전작성 -->
						<div style="overflow: auto; height: 350px;">
							<table>
								<thead>
									<tr>
										<th style="width: 400px;">약품명</th>
										<th style="width: 200px;">용량</th>
										<th style="width: 200px;">일수</th>
										<th style="width: 200px;">일투</th>
										<th style="width: 200px;">삭제</th>
									</tr>
								</thead>
								<tbody id="insertMedicine"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>