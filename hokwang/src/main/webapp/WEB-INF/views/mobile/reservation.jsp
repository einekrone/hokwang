<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<style type="text/css">
.card-header, .card-body, .card-footer {
	padding: 0.5rem !important;
	text-align: center;
}

td {
	width: 100px;
}
</style>

<script type="text/javascript">
	var d;
	var today;
	$(function() {
		console.log("start");
		d = new Date();

		today = d.getFullYear() + '-'
				+ ('0' + (d.getMonth() + 1)).slice(-2) + '-'
				+ ('0' + d.getDate()).slice(-2);
		
		childList();

		$(".ansR")
				.append(
						'<label class="form-check"> <input name="Ra" type="radio" class="form-check-input" value="Y"> <span class="form-check-label">예</span> </label> <label class="form-check"> <input name="Ra1" type="radio" class="form-check-input" value="N"> <span class="form-check-label">아니오</span> </label>');

		// 예약 버튼 클릭
		$("#resvBtn").on("click", function() {
			if ($("#childSel option:selected").val() == "") {
				alert("자녀를 선택해 주세요.");
				return;
			}

			if ($(':radio[name="resvTypeSel"]:checked').length < 1) {
				alert("예약 상태를 선택해 주세요");
				$("input[name=resvTypeSel]").focus();
				return;
			} else {
				var chkVal = $('input[name="resvTimeSel"]:checked').val();
				if ($('input[name="resvTypeSel"]:checked').val() == "vac") {
					if ($("#vacSel option:selected").val() == "") {
						alert("접종할 병명을 선택해 주세요.");
						return;
					}
				}

				if ($(".selector").val() == "") {
					alert("예약 날짜를 선택해 주세요.");
					return;
				} else {
					if (chkVal == undefined) {
						alert("예약 시간을 선택해 주세요.");
					}
				}

				console.log("chkTbArr : " + chkTbArr);
				console.log("선택된병 : " + $('#vacSel option:selected').val());
			}
		});

		if ('${resvType}' == 'today') {
			// 			$("#resvTime").css("display", "block");
			console.log("today : " + today);
			resvList(today);
		}

		$("input[name=resvTypeSel]").on(
				"click",
				function() {
					var chkVal = $('input[name="resvTypeSel"]:checked').val();

					if (chkVal == "vac") {
						$("#resvTypeDiv").css("display", "block");
						$.ajax({
							url : 'ajax/vacList',
							type : 'GET',
							// 			data : {parent_no: ~~},
							error : function(xhr, status, msg) {
								alert("상태값 :" + status + " Http에러메시지 :" + msg);
							},
							success : function(data) {
								$.each(data, function(idx, item) {
									$("#vacSel").append(
											$('<option>').attr("value",
													item.chk_no).html(
													item.chk_name));
								});
							}
						});

					} else {
						$("#resvTypeDiv").css("display", "none");
					}
				});

		$(".selector").on("change", function() {
			console.log("날짜 선택 : " + $(".selector").val());
			resvList($(".selector").val());
		});

		$("#wMediBtn").on("click", function() {
			if ($("#wMedi").css("display") == "none") {
				$("#wMedi").css("display", "block");
			} else {
				$("#wMedi").css("display", "none");
			}
		});

		var chkTbArr = [];
		$("body").on("click", "#chkTb td", function() {
			var val = $(this).text();
			if (!$(this).hasClass("chkTbSel") && $(this).text() != "") {
				$(this).css("background", "#f6d578");
				$(this).attr("class", "chkTbSel");
				chkTbArr.push(val);
			} else {
				$(this).removeAttr("class");
				$(this).css("background", "white");
				chkTbArr.splice(chkTbArr.indexOf(val), 1);
			}
		});
	});

	function resvList(resvDate) {
		$.ajax({
			url : 'ajax/resvList',
			type : 'GET',
			data : {
				resv_date : resvDate
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : resvListResult
		});
	}

	function resvListResult(data) {
		var arrNumber = [ '09:00', '09:30', '10:00', '10:30', '11:00', '11:30',
				'13:30', '14:00', '14:30', '15:00', '15:30', '16:00', '16:30',
				'17:00', '17:30' ];
		$("#resvTime").empty();
		console.log("현재 시간 : " + d.getHours() + "시");
		console.log("오늘 날짜 : "+today);

		$.each(data, function(idx, item) {
			// 시간을 가져와
			// 			console.log("resvTime : " + item.RESV_TIME);
			if(today == $(".selector").val()) {
				var time = item.RESV_TIME;
				console.log("당일 예약 : "+time.substr(0,2));
				
			}

			for (var i = 0; i < arrNumber.length; i++) {
				if (arrNumber[i] == item.RESV_TIME) {
					arrNumber.splice(i, 1);
				}
			}
			
		});

		for (var i = 0; i < arrNumber.length; i++) {
			$("#resvTime")
					.append(
							'<label class="form-check" style="margin:2px;"><input name="resvTimeSel" type="radio" class="form-check-input" value="'+arrNumber[i]+'"><span class="form-check-label">'
									+ arrNumber[i] + '</span></label>');
		}
	}

	function childList() {
		$.ajax({
			url : 'ajax/childList',
			type : 'GET',
			// 			data : {parent_no: ~~},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				$.each(data, function(idx, item) {
					$("#childSel").append(
							$('<option>').attr("value", item.baby_no).html(
									item.baby_name));
				});
			}
		});
	}

	function chgChild() {
		var babyNo = $('#childSel option:selected').val();
		$.ajax({
			url : 'ajax/childList',
			type : 'GET',
			data : {
				// 	parent_no:
				baby_no : babyNo
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				$.each(data, function(idx, item) {
					$("#childInfo").empty();
					$("#childInfo").append(
							$('<p>').html(
									'이름 : ' + item.baby_name + " ("
											+ item.baby_blood + "형, "
											+ item.baby_gender + ")")).append(
							$('<p>').html(
									'주민번호 : ' + item.baby_regno1 + '-'
											+ item.baby_regno2)).append(
							$('<p>').html('방문 여부 : ' + item.baby_visit));

					$("#childImg").attr(
							"src",
							"${pageContext.request.contextPath}/resources/img/"
									+ item.baby_pic);
				});
			}
		});
	}
