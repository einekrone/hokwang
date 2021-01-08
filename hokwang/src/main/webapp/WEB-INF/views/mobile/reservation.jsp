<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
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
		if('${resvType}' == 'today') {
			$("#resvTime").css("display", "block");
		}
		
		$("input[name=resvTypeSel]").on("click", function() {
			var chkVal = $('input[name="resvTypeSel"]:checked').val();

			if(chkVal == "vac"){
				console.log("접종");
				$("#resvTypeDiv").css("display", "block");
			} else {
				console.log("일반");
				$("#resvTypeDiv").css("display", "none");
			}
		});
		
		$(".flatpickr-days").on(
				"click",
				function() {
					console.log("flatpickr-day : "
							+ $(".selected").attr("aria-label"));
					$("#resvTime").css("display", "block");
				});

		console.log(".dateSelector : " + $(".dateSelector").val())

		// 		$("#xxx span").text();

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
			if(!$(this).hasClass("chkTbSel") && $(this).text()!= "") {
				$(this).css("background", "#f6d578");
				$(this).attr("class", "chkTbSel");
				chkTbArr.push(val);
			} else {
				$(this).removeAttr("class");
				$(this).css("background", "white");
				chkTbArr.splice(chkTbArr.indexOf(val),1);
			}
		});
	});
</script>
</head>
<body>
	<script>
      new Swiper('.swiper-container', {

         slidesPerView : 7, // 동시에 보여줄 슬라이드 갯수
         spaceBetween : 30, // 슬라이드간 간격
         slidesPerGroup : 1, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

         // 그룹수가 맞지 않을 경우 빈칸으로 메우기
         // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
         loopFillGroupWithBlank : true,
         initialSlide:${cal.day-3},
         loop : false, //  반복

         navigation : { // 네비게이션
            nextEl : '.swiper-button-next', // 다음 버튼 클래스명
            prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
         },
      });
   </script>
	<h1 class="h3 mb-3">예약 페이지</h1>
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
						<select class="form-control mb-3">
							<option selected="">접종항목</option>
							<option>One</option>
							<option>Two</option>
							<option>Three</option>
						</select>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-body">
					<div class="swiper-container" style="margin: 40px">

						<div class="swiper-wrapper" style="cursor: point;">
						${cal.getIDayOfWeek()}
							<c:set var="week" value="${cal.getIDayOfWeek()}" />

							<c:forEach begin="1" end="${cal.lastDate }" var="i">

								<div class="swiper-slide" style="hover: #314d9f; cursor: point;">
									<fmt:formatNumber var="no" minIntegerDigits="2" value="${i}" />

<%-- 									<a href="match?m_date=${date}-${no}"> --%>
										<div class="aa"
											style="<c:if test="${i == m_dat }">background-color:#314d9f; color:white;</c:if>;">

											<c:set var="weeklist"
												value='<%=new String[]{"일", "월", "화", "수", "목", "금", "토"}%>' />

											<c:choose>
												<c:when test="${i == m_dat }">
													<c:set var="selcol" value="ww" />
												</c:when>
												<c:when test="${week % 7 == 1 }">
													<c:set var="selcol" value="rr" />
												</c:when>
												<c:when test="${week % 7 == 0 }">
													<c:set var="selcol" value="bb" />
												</c:when>
												<c:otherwise>
													<c:set var="selcol" value="blackk" />
												</c:otherwise>
											</c:choose>

											<p class="${selcol}">${i}</p>
											<br>
											<div style="font-size: 14px;">
												<p class="${selcol}">
													<c:out value="${weeklist[week-1] }" />
												</p>
												<c:set var="week"
													value="${(week+1) == 7 ? 7 : (week+1)% 7 }" />
											</div>
										</div>
<!-- 									</a> -->
								</div>

							</c:forEach>

						</div>

						<!-- 네비게이션 -->
						<div class="swiper-button-next"></div>
						<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
						<div class="swiper-button-prev"></div>
						<!-- 이전 버튼 -->
						<!-- 페이징 -->
						<div class="swiper-pagination"></div>
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
						<div class="align-self-center w-100">
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
				</c:if>
				<!-- 날짜별 예약 가능 시간 -->
				<div class="card-footer">
					<div id="resvTime" style="display: none;">
						<label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input" checked> <span
							class="form-check-label">09:00</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input"> <span
							class="form-check-label">09:30</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input"> <span
							class="form-check-label">10:00</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input" disabled> <span
							class="form-check-label" disabled>10:30</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input"> <span
							class="form-check-label">11:00</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input"> <span
							class="form-check-label">11:30</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input"> <span
							class="form-check-label">13:30</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input"> <span
							class="form-check-label">14:00</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input"> <span
							class="form-check-label">14:00</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input"> <span
							class="form-check-label">15:00</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input"> <span
							class="form-check-label">15:30</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input"> <span
							class="form-check-label">16:00</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input"> <span
							class="form-check-label">16:30</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input"> <span
							class="form-check-label">17:00</span>
						</label> <label class="form-check"> <input name="resvTimeSel"
							type="radio" class="form-check-input"> <span
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
				<button class="btn btn-pill btn-success" style="margin-right: 20px;">예약하기</button>
				<button class="btn btn-pill btn-secondary"
					onclick="location.href='child'">취소</button>
			</div>
			<!-- </div> -->
		</div>
	</div>
	<script>
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							document
									.getElementById("datetimepicker-dashboard")
									.flatpickr(
											{
												inline : true,
												prevArrow : "<span class=\"fas fa-chevron-left\" title=\"Previous month\"></span>",
												nextArrow : "<span class=\"fas fa-chevron-right\" title=\"Next month\"></span>",
											});
						});
	</script>
</body>
</html>