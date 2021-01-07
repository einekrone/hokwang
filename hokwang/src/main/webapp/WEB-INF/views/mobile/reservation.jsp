<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.card-header, .card-body {
	padding: 0.5rem !important;
	text-align: center;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".flatpickr-days").on(
				"click",
				function() {
					console.log("flatpickr-day : "
							+ $(".selected").attr("aria-label"));
					$("#resvTime").css("display","block");
				});

		var dateSelector = document.querySelector('.dateSelector');
		dateSelector.flatpickr();
		console.log(".dateSelector : " + $(".dateSelector").val())
		
// 		$("#xxx span").text();
	});
</script>
</head>
<body>
	<h1 class="h3 mb-3">예약 페이지${resvType}</h1>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<select class="form-control mb-3">
						<option selected="">자녀 선택</option>
						<option>One</option>
						<option>Two</option>
						<option>Three</option>
					</select>
				</div>
				<div class="card-body">
					<img src="/hokwang/resources/img/avatar.jpg"
						style="float: left; border-radius: 50%; height: 100px;">
					<textarea class="form-control" rows="4"
						style="float: left; margin-left: 10px; width: 240px;" readonly>자녀 정보</textarea>
				</div>
			</div>

			<!-- <div class="col-12 col-md-6 col-xxl-3 d-flex order-1 order-xxl-1"> -->
			<div class="card flex-fill">
				<c:if test="${resvType == 'prio'}">
					<div class="card-header">
						<h5 class="card-title" style="font-weight: bold; font-size: 20px;">예약
							일시</h5>
					</div>
					<div class="card-body d-flex">
						<div class="align-self-center w-100">
							<input class="dateSelector">
							<div class="chart">
								<div id="datetimepicker-dashboard"></div>
							</div>
						</div>
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
					<div class="card-body"></div>
				</c:if>
				<!-- 날짜별 예약 가능 시간 -->
				<div class="card-footer">
					<h5 style="font-size: 20px;">예약 시간 출력</h5>
					<div id="resvTime" style="display: none;">
						<label class="form-check">
							<input name="resvTimeSel" type="radio" class="form-check-input" checked>
							<span class="form-check-label">09:00</span>
						</label>
						<label class="form-check">
							<input name="resvTimeSel" type="radio" class="form-check-input">
							<span class="form-check-label">09:30</span>
						</label>
						<label class="form-check">
							<input name="resvTimeSel" type="radio" class="form-check-input">
							<span class="form-check-label">10:00</span>
						</label>
						<label class="form-check">
							<input name="resvTimeSel" type="radio" class="form-check-input" disabled>
							<span class="form-check-label"disabled>10:30</span>
						</label>
						<label class="form-check">
							<input name="resvTimeSel" type="radio" class="form-check-input">
							<span class="form-check-label">11:00</span>
						</label>
						<label class="form-check">
							<input name="resvTimeSel" type="radio" class="form-check-input">
							<span class="form-check-label">11:30</span>
						</label>
						<label class="form-check">
							<input name="resvTimeSel" type="radio" class="form-check-input">
							<span class="form-check-label">13:30</span>
						</label>
						<label class="form-check">
							<input name="resvTimeSel" type="radio" class="form-check-input">
							<span class="form-check-label">14:00</span>
						</label>
						<label class="form-check">
							<input name="resvTimeSel" type="radio" class="form-check-input">
							<span class="form-check-label">14:00</span>
						</label>
						<label class="form-check">
							<input name="resvTimeSel" type="radio" class="form-check-input">
							<span class="form-check-label">15:00</span>
						</label>
						<label class="form-check">
							<input name="resvTimeSel" type="radio" class="form-check-input">
							<span class="form-check-label">15:30</span>
						</label>
						<label class="form-check">
							<input name="resvTimeSel" type="radio" class="form-check-input">
							<span class="form-check-label">16:00</span>
						</label>
						<label class="form-check">
							<input name="resvTimeSel" type="radio" class="form-check-input">
							<span class="form-check-label">16:30</span>
						</label>
						<label class="form-check">
							<input name="resvTimeSel" type="radio" class="form-check-input">
							<span class="form-check-label">17:00</span>
						</label>
						<label class="form-check">
							<input name="resvTimeSel" type="radio" class="form-check-input">
							<span class="form-check-label">17:30</span>
						</label>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					상세 증상 선택&nbsp;<span style="color: red;">[필수]</span>
				</div>
				<div class="card-body">
					<table border="1" align="center" style="border-collapse: collapse;">
						<tr>
							<td>1</td>
							<td>2</td>
							<td>3</td>
						</tr>
						<tr>
							<td>1</td>
							<td>2</td>
							<td>3</td>
						</tr>
						<tr>
							<td>1</td>
							<td>2</td>
							<td>3</td>
						</tr>
					</table>
				</div>
			</div>

			<!-- </div> -->
		</div>
	</div>
</body>
</html>