</script>
</head>
<body>
	<h1 class="h3 mb-3">예약 페이지</h1>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<select class="form-control mb-3"
						style="width: 250px; margin-left: 15%;" id="childSel"
						onchange="chgChild()">
						<option value="" selected>자녀 선택</option>
					</select>
				</div>
				<div class="card-body">
					<img id="childImg"
						style="float: left; margin-right: 10px; border-radius: 50%; height: 100px;">
					<div id="childInfo" style="text-align: left;"></div>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<div style="display: block;">
						<label class="form-check"> <input name="resvTypeSel"
							type="radio" class="form-check-input" value="normal"> <span
							class="form-check-label">일반 검진</span>
						</label> <label class="form-check"> <input name="resvTypeSel"
							type="radio" class="form-check-input" value="vac"> <span
							class="form-check-label">예방 접종</span>
						</label>
					</div>
					<div style="display: none;" id="resvTypeDiv">
						<select class="form-control mb-3" class="vacSel" id="vacSel"
							style="width: 250px; margin-left: 15%;">
							<option value="">접종항목</option>
						</select>
					</div>
				</div>
			</div>

			<!-- <div class="col-12 col-md-6 col-xxl-3 d-flex order-1 order-xxl-1"> -->
			<div class="card flex-fill">
				<c:if test="${resvType == 'prio'}">
					<div class="card-header">
						<h5 class="card-title" style="font-weight: bold; font-size: 15px;">
							예약 일시</h5>
					</div>
					<div class="card-body d-flex">
						<input type="text" class="selector" placeholder="날짜를 선택하세요."
							style="margin-left: 30%;" /> <a class="input-button"
							title="toggle" data-toggle><i class="icon-calendar"></i></a> ​

						<script type="text/javascript">
							$(".selector").flatpickr({
								dateFormat : "Y-m-d",
								minDate : "today",
								maxDate : new Date().fp_incr(30),
								disable : [ "2021-01-28", function(date) {
									return (date.getDay() == 0);
								} ]
							});
						</script>
					</div>
				</c:if>
				<c:if test="${resvType == 'today'}">
					<div class="card-header">
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
						<h5 class="card-title mb-0">
							예약일 :
							<c:out value="${today}" />
						</h5>
					</div>
				</c:if>
				<!-- 날짜별 예약 가능 시간 -->
				<div class="card-footer">
					<div id="resvTime"></div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					상세 증상&nbsp;<span style="color: gray;">[선택] ※중복 선택 가능</span>
				</div>
				<div class="card-body">
					<table align="center" border="1"
						style="border-collapse: collapse; width: 100%;" id="chkTb">
						<tr>
							<td>발진</td>
							<td>가려움증</td>
							<td>구토</td>
						</tr>
						<tr>
							<td>귀통증</td>
							<td>기침</td>
							<td>누런콧물</td>
						</tr>
						<tr>
							<td>눈출혈</td>
							<td>두통</td>
							<td>맑은콧물</td>
						</tr>
						<tr>
							<td>발열</td>
							<td>발진</td>
							<td>복통</td>
						</tr>
						<tr>
							<td>설사</td>
							<td>탈수</td>
							<td></td>
						</tr>
					</table>
					<div style="margin: 10px 0;">
						<textarea class="form-control" placeholder="기타 사항(복용 약물, 알레르기 등)"
							rows="3"></textarea>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-body">
					<button id="wMediBtn" class="btn btn-outline-info"
						style="width: 40%;">문진표 작성</button>
					<div id="wMedi" style="display: none; padding: 5px;">
						<h5>시각</h5>
						<table style="width: 100%;" border="1">
							<tr>
								<td style="width: 10%">1</td>
								<td>눈을 잘 맞추지 못하거나 눈동자가 흔들립니까?</td>
								<td class="ansR" style="width: 35%"></td>
							</tr>
							<tr>
								<td>2</td>
								<td>검은 눈동자(동공)가 혼탁합니까?</td>
								<td class="ansR"></td>
							</tr>
							<tr>
								<td>3</td>
								<td>정면(앞에 있는 사물)을 볼 때 늘 얼굴을 돌려 옆으로 쳐다보거나 고개를 기울이고 보는 편 입니까?</td>
								<td class="ansR"></td>
							</tr>
							<tr>
								<td>4</td>
								<td>책/TV/물건 등에 너무 가까이 다가가서 보거나 찡그리고 봅니까?</td>
								<td class="ansR"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<div style="text-align: center;">
				<button class="btn btn-pill btn-success" style="margin-right: 20px;"
					id="resvBtn">예약하기</button>
				<button class="btn btn-pill btn-secondary"
					onclick="location.href='child'">취소</button>
			</div>
			<!-- </div> -->
		</div>
	</div>
</body>
</html>