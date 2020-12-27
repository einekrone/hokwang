<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/resources/css/resvcss.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style type="text/css">
.table th {
	padding: 10px !important;
}

.ui-tabs .ui-tabs-panel {
	padding: 0 !important;
}
</style>
</head>
<script type="text/javascript">

	$(function() {
		var searchType = "";
		var keyword = "";
		
		resvList(searchType, keyword);	// 전체 예약 환자
		resvHstList();	// 환자 이력
		resvUniq();		// 특이사항
		
		$('.tgl-flat').change(function() {
			searchType = "chkType";
			// 전체 예약 환자
			if ($('.rsvTg').is(":checked")) {
				keyword = "today";
			} else {
				// 수납 대기
				if ($('.priceTg').is(":checked")) {
					keyword = "today2";
				} else {
					keyword = "all";
				}
			}
			
			console.log(">> " + keyword);
			resvList(searchType, keyword);
		});

		$("body").on("change", "#officeSel", function(){
			console.log("change : "+$("#officeSel option:selected").val());
		});
	});
	
	function resvList(searchType, keyword) {
		$.ajax({
			url : 'ajax/resvList',
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
			success : resvListResult
		});
	}
	
	function resvListResult(data) {
		$("#resvList").empty();
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
		    .appendTo('#resvList');
			
			if(date == today) {
				$("#regno"+idx+"").eq(-1).after('<td id="room" onclick="event.cancelBubble=true"><select name="officeSel" id="officeSel"><option value="">---</option><option value="1">1</option><option value="2">2</option><option value="3">3</option></select></td>')
			} else {
				if(typeof item.RESV_ROOM == 'undefined') {
					$("#regno"+idx+"").eq(-1).after('<td id="room"></td>')
				} else {
					$("#regno"+idx+"").eq(-1).after('<td id="room">'+item.RESV_ROOM+'</td>')
				}
			}
		});
	}
	
	// 진료/예약 이력 목록 클릭 시 특이사항 출력
	function resvUniq() {
		$("body").on("click", "#resvHstList tr", function() {
			var tdArr = new Array();
			var td = $(this).children();
			
			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});
			
			console.log("예약번호 : "+td.eq(0).text());
			
			$.ajax({
				url : 'ajax/uniqInfo',
				data : {
					resv_no : td.eq(0).text()
				},
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : resvUniqResult
			});
		});
	}
	
	function resvUniqResult(data) {
		console.log("resvUniqResult");
		$("#resvDetail").empty();
		$("#resvDetail").append(data.RESV_MEMO);
	}
	
	// 환자목록 클릭 시 진료/예약 이력 목록 출력
	function resvHstList() {
		$("body").on("click", "#resvList tr", function(){
			//$(this).children().css("backgroundColor", "lightcoral");
			var tdArr = new Array();
			var td = $(this).children();
			
			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});
			
			console.log("아기번호 : "+td.eq(5).text());
			
			$.ajax({
				url : 'ajax/resvHstList',
				data : {
					baby_no : td.eq(5).text()
				},
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : resvHstListResult
			});
			
			$.ajax({
				url : 'ajax/ptInfo',
				data : {
					baby_no : td.eq(5).text()
				},
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : ptInfoResult
			});
		});
	}
	
	function resvHstListResult(data) {
		$("#resvHstList").empty();
		$.each(data, function(idx, item) {
			console.log("ph> "+item.DIAG_PHOTO);
			$('<tr>')
			.append($('<td>').html(item.RESV_NO))
			.append($('<td>').html(item.RESV_DATE))
			.append($('<td>').html(item.RESV_DETAIL))
			.append($('<td>').html('<button>사진</button>'))
			.append($('<td style="display:none;">').html(item.BABY_NO))
		    .appendTo('#resvHstList');
		});
	}
	
	function RPAD(str, padStr, padLen) {
		str = str.toString().substr(1,1);
	    while (padLen>1){
	        str += padStr;
	        padLen--;
	    }
	    return str;
	}
	
	function ptInfoResult(data) {
		$("#ptInfo").empty();
		var regno2 = data.BABY_REGNO2;
		regno2 = RPAD(regno2, '*', 7);
		$("#ptInfo")
		.append($('<p>').html('이름 : ' + data.BABY_NAME+" ("+data.BABY_BLOOD+"형, "+data.BABY_GENDER+")"))
		.append($('<p>').html('주민번호 : ' + data.BABY_REGNO1+'-'+regno2))
		.append($('<p>').html('방문 여부 : ' + data.BABY_VISIT))
		.append($('<hr>'))
		.append($('<p>').html('보호자명 : ' + data.PARENT_NAME))
		.append($('<p>').html('연락처 : ' + data.PARENT_TEL))
		.append($('<p>').html('주소 : ' + data.PARENT_ADDR+' '+data.PARENT_ADDRDETAIL+' '+data.PARENT_POST))
	}
