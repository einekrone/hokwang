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
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<style type="text/css">
.table th {
	padding: 10px !important;
}

.ui-tabs .ui-tabs-panel {
	padding: 0 !important;
}

button {
	border-radius: 5px;
	border: 0;
	outline: 0;
	padding: 10px;
}

.img1 {
	padding: 3px;
	width: 200px;
	height: 200px;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	width: 75px;
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox {
	float: left;
	padding-right: 600px;
}
</style>
</head>
<script type="text/javascript">
	$(function() {
		var imgsrc = "";
		var searchType = "";
		var keyword = "";

		resvList(searchType, keyword); // 전체 예약 환자
		resvHstList(); // 환자 이력
		resvUniq(); // 특이사항

		nonPayList(searchType, keyword); // 미수납/수납대기 목록

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

		// todo: 진료실 onchange
		$("body").on("change", "#officeSel", function() {
			console.log("change : " + $("#officeSel option:selected").val());
		});

		// 예약환자명 검색
		$("#searchPati").click(function() {
			var keyword = $("#keyword").val();
			resvList("resvSearch", keyword);
			$("#keyword").val("");
		});

		// 이미지 저장시 diag_no
		$("body").on("click", "#imgBtn", function() {
			var diagNo = $(this).data("num");
			imgForm.diag_no.value = diagNo;
			console.log("diagNo2 :: " + imgForm.diag_no.value);

			$.ajax({
				url : 'ajax/imgList',
				type : 'GET',
				dataType : 'json',
				data : {
					diag_no : imgForm.diag_no.value
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : imgListResult
			});
		});

		// 이미지 목록
		/* $("#imgPopup").on("show.bs.modal", function() {
			console.log("imgPopup open");
			console.log("diagNo?? :: "+imgForm.diag_no.value);
			// todo
			var tdArr = new Array();
			var td = $(this).children();
			console.log(">>this : " + $(this));
			console.log(">>td : " + td);

			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});

			console.log(">>1 : " + td.eq(0).text());
		}); */
	});

	function imgListResult(data) {
		console.log("imgListResult");
		$.each(data, function(idx, item) {
			console.log("?? "+item.IMG_ADDR);
			var img = document.createElement("img");
			img.setAttribute("src","${pageContext.request.contextPath}/resources/img/" + item.IMG_ADDR);
			img.className="img1";
			document.querySelector("#imgShow").appendChild(img);
		});
	}

	// 미수납/수납대기
	function nonPayList(searchType, keyword) {
		$.ajax({
			url : 'ajax/nonPayList',
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
			success : nonPayListResult
		});
	}

	function nonPayListResult(data) {
		$("#nonPayList").empty();
		$.each(data, function(idx, item) {
			$('<tr>').append(
					$('<td id="resvNo" value="'+item.PAY_NO+'">').html(
							item.RESV_NO))
					.append($('<td>').html(item.PAY_DATE)).append(
							$('<td>').html(item.BABY_NAME)).append(
							$('<td id="price'+idx+'">').html(item.PAY_PRICE))
					.append($('<td style="display:none;">').html(item.BABY_NO))
					.appendTo('#nonPayList');

			if (item.PAY_STATE == 'W') { // 수납대기(계좌이체)
				$("#price" + idx).eq(-1).after(
						'<td><button id="stBtn">승인</button></td>');
			} else if (item.PAY_STATE == 'N') { // 미수납
				$("#price" + idx).eq(-1).after('<td>미수납</td>');
			}
		});
	}

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
		$
				.each(
						data,
						function(idx, item) {
							var date = item.RESV_DATETIME.substring(0, 10);
							var d = new Date();
							var today = d.getFullYear() + '-'
									+ (d.getMonth() + 1) + '-' + d.getDate();

							$('<tr>')
									.append(
											$(
													'<td id="resvNo" value="'+item.RESV_NO+'">')
													.html(item.RESV_NO))
									.append($('<td>').html(item.RESV_DATETIME))
									.append($('<td>').html(item.BABY_NAME))
									.append(
											$('<td id="regno'+idx+'">').html(
													item.BABY_REGNO1)).append(
											$('<td style="display:none;">')
													.html(item.BABY_NO))
									.appendTo('#resvList');

							if (date == today) {
								$("#regno" + idx)
										.eq(-1)
										.after(
												'<td id="room" onclick="event.cancelBubble=true"><select name="officeSel" id="officeSel"><option value="">---</option><option value="1">1</option><option value="2">2</option><option value="3">3</option></select></td>')
							} else {
								if (typeof item.RESV_ROOM == 'undefined') {
									$("#regno" + idx).eq(-1).after(
											'<td id="room"></td>')
								} else {
									$("#regno" + idx).eq(-1).after(
											'<td id="room">' + item.RESV_ROOM
													+ '</td>')
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

			//console.log("예약번호 : " + td.eq(0).text());

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
		$("#resvDetail").empty();
		$("#resvDetail").append(data.RESV_MEMO);
	}

	// 환자목록 클릭 시 진료/예약 이력 목록 출력
	function resvHstList() {
		$("body").on("click", "#resvList tr", function() {
			//$(this).children().css("backgroundColor", "lightcoral");
			var tdArr = new Array();
			var td = $(this).children();

			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});

			//console.log("아기번호 : " + td.eq(5).text());

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
		$
				.each(
						data,
						function(idx, item) {
							var diagNo = "";
							if (typeof item.DIAG_NO != 'undefined') {
								diagNo = item.DIAG_NO;
								console.log("ph2> " + diagNo);
							}
							//console.log("ph> " + item.IMG_ADDR);
							imgsrc = item.IMG_ADDR; // todo: undefined 아닐 경우에만 담아야함..
							$('<tr>')
									.append($('<td>').html(item.RESV_NO))
									.append($('<td>').html(item.RESV_DATE))
									.append($('<td>').html(item.RESV_DETAIL))
									.append(
											$('<td>')
													.html(
															'<button id="imgBtn" type="button" data-toggle="modal" data-target="#imgPopup" data-num="'+diagNo+'">사진</button>'))
									.append(
											$('<td style="display:none;">')
													.html(item.BABY_NO))
									.appendTo('#resvHstList');

							// todo: 이미지 삽입은 이력 목록이 출력될때가 아니라 목록에 사진 버튼을 눌렀을때/이미지 팝업이 열렸을 때 삽입
							//src="${pageContext.request.contextPath}/resources/img/${imgsrc}"
							/* if (imgsrc != null || imgsrc != "") {
								var img = document.createElement("img");
								img.setAttribute("src","${pageContext.request.contextPath}/resources/img/" + imgsrc);
								img.className="img1";
								document.querySelector("#imgShow").appendChild(img);
							} */

							var d = new Date();
							var today = d.getFullYear() + '-'
									+ (d.getMonth() + 1) + '-' + d.getDate();
							/* if (item.RESV_DATE == today) {
								$("#imgDBtn").css("display", "none");
							} else {
								$("#imgInput").css("display", "none");
								$("#imgRBtn").css("display", "none");
							} */
						});
	}

	function RPAD(str, padStr, padLen) {
		str = str.toString().substr(1, 1);
		while (padLen > 1) {
			str += padStr;
			padLen--;
		}
		return str;
	}

	function ptInfoResult(data) {
		$("#ptInfo").empty();
		var regno2 = data.BABY_REGNO2;
		console.log("주민번호: "+regno2+"이름 : "+data.BABY_NAME);
		regno2 = RPAD(regno2, '*', 7);
		$("#ptInfo").append(
				$('<p>').html(
						'이름 : ' + data.BABY_NAME + " (" + data.BABY_BLOOD
								+ "형, " + data.BABY_GENDER + ")")).append(
				$('<p>').html('주민번호 : ' + data.BABY_REGNO1 + '-' + regno2))
				.append($('<p>').html('방문 여부 : ' + data.BABY_VISIT)).append(
						$('<hr>')).append(
						$('<p>').html('보호자명 : ' + data.PARENT_NAME)).append(
						$('<p>').html('연락처 : ' + data.PARENT_TEL)).append(
						$('<p>').html(
								'주소 : ' + data.PARENT_ADDR + ' '
										+ data.PARENT_ADDRDETAIL + ' '
										+ data.PARENT_POST))
	}

	function setImages(event) {
		var sel_files = [];
		var files = event.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f) {
			console.log(f.type);
			if (f.type.match('image/JPEG') || f.type.match('image/PNG')
					|| f.type.match('image/jpg')) {
				alert("파일확장자를 바꿔주세요.");
				return;
			}
			sel_files.push(f);

			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.createElement("img");
				img.setAttribute("src", event.target.result);
				img.className = "img1"
				document.querySelector("#imgShow").appendChild(img);
			};
			reader.readAsDataURL(f);
		});
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
							name="keyword" id="keyword" placeholder="예약환자명"
							aria-label="Search" aria-describedby="basic-addon2">
						<button id="imgBtn" type="button" data-toggle="modal"
							data-target="#imgPopup">사진</button>
						<div class="input-group-append">
							<button class="btn btn-primary" type="button" id="searchPati">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
				<div class="card shadow py-2" style="height: 250px;">
					<div class="card-body">
						<p class="text-s font-weight-bold text-success">환자정보</p>
						<div style="width: 100%; height: 160px; overflow: auto;"
							id="ptInfo"></div>
					</div>
				</div>
				<div class="card shadow py-2" style="height: 150px; margin: 10px 0;">
					<div class="card-body">
						<p class="text-s font-weight-bold text-danger"
							style="margin-bottom: 3px !important;">특이사항</p>
						<div style="overflow: auto; width: 100%; height: 85px;"
							id="resvDetail"></div>
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
						<div class="text-s" style="margin-bottom: 20px;">
							<span class="text-primary font-weight-bold">전체 예약 환자</span> <span
								class="mb-0 font-weight-bold"
								style="float: right; margin: 4px 0 0 5px;">당일만</span> <span
								style="float: right;"> <input class="tgl tgl-flat rsvTg"
								id="cb1" type="checkbox" /> <label class="tgl-btn" for="cb1"></label>
							</span>
							<table class="table text-center">
								<thead class="font-weight-bold text-center">
									<tr>
										<th>예약번호</th>
										<th>일시</th>
										<th>성명</th>
										<th style="width: 100px;">생년월일</th>
										<th style="width: 70px;">진료실</th>
									</tr>
								</thead>
								<tbody id="resvList"></tbody>
							</table>
						</div>
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
										<th class="text-center">예약번호</th>
										<th class="text-center">일시</th>
										<th class="text-center" style="width: 100px;">성명</th>
										<th class="text-center">금액</th>
										<th class="text-center">상태</th>
									</tr>
								</thead>
								<tbody id="nonPayList"></tbody>
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

	<div class="modal fade" id="imgPopup">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">진료 사진 관리</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ajax/imgManage" method="post"
						enctype="multipart/form-data" id="imgForm" name="imgForm">
						<input type="hidden" name="diag_no" value="">
						<div class="filebox">
							<label for="imgInput">업로드</label> <input type="file"
								id="imgInput" name="imgInput" multiple
								onchange="setImages(event);">
						</div>
						<!--  src="${pageContext.request.contextPath}/resources/img/&{imgsrc};" -->
						<div id="imgShow">
							<br>
						</div>
						<div class="modal-footer text-center"
							style="justify-content: center !important;">
							<button class="btn-primary" type="submit" style="margin: 0 25px;"
								id="imgRBtn">등록/수정</button>
							<button class="btn-danger" type="button" style="margin: 0 25px;"
								id="imgDBtn">삭제</button>
							<button type="button" style="margin: 0 25px;" id="imgCBtn"
								data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>