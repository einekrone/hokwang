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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style type="text/css">
#resvHstTable th:nth-of-type(1), #resvHstTable td:nth-of-type(1) { width: 134px; }
#resvHstTable th:nth-of-type(2), #resvHstTable td:nth-of-type(2) { width: 80px; }
#resvHstTable th:nth-of-type(3), #resvHstTable td:nth-of-type(3) { width: 166px; }
#resvHstTable th:nth-of-type(4), #resvHstTable td:nth-of-type(4) { width: 46px; }

#resvTable th:nth-of-type(1), #resvTable td:nth-of-type(2) { width: 161px; }
#resvTable th:nth-of-type(2), #resvTable td:nth-of-type(3) { width: 185px; }
#resvTable th:nth-of-type(3), #resvTable td:nth-of-type(4) { width: 93px; }
#resvTable th:nth-of-type(4), #resvTable td:nth-of-type(5) { width: 100px; }
#resvTable th:nth-of-type(5), #resvTable td:nth-of-type(6) { width: 70px; }

#nonPayTable th:nth-of-type(1), #nonPayTable td:nth-of-type(1) { width: 128px !important; }
#nonPayTable th:nth-of-type(2), #nonPayTable td:nth-of-type(2) { width: 92px !important; }
#nonPayTable th:nth-of-type(3), #nonPayTable td:nth-of-type(3) { width: 95px !important; }
#nonPayTable th:nth-of-type(4), #nonPayTable td:nth-of-type(4) { width: 67px !important; }
#nonPayTable th:nth-of-type(5), #nonPayTable td:nth-of-type(5) { width: 80px !important; }

.col-xl-3 {
	padding: 0 !important;
}

#nonPayTable th, #nonPayTable td {
	padding: 10px 0 !important;
}

i.material-icons {
	font-size: 1.5rem;
	color: white;
	position: relative;
	border-radius: 50%;
	padding: 10px;
	margin: 3px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	transition: color 0.2s ease, background-color 0.2s ease, transform 0.3s
		ease;
}

i.material-icons:after {
	content: "";
	width: 100%;
	height: 100%;
	border: solid 2px;
	transform: scale(0.8);
	position: absolute;
	top: -2px;
	left: -2px;
	border-radius: 50%;
	transition: all 0.3s ease;
}

i.material-icons:hover:after {
	transform: scale(1);
	box-shadow: 10px 0 20px rgba(0, 0, 0, 0.19), 6px 0 6px
		rgba(0, 0, 0, 0.23);
}

i.material-icons:nth-of-type(1) {
	background-color: #cd8484;
}

i.material-icons:nth-of-type(1):hover {
	color: #cd8484;
}

i.material-icons:nth-of-type(1):after {
	border-color: #cd8484;
}

i.material-icons:hover {
	background-color: transparent;
	transform: rotate(90deg);
	cursor: pointer;
	box-shadow: none;
}

