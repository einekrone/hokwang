<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOHO</title>
<meta name="description"
	content="Responsive Admin &amp; 홈 Template based on Bootstrap 5">
<meta name="author" content="호광 병원">
<meta name="keywords"
	content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/icons/icon-48x48.png" />

<title>호광 병원 Demo - Bootstrap 5 Admin Template</title>

<link href="${pageContext.request.contextPath}/resources/css/mobile.css"
	rel="stylesheet">

<script src="https://maps.googleapis.com/maps/api/js?sensor=true"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">

<script src="./resources/json.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
<%-- <script
	src="${pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script> --%>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
.card-header-pills {
	margin-right: auto;
	margin-left: auto;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current {
	background: #ededed;
	color: #222;
}

.tab-content.current {
	display: inherit;
}
</style>
<script type="text/javascript">
	$(function() {
		//checkuphist();
		reserlist();
		aa();
		chgBaby();
		babyList();
		
		$('ul.tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		})
	});
</script>
<script type="text/javascript">
	
</script>
<script type="text/javascript">
	function reserlist() {
		var checkuplist = [];
		var reserlist = [];
		console.log("예약리스트");
		
		//console.log("td 번호 : "+td);
		$.ajax({
			url : "ajax/reserlist",
			type : "GET",
			dataType : "JSON",
			data : {
				list : reserlist
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				reserlistResult(data)
				console.log(data);
			}
		//만들어야함
		});/* end of ajax */
	}/* end of function */
	function aa() {
		console.log("문진표 클릭/////////////////");
		
		$('#reser2').on("click", "#que", function()  { 
			var modal = $('#question');
			var resvNo =  $(event.target).parent().siblings("#aa").text();
			console.log(resvNo);
			$.ajax({
				url : "ajax/question",
				type : "GET",
				dataType : "JSON",
				data : {
					qust_no : resvNo
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(data) {
					console.log(data);
					
					modal.find($('input[name=Ra1]')).val([data[0].a1]);
					modal.find($('input[name=Ra2]')).val([data[0].a2]);
					modal.find($('input[name=Ra3]')).val([data[0].a3]);
					modal.find($('input[name=Ra4]')).val([data[0].a4]);
					//modal.modal('show');
				}
			});
		});

	}
	function reserlistResult(data) {
		$("#reser2").empty();
		$.each(data,function(idx, item) {
							$("<tr id='a2'>")	
							.append($("<td>").attr("id",'resv_date').attr('value',item.resv_date).html(item.resv_date))
							.append($("<td>").attr("id",'').append($("<input type='button' id='que' style='width:70px;height:50px;' value='문진표' data-toggle='modal' data-target='#question' data-backdrop='static'>")))
							.append($("<td>").attr("id",'').append($("<input type='button' id='modi' style='width:85px;height:50px;' value='수정/취소' data-toggle='modal'  data-target='#modifyAndCancel' data-backdrop='static'>")))
							.append($("<td style='display:none;'>").attr("id",'aa').attr('value',item.resv_no).html(item.resv_no))
							.appendTo('#reser2');
						})
	}

	function checkuphist() {//접종 리스트
		var checkuplist = [];

		console.log("DDD");
		$.ajax({
			url : "ajax/checkhist",
			type : "GET",
			dataType : "JSON",
			data : {
				list : checkuplist
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : checkuphistResult

		});/* end of ajax */

	}/* end of function */

	function checkuphistResult(data) {
		var text = "";

		$("#checkup").empty();
		$.each(data, function(idx, item) {

			$("<tr>").append(
					$("<td id='chk_name' value= '"+item.CHK_NAME+"'>").html(
							item.CHK_NAME)).append(
					$("<td id='hist_cnt'>").html(
							item.HIST_COUNT + " 회" + " / " + item.CHK_TOTAL
									+ " 회")).appendTo('#checkup');

			if (item.HIST_STATE == "I") {
				console.log(">> " + item.HIST_STATE);
				text = "접종 중";
				$("#hist_cnt").eq(-1).after(
						'<td id="hist_state">' + text + '</td>');
			} else if (item.HIST_STATE == "N") {
				console.log(">> " + item.HIST_STATE);
				text = "미접종";
				$("#hist_cnt").eq(-1).after(
						'<td id="hist_state">' + text + '</td>');
			} else if (item.HIST_STATE == "Y") {
				console.log(">> " + item.HIST_STATE);
				text = "접종 완료";
				$("#hist_cnt").eq(-1).after(
						'<td id="hist_state">' + text + '</td>');
			}

		})/* end of ajax  */
	}
	
	
	function babyList() {
		
		$.ajax({
			url : 'ajax/getBabyInfo',
			type : 'GET',
			data : { 
				parent_no:"${parent_vo.parent_no}"
				
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				$.each(data, function(idx, item) {
							$('<option>').attr("value", item.baby_no).html(
									item.baby_name);
				});
			}
		});
	}
	
	
	function chgBaby(){
		var babyNo = $("#baby-name option:selected").val();
		console.log(babyNo);
		$.ajax({
			url:'ajax/getBabyInfo',
			type:'GET',
			data :{
				baby_no:babyNo
			},
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data){
				$.each(data, function(idx, item) {
					$("#babyInfo").empty();
					$("#babyInfo").append(
							$('<p>').html(
									'이름 : ' + item.baby_name + " ("
											+ item.baby_blood + "형, "
											+ item.baby_gender + ")")).append(
							$('<p>').html(
									'주민번호 : ' + item.baby_regno1 + '-'
											+ item.baby_regno2)).append(
							$('<p>').html('방문 여부 : ' + item.baby_visit));

					$("#babyImg").attr(
							"src",
							"${pageContext.request.contextPath}/resources/img/"
									+ item.baby_pic);
				});
			}
		})
	}
</script>
</head>
<body>
	<!-- 1 -->
	<div class="row">
		<div class="col-5 col-lg-8 col-xxl-9 d-flex">
			<div class="card flex-fill">
				<div class="form-group">
					<select class="form-control" name="baby_name" id="baby-name" onchange="chgBaby()">
						<option value="" selected>==자녀선택==</option>
					</select>
				</div>
				<div style="align-self: center;">
					<img id="babyImg" class="img-fluid rounded-circle mb-2"
						width="120" height="120" />
				</div>
				<input type="button" class="card-title mb-0" value="예약하기">
			</div>
		</div>
		<div class="col-7 col-lg-8 col-xxl-9 d-flex">
			<div class="card flex-fill">
				<div id="babyInfo">
				</div>
			</div>
		</div>
	</div>
	<!-- 2 -->
	<div class="row">
		<div class="col-15 col-lg-8 col-xxl-7 d-flex">
			<div class="card flex-fill">
				<!-- Tab을 구성할 영역 설정-->
				<div class="card">
					<div class="card-header"
						style="padding-top: 5px; padding-right: 5px; padding-bottom: 5px; padding-left: 15px;">
						<ul class="nav nav-pills card-header-pills pull-right"
							style="float: left" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tab-4">예약/진료</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tab-5">접종</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tab-6">성장</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tab-7">체온</a></li>
						</ul>
					</div>
					<div class="card-body">
						<div class="tab-content" style="height: 310px">
							<div class="tab-pane fade active show" id="tab-4" role="tabpanel">

								<div class="card">
									<ul class="nav nav-pills card-header-pills pull-right">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#tab-8">전체</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#tab-9">결제완료</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#tab-10">미결제</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#tab-11">예약</a></li>
									</ul>
								</div>
								<!-- 예약/진료 => 전체탭  -->
								<div class="tab-content">
									<div class="tab-pane fade active show" id="tab-8"
										role="tabpanel">
										<div style="height: 100px; overflow: auto;">
											<table class="table text-center">
												<thead>
													<tr>
														<th class="text-center">예약일시1</th>
														<th class="text-center">병명</th>
														<th class="text-center">문진표</th>
													</tr>
												</thead>
												<tbody id="#"></tbody>
											</table>
										</div>
										<br>
										<table class="table text-center">
											<thead>
												<tr>
													<th class="text-center">예약일시</th>
													<th class="text-center">병명</th>
													<th class="text-center">문진표</th>
												</tr>
											</thead>
											<tbody id="#"></tbody>
										</table>
									</div>

									<!-- 예약/진료 => 결제완료탭  -->
									<div class="tab-pane fade" id="tab-9" role="tabpanel">
										<table class="table text-center">
											<thead>
												<tr>
													<th class="text-center">진료일시</th>
													<th class="text-center">병명</th>
													<th class="text-center">결제여부</th>
												</tr>
											</thead>
											<tbody id="#"></tbody>
										</table>
									</div>

									<!-- 예약/진료 => 미결제탭  -->
									<div class="tab-pane fade" id="tab-10" role="tabpanel">

										<table class="table text-center">
											<thead>
												<tr>
													<th class="text-center">예약일시3</th>
													<th class="text-center">문진표</th>
													<th class="text-center">결제 여부</th>
												</tr>
											</thead>
											<tbody id="#"></tbody>
										</table>

										<table class="table text-center">
											<thead>
												<tr>
													<th class="text-center">진료일시</th>
													<th class="text-center">병명</th>
												</tr>
											</thead>
											<tbody id="#"></tbody>
										</table>
									</div>

									<!-- 예약/진료 => 예약탭  -->
									<div class="tab-pane fade" id="tab-11" role="tabpanel">
										<div style="height: 250px; overflow: auto;">
											<table class="table text-center">
												<thead>
													<tr>
														<th class="text-center">예약일시</th>
														<th class="text-center">문진표</th>
														<th class="text-center">수정/취소</th>
													</tr>
												</thead>
												<tbody id="reser2"></tbody>
											</table>
										</div>
										<!-- 	<table class="table text-center">
											<thead>
												<tr>
													<th class="text-center">예약일시</th>
													<th class="text-center">병명</th>
													<th class="text-center">문진표</th>
												</tr>
											</thead>
											<tbody id="#"></tbody>
										</table> -->
									</div>
									<!-- 예약 end -->

								</div>


							</div>
							<!-- 2 시작-->
							<!-- 2 -->
							<div class="tab-pane fade" id="tab-5" role="tabpanel">
								<div class="card">
									<ul class="nav nav-pills card-header-pills pull-right"
										role="tablist">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#tab-1" style="margin-left: -4rem">전체</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#tab-2">미검진</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#tab-3">검진완료</a></li>

									</ul>
								</div>
								<div>
									<div class="tab-content">
										<div class="tab-pane fade active show" id="tab-1"
											role="tabpanel">
											<table class="table text-center">
												<thead>
													<tr>
														<th class="text-center">전체</th>
														<th class="text-center">차수</th>
														<th class="text-center">접종완료</th>
													</tr>
												</thead>
												<tbody id="checkup"></tbody>
											</table>
										</div>


										<div class="tab-pane fade text-center" id="tab-2"
											role="tabpanel">
											<table class="table text-center">
												<thead>
													<tr>
														<th class="text-center">전체</th>
														<th class="text-center">차수</th>
														<th class="text-center">접종완료</th>
													</tr>
												</thead>
												<tbody id="#"></tbody>
											</table>
										</div>

										<div class="tab-pane fade text-center" id="tab-3"
											role="tabpanel">
											<table class="table text-center">
												<thead>
													<tr>
														<th class="text-center">전체</th>
														<th class="text-center">차수</th>
														<th class="text-center">접종완료</th>
													</tr>
												</thead>
												<tbody id="#"></tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- 3 -->
							<div class="tab-pane fade" id="tab-6" role="tabpanel">

								<table class="table text-center">
									<thead>
										<tr>
											<th class="text-center">등록일시</th>
											<th class="text-center">키</th>
											<th class="text-center">몸무게</th>
										</tr>
									</thead>
									<tbody id="#"></tbody>
								</table>
							</div>
							<!-- 4 -->
							<div class="tab-pane fade" id="tab-7" role="tabpanel">
								<table class="table text-center">
									<thead>
										<tr>
											<th class="text-center">등록일시</th>
											<th class="text-center">체온</th>
											<th class="text-center">상태</th>
										</tr>
									</thead>
									<tbody id="#"></tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 문진표 모달 -->
	<div class="modal fade" id="question" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">문진표</h5>
				</div>
				<div class="modal-body">
					<table style="width: 100%; display: block;" border="1">
						<tr>
							<td style="width: 10%">1</td>
							<td>눈을 잘 맞추지 못하거나 눈동자가 흔들립니까?</td>
							<td style="width: 35%"><label class="form-check"> <input
									id="ra1" name="Ra1" type="radio" class="form-check-input"
									value="Y"> <span class="form-check-label">예</span>
							</label> <label class="form-check"> <input name="Ra1" id="ra1"
									type="radio" class="form-check-input" value="N"> <span
									class="form-check-label">아니오</span>
							</label></td>
						</tr>
						<tr>
							<td>2</td>
							<td>검은 눈동자(동공)가 혼탁합니까?</td>
							<td><label class="form-check"> <input name="Ra2"
									type="radio" class="form-check-input" value="Y"> <span
									class="form-check-label">예</span>
							</label> <label class="form-check"> <input name="Ra2"
									type="radio" class="form-check-input" value="N"> <span
									class="form-check-label">아니오</span>
							</label></td>
						</tr>
						<tr>
							<td>3</td>
							<td>정면(앞에 있는 사물)을 볼 때 늘 얼굴을 돌려 옆으로 쳐다보거나 고개를 기울이고 보는 편 입니까?</td>
							<td><label class="form-check"> <input name="Ra3"
									type="radio" class="form-check-input" value="Y"> <span
									class="form-check-label">예</span>
							</label> <label class="form-check"> <input name="Ra3"
									type="radio" class="form-check-input" value="N"> <span
									class="form-check-label">아니오</span>
							</label></td>
						</tr>
						<tr>
							<td>4</td>
							<td>책/TV/물건 등에 너무 가까이 다가가서 보거나 찡그리고 봅니까?</td>
							<td><label class="form-check"> <input name="Ra4"
									type="radio" class="form-check-input" value="Y"> <span
									class="form-check-label">예</span>
							</label> <label class="form-check"> <input name="Ra4"
									type="radio" class="form-check-input" value="N"> <span
									class="form-check-label">아니오</span>
							</label></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" type="button" data-dismiss="modal">확인
					</button>
				</div>
			</div>
		</div>
	</div>
		<!-- 수정/취소 모달 -->
	<div class="modal fade" id="modifyAndCancel" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">수정/취소</h5>
				</div>
				<div class="modal-body"><!-- 모달바디 시작 -->
					
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" type="button" data-dismiss="modal">확인
					</button>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" type="button" data-dismiss="modal">취소
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>