</script>
<body>
	<div class="container-fluid"
		style="margin-top: 10px !important; padding: 0 !important; height: 100%;">
		<!-- Content Row -->
		<div class="row">

			<!-- 1번 -->
			<div class="col-xl-3 col-md-6 mb-4">
				<form style="margin: 0 0 10px 0 !important; width: 100%;"
					class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control border-0 small"
							id="searchPati" placeholder="예약환자명" aria-label="Search"
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
						<p class="text-s font-weight-bold text-success">환자정보</p>
						<div style="width: 100%; height: 160px; overflow: auto;" id="ptInfo"></div>
					</div>
				</div>
				<div class="card shadow py-2" style="height: 150px; margin: 10px 0;">
					<div class="card-body">
						<p class="text-s font-weight-bold text-danger"
							style="margin-bottom: 3px !important;">특이사항</p>
						<div style="overflow: auto; width: 100%; height: 85px;" id="resvDetail">특이사항
							내용 여기는 DIV 스타일에 overflow: scroll; 속성을 주었다. 내용의 양에 관계없이 항상 스크롤바가
							표시된다. ====> 이 글은 예를 보이기 위한 것이므로 읽을 필요가 없다. 여기는 DIV 스타일에 overflow:
							scroll; 속성을 주었다.</div>
					</div>
				</div>
				<div class="card shadow py-2" style="height: 330px;">
					<div class="card-body">
						<p class="text-s font-weight-bold text-success">진료/예약 이력</p>
						<table class="table text-center">
							<thead>
								<tr>
									<th class="text-center">No</th>
									<th class="text-center">일시</th>
									<th class="text-center">설명</th>
									<th class="text-center">사진</th>
								</tr>
							</thead>
							<tbody id="resvHstList"></tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- 2번 -->
			<div class="col-xl-4 col-md-6 mb-4 column">
				<div class="card shadow py-2" style="height: 800px;">
					<div class="card-body">
						<div class="text-s font-weight-bold" style="margin-bottom: 20px;">
							<span class="text-primary">전체 예약 환자</span> <span
								class="mb-0 font-weight-bold"
								style="float: right; margin: 4px 0 0 5px;">당일만</span> <span
								style="float: right;"> <input class="tgl tgl-flat rsvTg"
								id="cb1" type="checkbox" /> <label class="tgl-btn" for="cb1"></label>
							</span>
							<table class="table text-center">
								<thead>
									<tr>
										<th class="text-center" style="min-width: 50px;">예약번호</th>
										<th class="text-center">일시</th>
										<th class="text-center">성명</th>
										<th class="text-center">생년월일</th>
										<th class="text-center">진료실</th>
									</tr>
								</thead>
								<tbody id="resvList"></tbody>
							</table>
						</div>

						<!-- 여기에 예약 환자 목록 -->
					</div>
				</div>
			</div>

			<!-- 3번 -->
			<div class="col-xl-2 col-md-6 mb-4">
				<div class="card shadow py-2" style="height: 260px;">
					<div class="card-body">
						<p class="text-s font-weight-bold">진료실 1</p>
						<table class="table text-center">
							<thead>
								<tr>
									<th class="text-center">No</th>
									<th class="text-center">일시</th>
									<th class="text-center">성명</th>
								</tr>
							</thead>
							<tbody id="listCont"></tbody>
						</table>
					</div>
				</div>
				<div class="card shadow py-2" style="height: 260px; margin: 10px 0;">
					<div class="card-body">
						<p class="text-s font-weight-bold">진료실 2</p>
						<table class="table text-center">
							<thead>
								<tr>
									<th class="text-center">No</th>
									<th class="text-center">일시</th>
									<th class="text-center">성명</th>
								</tr>
							</thead>
							<tbody id="listCont"></tbody>
						</table>
					</div>
				</div>
				<div class="card shadow py-2" style="height: 260px;">
					<div class="card-body">
						<p class="text-s font-weight-bold">진료실 3</p>
						<table class="table text-center">
							<thead>
								<tr>
									<th class="text-center">No</th>
									<th class="text-center">일시</th>
									<th class="text-center">성명</th>
								</tr>
							</thead>
							<tbody id="listCont"></tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- 4번 -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card shadow py-2" style="height: 395px;">
					<div class="card-body">
						<div style="height: 40px;">
							<span class="text-s font-weight-bold text-danger">미수납 / 수납
								대기</span> <span class="mb-0 font-weight-bold"
								style="float: right; margin: 4px 0 0 5px;">당일만</span> <span
								style="float: right;"> <input
								class="tgl tgl-flat priceTg" id="cb4" type="checkbox" /> <label
								class="tgl-btn" for="cb4"></label>
							</span>
						</div>
						<div style="overflow: auto;">
							<table class="table text-center">
								<thead>
									<tr>
										<th class="text-center" style="width: 40px;">No</th>
										<th class="text-center">일시</th>
										<th class="text-center">성명</th>
										<th class="text-center">금액</th>
										<th class="text-center">상태</th>
									</tr>
								</thead>
								<tbody id="listCont"></tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="card shadow py-2" style="height: 395px; margin: 10px 0;">
					<div class="card-body">
						<p class="text-s font-weight-bold text-info">수납 완료</p>
						<div style="overflow: auto;">
							<table class="table text-center">
								<thead>
									<tr>
										<th class="text-center" style="width: 40px;">No</th>
										<th class="text-center">성명</th>
										<th class="text-center">금액</th>
										<th class="text-center">결제일</th>
									</tr>
								</thead>
								<tbody id="listCont"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>