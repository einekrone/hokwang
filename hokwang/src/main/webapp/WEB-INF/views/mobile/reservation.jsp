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
	$(function() {
		childList();

		$("#resvBtn").on("click", function() {
			if ($(':radio[name="resvTypeSel"]:checked').length < 1) {
				alert("예약 상태를 선택해 주세요");
				$("input[name=resvTypeSel]").focus();
				return;
			} else {
				if ($('input[name="resvTypeSel"]:checked').val() == "vac") {

				}
			}
		});

		if ('${resvType}' == 'today') {
			$("#resvTime").css("display", "block");
		}

		$("input[name=resvTypeSel]").on("click", function() {
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
									$('<option>').attr("value", item.chk_no).html(
											item.chk_name));
						});
					}
				});
				
			} else {
				$("#resvTypeDiv").css("display", "none");
			}
		});

		$("input[name=resvTimeSel]").on("click", function() {
			var chkVal = $('input[name="resvTimeSel"]:checked').val();
			console.log("chkVal : " + chkVal);
		});

		$(".selector").on("change", function() {
			console.log("date : " + $(".selector").val());
			$("#resvTime").css("display", "block");
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
									'이름 : ' + item.baby_name + " (" + item.baby_blood
											+ "형, " + item.baby_gender + ")")).append(
							$('<p>').html('주민번호 : ' + item.baby_regno1 + '-' + item.baby_regno2))
							.append($('<p>').html('방문 여부 : ' + item.baby_visit));

					$("#childImg").attr("src", "${pageContext.request.contextPath}/resources/img/" + item.baby_pic);
				});
			}
		});
	}
	
	function chgVac() {
		var vacNo = $('#vacSel option:selected').val();
		console.log("vacNo : "+vacNo);
	}
</script>
</head>
<body>
	<h1 class="h3 mb-3">예약 페이지</h1>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<select class="form-control mb-3" style="width: 250px; margin-left:15%;"
						id="childSel" onchange="chgChild()">
						<option value="" selected>자녀 선택</option>
					</select>
				</div>
				<div class="card-body">
					<img id="childImg"
						style="float: left; margin-right:10px; border-radius: 50%; height: 100px;">
					<div id="childInfo" style="text-align:left;"></div>
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
						<select class="form-control mb-3" class="vacSel" id="vacSel" onchange="chgVac()"
							style="width: 250px; margin-left:15%;">
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
					<div id="resvTime" style="display: none;">
						<label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input" value="09:00"> <span
							class="form-check-label">09:00</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input" value="09:30"> <span
							class="form-check-label">09:30</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input" value=""> <span
							class="form-check-label">10:00</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input" disabled> <span
							class="form-check-label" disabled>10:30</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input" value=""> <span
							class="form-check-label">11:00</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input" value=""> <span
							class="form-check-label">11:30</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input" value=""> <span
							class="form-check-label">13:30</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input" value=""> <span
							class="form-check-label">14:00</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input" value=""> <span
							class="form-check-label">14:00</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input" value=""> <span
							class="form-check-label">15:00</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input" value=""> <span
							class="form-check-label">15:30</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input" value=""> <span
							class="form-check-label">16:00</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input" value=""> <span
							class="form-check-label">16:30</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input" value=""> <span
							class="form-check-label">17:00</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input" value=""> <span
							class="form-check-label">17:30</span>
						</label>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					상세 증상 선택&nbsp;<span style="color: red;">[필수]</span>&nbsp;<span
						style="color: gray;">※중복 선택 가능</span>
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
					<div id="wMedi" style="display: none;">문진표 내용</div>
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