<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href='${pageContext.request.contextPath}/resources/packages/core/main.css'
	rel='stylesheet' />
<link
	href='${pageContext.request.contextPath}/resources/packages/daygrid/main.css'
	rel='stylesheet' />
<link
	href='${pageContext.request.contextPath}/resources/packages/timegrid/main.min.css'
	rel='stylesheet' />
<script
	src='${pageContext.request.contextPath}/resources/packages/core/main.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/packages/daygrid/main.js'></script>
<script
	src="${pageContext.request.contextPath}/resources/packages/interaction/main.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/packages/timegrid/main.min.js"></script>
</head>
<script
	src='${pageContext.request.contextPath}/resources/packages/core/locales/ko.js'></script>

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js"></script>


<style>
#external-events {
	position: fixed;
	z-index: 2;
	top: 120px;
	left: 20px;
	width: 150px;
	padding: 0 10px;
	border: 1px solid #ccc;
	background: #eee;
}

.demo-topbar+#external-events { /* will get stripped out */
	top: 60px;
}

#external-events .fc-event {
	margin: 1em 0;
	cursor: move;
}

#calendar-container {
	position: relative;
	z-index: 1;
	margin-left: 200px;
}

#calendar {
	max-width: 900px;
	margin: 20px auto;
}

.filter-title {
	float: left;
	width: 20% !important;
	position: fixed;
	top: 120px;
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.group-title {
	background-color: blue;
	color: white;
	padding: 16px 16px;
	font-weight: bold;
}

.input-group {
	display: block;
	color: #000;
	padding: 16px 16px;
	text-decoration: none;
	border-bottom: 1px solid;
	border-top: 1px solid;
	border-left: 1px solid;
	border-right: 1px solid;
}
</style>

</head>
<body>
	<button style="margin: 5px; float: right;"
		onclick="location.href='schExcelView'">엑셀 다운로드</button>
	<div class="filebox" style="float:right; text-align: center;">
		<label for="imgInput" style="width:120px; height:43px; margin-top:5px;">엑셀 업로드</label><input type="file" id="excelInput" name="excelInput" accept=".xlsx, .xlsm, .xlsb, .xltx, .xml, .xlam">
	</div>
	<!-- 드래그 이벤트 
<div id="external-events">
    <p>
      <strong>사유</strong>
    </p>
    <div class="fc-event">병가</div>
    <div class="fc-event">휴가</div>
    <div class="fc-event">근무</div>
  </div>-->

	<div id='calendar'></div>

	<!-- modal -->
	<div id="dialog-form" title="일정">
		<p class="validateTips">일정을 등록하세요</p>

		<form id="form1">
			<fieldset>
				<label>카테고리</label> <select id="work_ctg" name="work_ctg"
					onchange="ctgchange()">
					<option value="">선택</option>
					<option value="work">근무</option>
					<option value="holiday">휴가</option>
				</select><br> <label id="work">근무일자</label> <input type="date"
					name="work_date" id="work_date" class="work_date"><br>

				<label id="holiday">휴가일자</label><br> <input type="date"
					id="work_stdate" name="work_stdate">&nbsp;&nbsp;&nbsp;<input
					type="date" id="work_endate" name="work_endate"><br> <label>사유</label><br>
				<textarea id="work_cause" name="work_cause" cols="35" rows="5"></textarea>

				<!-- Allow form submission with keyboard without duplicating the dialog button -->
				<input type="submit" tabindex="-1"
					style="position: absolute; top: -1000px"><br>
				<div>
					<input type="button" class="btn btn-primary" value="등록"
						id="btnInsert" /> <input type="button" class="btn btn-primary"
						value="취소" id="btnCancel" />
				</div>
			</fieldset>
		</form>
	</div>
	<script>
		//취소
		$("#btnCancel").on('click', function() {
			dialog.dialog("close");
		});

		//카테고리 변경
		function ctgchange() {
			if ($("#work_ctg").val() == "work") {
				$("#work_stdate").css("display", "none");
				$("#work_endate").css("display", "none");
				$("#holiday").css("display", "none");
				$("#work").css("display", "block");
				$("#work_date").css("display", "block");
			} else if ($("#work_ctg").val() == "holiday") {
				$("#work_date").css("display", "none");
				$("#holiday").css("display", "none");
				$("#holiday").css("display", "block");
				$("#work").css("display", "none");
				$("#work_stdate").css("display", "block");
				$("#work_endate").css("display", "block");
			} else if ($("#work_ctg").val() == "") {
				$("#work_date").css("display", "none");
				$("#holiday").css("display", "none");
				$("#holiday").css("display", "none");
				$("#work").css("display", "none");
				$("#work_stdate").css("display", "none");
				$("#work_endate").css("display", "none");
				$("#work_stdate").css("display", "none");
				$("#work_endate").css("display", "none");
				$("#holiday").css("display", "none");
				$("#work").css("display", "none");
				$("#work_date").css("display", "none");
			}
		}

		var Calendar = FullCalendar.Calendar;
		//var Draggable = FullCalendarInteraction.Draggable;//드래그

		// var containerEl = document.getElementById('external-events');//드래그 이벤트
		var calendarEl = document.getElementById('calendar');

		//modal
		var dialog
		dialog = $("#dialog-form").dialog({
			autoOpen : false,
			height : 500,
			width : 450,
			modal : true,
			close : function() {
			}
		});

		/*드래그 function
		new Draggable(containerEl, {
		 itemSelector: '.fc-event',
		 eventData: function(eventEl) {
		   return {
		     title: eventEl.innerText
		   };
		 }
		});*/

		//캘린더 속성
		var calendar = new Calendar(calendarEl, {
			locale : 'ko', //한국어 설정
			events : {
				url : "getScheList"

			},

			plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
			header : {
				left : 'prev,next today',
				center : 'title',
				right : '',
				initialView : 'dayGridMonth',

			},

			selectable : true,//선택한 날짜 표시
			businessHours : true,

			select : function(arg) { //날짜클릭시 dialog 오픈

				var start = moment(arg.start).format('YYYY-MM-DD');
				var end = moment(arg.end).format('YYYY-MM-DD');
				$('#work_stdate').val(start)
				$('#work_date').val(start)
				$('#work_endate').val(end)
				//console.log(start);
				dialog.dialog("open");

			},

			eventClick : function(info) {//이벤트 클릭시 삭제	
				console.log(info);
				console.log(info.event);
				console.log("????" + info.event._def.extendedProps._id);
				var result = confirm("일정을 삭제하시겠습니까?");
				if (result) {
					$.ajax({
						url : "deleteSche",
						type : 'POST',
						dataType : 'json',
						data : {
							work_no : info.event._def.extendedProps._id
						},
						error : function(xhr, status, msg) {
							alert("상태값 :" + status + " Http에러메시지 :" + msg);
						},
						success : function(data) {
							info.event.remove();
						}
					});
				}
			}

		});
		calendar.render();

		$('#btnInsert').on('click', function() {
			var ctg = $("#work_ctg").val();
			var color = '#ff9191'
			var title = $("#work_cause").val();

			if (ctg == 'work') {
				color = '#ff9191'
			} else {
				color = '#90bffc'
			}

			if (title == '') {
				alert("사유입력은 필수입니다.");
				return false;
			}
			$.ajax({
				url : "insertSche",
				type : 'POST',
				dataType : 'json',
				data : $("#form1").serialize(),
				//contentType: 'application/json',
				success : function() {
					calendar.addEvent({
						title : $('#work_cause').val(),
						start : $('#work_stdate').val(),
						end : $('#work_endate').val(),
						backgroundColor : color

					});

				},
				error : function() {
					alert("fail");
				}
			});
			dialog.dialog("close");
			location.reload(true);
		});
		
	</script>
</body>
</html>