.table td, .table th {
	padding: .5rem !important;
	vertical-align: middle;
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

#imgShow::-webkit-scrollbar {
	display: none;
}
</style>
</head>
<script type="text/javascript">
	$(function() {
		var imgsrc = "";
		var searchType = "";
		var keyword = "";
		var keyword2 = "";

		resvList("chkType", "today"); // 전체 예약 환자
		resvHstList(); // 환자 이력
		resvUniq(); // 특이사항
		imgSave(); // 이미지 등록
		imgDelete(); // 이미지 삭제
		roomList(); // 진료실 대기환자 목록
		nonPayList(searchType, keyword2); // 미수납/수납대기 목록

		$("#imgChk").change(function() {
			if ($(this).is(':checked')) {
				$("input[id='imgChk']").prop("checked", true);
			} else {
				$("input[id='imgChk']").prop("checked", false);
			}
		});

		$('.tgl-flat').change(function() {
			searchType = "chkType";
			// 전체 예약 환자
			if ($('.rsvTg').is(":checked")) {
				keyword = "all";
			} else {
				keyword = "today";
			}

			// 수납 대기
			if ($('.priceTg').is(":checked")) {
				keyword2 = "today2";
			} else {
				keyword2 = "all";
			}

			resvList(searchType, keyword);
			nonPayList(searchType, keyword2);
		});

		// 등록된 이미지 목록
		$("body").on("click", "#imgBtn", function() {
			var resvNo = $(this).data("num");
			$("#resv_no").val(resvNo);
			$("#imgShow").empty();
			imgList();
		});

		// 계좌 이체한 보호자 정보 + 이체 정보
		$("body").on("click", "#stBtn", function() {
			var payNo = $(this).data("no");
			document.getElementById('stRBtn2').setAttribute("data-no", payNo);
			$("#payInfo").empty();
			payInfo(payNo);
		});

		// 수납 대기 승인 -> 수납 완료
		$("body").on("click", "#stRBtn2", function() {
			var payNo = $(this).data("no");
			// 1. 수납 상태를 완료로 수정
			$.ajax({
				url : 'ajax/payUpdate',
				type : 'POST',
				data : {
					pay_no : payNo,
					baby_no : $("#nonBabyNo").val()
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(data) {
					// 2. 수납대기, 수납완료 목록 조회
					nonPayList(searchType, keyword);
					$(".modal-backdrop").hide();
				}
			});
		});
	});

	function SearchClick() {
		var keyword = $("#keyword").val();
		resvList("resvSearch", keyword);
		$("#keyword").val("");
	}

	// 진료실 이동
	function roomMove(resvNo) {
		var offSel = $("#officeSel" + resvNo + " option:selected").val();
		if (offSel != "-") {
			var tdArr = new Array();
			var td = $(this).parent().siblings();

			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});
			/* $('<tr>').append(
					$(
							'<td id="resvNo" value="'
									+ td.eq(0).text() + '">').html(
							td.eq(0).text())).append(
					$('<td>').html(td.eq(2).text())).appendTo(
					'#room' + offSel); */// todo 올바르게 됐는지 확인
			// 진료실 변경사항 db
			console.log("resvNo : " + resvNo);
			var roomBabyNo = $("#officeSel" + resvNo).parent().siblings().eq(0)
					.text();
			console.log("!!!!!!!!! " + roomBabyNo);
			$.ajax({
				url : 'ajax/roomUpdate',
				type : 'POST',
				data : {
					resv_no : resvNo,
					resv_room : offSel,
					baby_no : roomBabyNo
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(data) {
					// 2. 진료실 목록 조회
					$("#room1").empty();
					$("#room2").empty();
					$("#room3").empty();
					roomList();
				}
			});
		}
	}

	// 수납 정보 상세(계좌이체)
	function payInfo(payNo) {
		$.ajax({
			url : 'ajax/payInfo',
			type : 'GET',
			data : {
				pay_no : payNo
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : payInfoResult
		});
	}

	function payInfoResult(data) {
		$("#payInfo").empty();
		$("#payInfo")
				.append($('<p>').html('보호자 : ' + data.PARENT_NAME))
				.append($('<p>').html('환자 : ' + data.BABY_NAME))
				.append($('<hr>'))
				.append($('<h4>').html('[ 결제 정보 ]').css('font-weight', 'bold'))
				.append($('<p>').html('결제 금액 : ' + data.PAY_PRICE))
				.append($('<p>').html('결제일 : ' + data.PAY_DATEE))
				.append($('<p>').html('결제 수단 : 계좌이체'))
				.append($('<p>').html(data.PAY_BANK + "은행 " + data.PAY_ACCOUNT))
				.append($('<p style="display:none;">').html(data.PAY_NO));
	}

	function imgList() {
		if ($("#resv_no").val() != "") {
			$.ajax({
				url : 'ajax/imgList',
				type : 'GET',
				data : {
					resv_no : $("#resv_no").val()
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : imgListResult
			});
		}
	}

	function imgListResult(data) {
		$("#imgShow").empty();
		$.each(data, function(idx, item) {
			var img = document.createElement("img");
			img.setAttribute("src",
					"${pageContext.request.contextPath}/resources/img/"
							+ item.IMG_ADDR);
			img.className = "img1";
			img.setAttribute('style', 'margin:0 20px;');

			var check = document.createElement('input');
			check.setAttribute('type', 'checkbox');
			check.setAttribute('id', 'imgChk');
			check.setAttribute('value', item.IMG_NO);
			document.querySelector("#imgShow").appendChild(check);
			document.querySelector("#imgShow").appendChild(img);
		});
	}

	function imgSave() {
		$("#imgRBtn").on("click", function() {
			var formData = new FormData();
			var inputFile = $('input[name="imgInput"]');
			var files = inputFile[0].files;
			if (files.length > 0) {
				for (var i = 0; i < files.length; i++) {
					formData.append('imgInput', files[i]);
				}
				formData.append('resv_no', $("#resv_no").val());

				$.ajax({
					url : 'ajax/imgInsert',
					type : 'POST',
					processData : false,
					contentType : false,
					data : formData,
					error : function(xhr, status, msg) {
						alert("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(data) {
						$("#imgShow").empty();
						imgList();
						imgForm.reset();
					}
				});
			}
		});
	}

	function imgDelete() {
		$("#imgDBtn").on("click", function() {
			var chk = $('#imgForm input:checkbox').is(':checked');
			var chk2 = $('input:checkbox[id="imgChk"]').length;
			var chk3 = $('input:checkbox[id="imgChk"] :checked').length;

			var delArr = new Array();

			$('input[type="checkbox"]:checked').each(function(index) {
				delArr.push($(this).val());
			});
			//$('input:checkbox[id="imgChk"] :checked').each(function() { });
			if (chk) { // true
				$.ajax({
					url : 'ajax/imgDelete',
					method : 'post',
					data : {
						delArr : delArr
					},
					error : function(xhr, status, msg) {
						alert("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(data) {
						if (data != 0) {
							var chk = $("[id='imgChk']:checked");
							for (var i = 0; i < chk.length; i++) {
								$(chk[i]).next().remove(); // 이미지
								$(chk[i]).remove(); // 체크박스
							}
						} else {
							console.log("실패");
						}
					}
				});
			}
		});
	}

	// 미수납/수납대기
	function nonPayList(searchType, keyword) {
		$.ajax({
			url : 'ajax/nonPayList',
			type : 'GET',
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
		$("#donePayList").empty();
		$
				.each(
						data,
						function(idx, item) {
							if (item.PAY_STATE == 'Y') { // 수납 완료
								$('<tr>')
										.append(
												$(
														'<td id="resvNo" value="'+item.PAY_NO+'">')
														.html(item.RESV_NO))
										.append($('<td>').html(item.BABY_NAME))
										.append(
												$('<td id="price'+idx+'">')
														.html(item.PAY_PRICE))
										.append($('<td>').html(item.PAY_DATE))
										.appendTo('#donePayList');
							} else {
								$('<tr>')
										.append(
												$(
														'<td id="resvNo" value="'+item.PAY_NO+'">')
														.html(item.RESV_NO))
										.append($('<td>').html(item.PAY_DATE))
										.append($('<td>').html(item.BABY_NAME))
										.append(
												$('<td id="price'+idx+'">')
														.html(item.PAY_PRICE))
										.append(
												$(
														'<td style="display:none;" id="nonBabyNo">')
														.html(item.BABY_NO))
										.appendTo('#nonPayList');

								if (item.PAY_STATE == 'W') { // 수납대기(계좌이체)
									$("#price" + idx)
											.eq(-1)
											.after(
													'<td><button id="stBtn" type="button" data-toggle="modal" data-target="#stPopup" data-no="'+item.PAY_NO+'">승인</button></td>');
								} else if (item.PAY_STATE == 'N') { // 미수납
									$("#price" + idx).eq(-1).after(
											'<td>미수납</td>');
								}
							}
						});
	}

	function roomList() {
		$.ajax({
			url : 'ajax/roomList',
			type : 'GET',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : roomListResult
		});
	}

	function roomListResult(data) {
		// item.진료실번호 해서 각각 알맞은 곳에 출력
		$.each(data, function(idx, item) {

			if (item.RESV_ROOM == 1) {
				$('<tr>').append(
						$('<td id="resvNo" value="'+item.RESV_NO+'">').html(
								item.RESV_NO)).append(
						$('<td>').html(item.BABY_NAME)).append(
						$('<td style="display:none;">').html(item.BABY_NO))
						.appendTo('#room1');
			} else if (item.RESV_ROOM == 2) {
				$('<tr>').append(
						$('<td id="resvNo" value="'+item.RESV_NO+'">').html(
								item.RESV_NO)).append(
						$('<td>').html(item.BABY_NAME)).append(
						$('<td style="display:none;">').html(item.BABY_NO))
						.appendTo('#room2');
			} else if (item.RESV_ROOM == 3) {
				$('<tr>').append(
						$('<td id="resvNo" value="'+item.RESV_NO+'">').html(
								item.RESV_NO)).append(
						$('<td>').html(item.BABY_NAME)).append(
						$('<td style="display:none;">').html(item.BABY_NO))
						.appendTo('#room3');
			}
		});
	}

	function resvList(searchType, keyword) {
		$.ajax({
			url : 'ajax/resvList',
			type : 'GET',
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
									+ ('0' + (d.getMonth() + 1)).slice(-2)
									+ '-' + ('0' + d.getDate()).slice(-2);

							$('<tr>')
							.append(
									$('<td style="display:none;">')
											.html(item.BABY_NO))
									.append(
											$(
													'<td id="resvNo'+idx+'" value="'+item.RESV_NO+'">')
													.html(item.RESV_NO))
									.append($('<td>').html(item.RESV_DATETIME))
									.append($('<td>').html(item.BABY_NAME))
									.append(
											$('<td id="regno'+idx+'">').html(
													item.BABY_REGNO1))
									.appendTo('#resvList');

							if (item.CHK_TYPE == "V") { // 예방접종
								$("#resvNo" + idx).css("background", "#bed3c3");
							}

							var resvNN = item.RESV_NO;
							if (date == today && (item.RESV_STATUS == 'N')) {
								$("#regno" + idx)
										.eq(-1)
										.after(
												'<td id="room" onclick="event.cancelBubble=true"><select onchange="roomMove(\''
														+ resvNN
														+ '\');" class="officeSel" id="officeSel'
														+ item.RESV_NO
														+ '"><option value="-">---</option><option value="1">1</option><option value="2">2</option><option value="3">3</option></select></td>');
								$(
										"#officeSel" + item.RESV_NO
												+ " option:eq("
												+ item.RESV_ROOM + ")").attr(
										"selected", "selected");
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

			$.ajax({
				url : 'ajax/uniqInfo',
				data : {
					resv_no : td.eq(0).text()
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : resvUniqResult
			});
		});
	}

	function resvUniqResult(data) {
		$("#resvDetail").empty();
		$("#resvDetail").append($('<p>').html(data.RESV_DETAIL)).append(
				$('<hr>')).append($('<p>').html(data.RESV_MEMO));
	}

	// 환자목록 클릭 시 진료/예약 이력 목록 출력
	function resvHstList() {
		$("body").on("click", "#resvList tr", function() {
			var tdArr = new Array();
			var td = $(this).children();

			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});

			$.ajax({
				url : 'ajax/resvHstList',
				data : {
					baby_no : td.eq(0).text()
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : resvHstListResult
			});

			$.ajax({
				url : 'ajax/ptInfo',
				data : {
					baby_no : td.eq(0).text()
				},
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
							var resvNo = "";
							if (typeof item.RESV_NO != 'undefined') {
								resvNo = item.RESV_NO;
							}
							imgsrc = item.IMG_ADDR; // todo: undefined 아닐 경우에만 담아야함..
							$('<tr>').append($('<td>').html(item.RESV_NO))
									.append($('<td>').html(item.RESV_DATE))
									.append(
											$('<td id="dtl'+idx+'">').html(
													item.RESV_DETAIL)).append(
											$('<td style="display:none;">')
													.html(item.BABY_NO))
									.appendTo('#resvHstList');

							if (item.CHK_TYPE == "N") { // 일반 검진. 사진 버튼 출력
								$("#dtl" + idx)
										.eq(-1)
										.after(
												'<i class="material-icons" id="imgBtn" data-toggle="modal" data-target="#imgPopup" data-num="'+resvNo+'">attach_file</i>');
								// 										.after('<button id="imgBtn" type="button" data-toggle="modal" data-target="#imgPopup" data-num="'+resvNo+'">사진</button>');
							}

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
								'주소 : ' + data.PARENT_ADDR));
	}

	function setImages(event) {
		var sel_files = [];
		var files = event.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f) {
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

	function close_pop() {
		$("#stPopup").hide();
	}

	function cancle_pop() {
		$("#stPopup").show();
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
							aria-label="Search" aria-describedby="basic-addon2"
							onkeypress="if(event.keyCode=='13'){event.preventDefault(); SearchClick();}">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button" id="searchPati"
								onclick="SearchClick()">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
				<div class="card shadow py-2" style="height: 230px;">
					<div class="card-body">
						<p class="text-s font-weight-bold text-success">환자정보</p>
						<div style="width: 100%; height: 150px; overflow: auto;"
							id="ptInfo"></div>
					</div>
				</div>
				<div class="card shadow py-2" style="height: 230px; margin: 10px 0;">
					<div class="card-body">
						<p class="text-s font-weight-bold text-danger"
							style="margin-bottom: 3px !important;">상세증상 및 특이사항</p>
						<div
							style="overflow: auto; width: 100%; height: 160px; padding-top: 10px;"
							id="resvDetail"></div>
					</div>
				</div>
				<div class="card shadow py-2" style="height: 266px">
					<div class="card-body" style="border-collapse: collapse;">
						<!-- overflow-y: auto;  -->
						<!-- style="position:sticky; position: absolute; top:5px;" -->
						<p class="text-s font-weight-bold text-success">진료/예약 이력</p>
						<table class="table text-center" style="display: block;" id="resvHstTable">
							<thead>
								<tr>
									<th class="text-center">No</th>
									<th class="text-center">일시</th>
									<th class="text-center">설명</th>
									<th class="text-center">사진</th>
								</tr>
							</thead>
							<tbody id="resvHstList"
								style="display: block; height: 150px; overflow: auto; overflow-x:hidden;"></tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- 2번 -->
			<div class="col-xl-4 col-md-6 mb-4 column">
				<div class="card shadow py-2" style="height: 800px;">
					<div class="card-body"
						style="overflow-y: auto; border-collapse: collapse;">
						<div class="text-s" style="margin-bottom: 20px;">
							<span class="text-primary font-weight-bold">전체 예약 환자</span><span
								class="font-weight-bold"
								style="background: #bed3c3; padding: 5px; margin-left: 10px;">예방접종</span><span>
								사전예약(R) | 방문예약(T)</span><span class="mb-0 font-weight-bold"
								style="float: right; margin: 4px 0 0 5px;">전체</span> <span
								style="float: right;"> <input class="tgl tgl-flat rsvTg"
								id="cb1" type="checkbox" /> <label class="tgl-btn" for="cb1"></label>
							</span>
							<table class="table text-center" style="display: block; margin-top: 20px;" id="resvTable">
								<thead class="font-weight-bold text-center">
									<tr>
										<th>예약번호</th>
										<th>일시</th>
										<th>성명</th>
										<th>생년월일</th>
										<th>진료실</th>
									</tr>
								</thead>
								<tbody id="resvList" style="display: block; height: 630px; overflow: auto; overflow-x:hidden;"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<!-- 3번 -->
			<div class="col-xl-2 col-md-6 mb-4">
				<div class="card shadow py-2" style="height: 260px;">
					<div class="card-body"
						style="overflow-y: auto; border-collapse: collapse;">
						<p class="text-s font-weight-bold">진료실 1</p>
						<table class="table text-center">
							<thead>
								<tr>
									<th class="text-center">No</th>
									<th class="text-center">성명</th>
								</tr>
							</thead>
							<tbody id="room1"></tbody>
						</table>
					</div>
				</div>
				<div class="card shadow py-2" style="height: 260px; margin: 10px 0;">
					<div class="card-body"
						style="overflow-y: auto; border-collapse: collapse;">
						<p class="text-s font-weight-bold">진료실 2</p>
						<table class="table text-center">
							<thead>
								<tr>
									<th class="text-center">No</th>
									<th class="text-center">성명</th>
								</tr>
							</thead>
							<tbody id="room2"></tbody>
						</table>
					</div>
				</div>
				<div class="card shadow py-2" style="height: 260px;">
					<div class="card-body"
						style="overflow-y: auto; border-collapse: collapse;">
						<p class="text-s font-weight-bold">진료실 3</p>
						<table class="table text-center">
							<thead>
								<tr>
									<th class="text-center">No</th>
									<th class="text-center">성명</th>
								</tr>
							</thead>
							<tbody id="room3"></tbody>
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
						<div>
							<table class="table text-center" id="nonPayTable" style="display: block;">
								<thead>
									<tr>
										<th class="text-center">예약번호</th>
										<th class="text-center">일시</th>
										<th class="text-center">성명</th>
										<th class="text-center">금액</th>
										<th class="text-center">상태</th>
									</tr>
								</thead>
								<tbody id="nonPayList" style="display: block; height: 250px; overflow: auto; overflow-x:hidden;"></tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="card shadow py-2" style="height: 395px; margin: 10px 0;">
					<div class="card-body">
						<p class="text-s font-weight-bold text-info">수납 완료</p>
						<div style="overflow: auto; height: 300px;">
							<table class="table text-center">
								<thead>
									<tr>
										<th class="text-center">예약번호</th>
										<th class="text-center">성명</th>
										<th class="text-center">금액</th>
										<th class="text-center">결제일</th>
									</tr>
								</thead>
								<tbody id="donePayList"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="imgPopup">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 550px;">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">진료 사진 관리</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body" style="min-height: 100px;">
					<form enctype="multipart/form-data" id="imgForm" name="imgForm">
						<input type="hidden" id="resv_no" value="">
						<div class="filebox" style="float: left; padding-right: 600px;">
							<label for="imgInput">업로드</label> <input type="file"
								multiple="multiple" id="imgInput" name="imgInput"
								accept="image/*" onchange="setImages(event);">
						</div>
						<div id="imgShow"
							style="max-height: 640px; overflow-y: auto; width: 100%;"></div>
						<div class="modal-footer text-center"
							style="justify-content: center !important;">
							<button class="btn-primary" type="button" style="margin: 0 25px;"
								id="imgRBtn">등록/수정</button>
							<button class="btn-danger" type="button" style="margin: 0 25px;"
								id="imgDBtn">삭제</button>
							<!-- disabled -->
							<button type="button" style="margin: 0 25px;" id="imgCBtn"
								data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="stPopup">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 520px;">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">수납 대기 승인</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body">
					<div id="payInfo"
						style="height: 300px; overflow-y: auto; width: 100%;"></div>
					<div class="modal-footer text-center"
						style="justify-content: center !important;">
						<button class="btn-primary" type="button" style="margin: 0 25px;"
							id="stRBtn" data-toggle="modal" data-target="#stChkPop"
							onclick="close_pop()">승인</button>
						<button type="button" style="margin: 0 25px;" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="stChkPop">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 520px;">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal"
						onclick="cancle_pop()" aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body text-center">
					<p style="font-size: 25px; width: 100%;">결제를 승인하시겠습니까?</p>
					<button class="btn-primary" type="button" style="margin: 0 25px;"
						id="stRBtn2" data-dismiss="modal">승인</button>
					<button type="button" style="margin: 0 25px;" data-dismiss="modal"
						onclick="cancle_pop()">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>