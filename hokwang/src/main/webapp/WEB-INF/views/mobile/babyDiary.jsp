<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOHO</title>
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<script src="./resources/json.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 예약 날짜 달력 -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

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

.table>:not(caption)>*>* {
	padding: .70rem;
	background-color: var(- -bs-table-bg);
	background-image: linear-gradient(var(- -bs-table-accent-bg),
		var(- -bs-table-accent-bg));
	border-bottom-width: 1px
}

.notification {
	color: #000;
	bottom: 0;
	width: auto;
	text-align: right;
	font-size: inherit;
	font-weight: inherit;
	font-style: inherit;
	margin: 0;
	padding: 15px;
	font-family: "Malgun Gothic", dotum, gulim, sans-serif;
	border: 0;
	position: absolute;
	/* height: 60px; */
	border-radius: 50%;
	background: #e3e3e3;
	box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.3);
	display: block;
	right: 0;
	z-index: 1;
	animation: sticky_bounce 0.5s 2 ease-out 0.2s;
	opacity: 1;
	background-color: #ffd55d;
	margin-bottom: 20px;
	margin-right: 20px;
}

</style>
<script type="text/javascript">
	var d;
	var today;
	var oldtime;
	function payment() {
		location.href = "pay";
	}

	$(function() {
		d = new Date();

		today = d.getFullYear() + '-' + ('0' + (d.getMonth() + 1)).slice(-2)
				+ '-' + ('0' + d.getDate()).slice(-2);
		//checkuphist();
		//reserlist();
		question1();
		question2();
		//chgBaby();
		babyList();
		
		$("#cancelBtn").on("click", function() {
			console.log("dddd");
			var resvNo = $(this).data("resv");
			console.log("cancelBtn : "+resvNo);
			document.getElementById('cRBtn').setAttribute("data-resv", resvNo);
		});

		$("#cRBtn").on("click", function() {
			var resvNo = $(this).data("resv");
			console.log("cRBtn : "+resvNo);
			$.ajax({
				url: 'ajax/resvDelete',
				method:'post',
				data: {
					resv_no: resvNo
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(data) {
					alert("예약이 취소되었습니다.");
					location.href = "babyDiary";
				}
			});
		});
		
		$("#modiBtn").on("click", function() {
			console.log("bbbb");
			var resvNo = $(this).data("resv");
			console.log("modiBtn : "+resvNo);
			// 예약수정 함수 실행
			resvUpdate();
		});
		
		$('ul.tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		});

		// 예약 취소/수정 모달 S
		resvInfo();
		$("input[name=chk_type]").on("click", function() {
			chkType();
		});

		$(".selector").on("change", function() {
			console.log("날짜 선택");
			resvList($(".selector").val());
		});

		$("#wMediBtn").on("click", function() {
			if ($("#wMedi").css("display") == "none") {
				$("#wMedi").css("display", "block");
			} else {
				$("#wMedi").css("display", "none");
			}
		});

		$("body").on("click", "#chkTb td", function() {
			var val = $(this).text();
			if (!$(this).hasClass("chkTbSel") && $(this).text() != "") {
				$(this).css("background", "#f6d578");
				$(this).attr("class", "chkTbSel");
				detailArr.push(val);
			} else {
				$(this).removeAttr("class");
				$(this).css("background", "white");
				detailArr.splice(detailArr.indexOf(val), 1);
			}
		});
		// 예약 취소/수정 모달 E
	});
	
	// 예약 수정
	function resvUpdate() {
		// 유효성 검사
		var chkVal = $('input[name="resv_time"]:checked').val();
			if ($('input[name="chk_type"]:checked').val() == "V") {
				if ($("#vacSel option:selected").val() == "") {
					alert("접종할 병명을 선택해 주세요.");
					return;
				}
			}

// 			if ($(".selector").val() == "") {
// 				alert("예약 날짜를 선택해 주세요.");
// 				return;
// 			} else {
// 				if (chkVal == undefined) {
// 					alert("예약 시간을 선택해 주세요.");
// 					return;
// 				}
// 			}

			if ($(':radio[name="a1"]:checked').length < 1) {
				alert("문진표의 응답1을 선택해 주세요.");
				return;
			}
			if ($(':radio[name="a2"]:checked').length < 1) {
				alert("문진표의 응답2를 선택해 주세요.");
				return;
			}
			if ($(':radio[name="a3"]:checked').length < 1) {
				alert("문진표의 응답3을 선택해 주세요.");
				return;
			}
			if ($(':radio[name="a4"]:checked').length < 1) {
				alert("문진표의 응답4를 선택해 주세요.");
				return;
			}
			var eee = $("input[name=resv_date]").val();
			eee = eee.replaceAll('-', '').substr(2);
			var aaa = $('input[name="resv_time"]:checked').val();
			aaa = aaa.replaceAll(':', '');
			var bbb = $('#childSel option:selected').val();

			var resvNo = "${resvType}" + eee + aaa + bbb;
			$("#resv_detail").val(detailArr);
			var resvTy = "${resvType}";
			$("#resv_type").val(resvTy);
			$("#nresv_no").val(resvNo);
			console.log("nresv_no : "+resvNo);
		
		// 수정
		$.ajax({
			url : "ajax/resvUpdate",
			method : "post",
			data : $("#frm").serialize(),
			// 				data : data,
			success : function(response) {
				alert("예약 수정 성공");
				location.href = "babyDiary";
			},
			error : function(xhr, status, message) {
				alert("status : " + status + " error : " + message);
			}
		});
	}
	
	function close_pop() {
		$("#modifyAndCancel").hide();
	}

	function cancle_pop() {
		$("#modifyAndCancel").show();
	}

	// 검진 상태별 항목
	function chkType() {
		var chkVal = $('input[name="chk_type"]:checked').val();

		if (chkVal == "V") {
			$("#resvTypeDiv").css("display", "block");
			$("#detailCard").css("display", "none");
			vacList();

		} else {
			$("#resvTypeDiv").css("display", "none");
			$("#detailCard").css("display", "block");
		}
	}
	// 접종명 목록
	function vacList() {
		$("#vacSel").empty();
		var babyNo = $("#baby_no").val();
		console.log("babyNo : " + babyNo);
		$.ajax({
			url : 'ajax/vacList',
			type : 'GET',
			// 			data : {
			// 				baby_no : babyNo
			// 			},
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
	}

	// 예약일에 따라 예약시간 출력
	function resvList(resvDate) {
		$.ajax({
			url : 'ajax/getCntTimeList',
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
		console.log("result : " + data);
		var chgti;
		var arrNumber = [ '09:00', '09:30', '10:00', '10:30', '11:00', '11:30',
				'13:30', '14:00', '14:30', '15:00', '15:30', '16:00', '16:30',
				'17:00', '17:30' ];
		$("#resvTime").empty();

		for (var i = 0; i < arrNumber.length; i++) {
			chgti = Number(arrNumber[i].substr(0, 2));

			// 현재 이전 시간대 예약 불가
			if (today == $(".selector").val()) {
				if (chgti <= d.getHours()) {
					arrNumber.splice(i, 1, "");
				}
			}
		}

		// 예약된 시간이 있을경우
		$.each(data, function(idx, item) {
			var time = item.RESV_TIME;

			for (var i = 0; i < arrNumber.length; i++) {
				if (arrNumber[i] == item.RESV_TIME) {
					if (item.CNT > 3) {
						arrNumber.splice(i, 1, "");
					}
				}
			}
		});

		var chk = false;
		for (var i = 0; i < arrNumber.length; i++) {
			if (arrNumber[i] != "" && arrNumber[i] != null) {
				$("#resvTime")
						.append(
								'<label class="form-check" style="margin:2px;"><input name="resv_time" type="radio" class="form-check-input" value="'+arrNumber[i]+'"><span class="form-check-label">'
										+ arrNumber[i] + '</span></label>');
				chk = true;
			}
		}
		if (!chk) {
			$("#resvTime").append('<label>예약 가능한 시간이 없습니다.</label>');
		}
		if($('input:radio[name="resv_time"][value="'+ oldtime + '"]').length==0) {
			$("#resvTime")
			.append(
					'<label class="form-check" style="margin:2px; display:none;"><input name="resv_time" type="radio" class="form-check-input" value="'+oldtime+'"><span class="form-check-label">'
							+ oldtime + '</span></label>');
		}
		$('input:radio[name="resv_time"][value="'+ oldtime + '"]').prop('checked', true);
	}

	// 등록된 예약 정보
	function resvInfo() {
		$("body").on(
				"click",
				"#modi",
				function() {
					$("#baby_no").val($(this).data("baby"));
					var resvNo = $(event.target).parent().siblings("#aa1").text();
					console.log("resvNo : " + resvNo);
					$.ajax({
						url : "ajax/resvInfo",
						type : "GET",
						data : {
							resv_no : resvNo
						},
						error : function(xhr, status, msg) {
							alert("상태값 :" + status + " Http에러메시지 :" + msg);
						},
						success : function(data) {
							$('input:radio[name="chk_type"][value="'+ data.CHK_TYPE + '"]').prop('checked', true);
							oldtime = data.RESV_TIME;
							chkType();
							if (data.CHK_TYPE == "V") {
								$("#vacSel option:eq(" + data.CHK_NO + ")")
										.attr("selected", "selected");
							}
							$(".selector").val(data.RESV_DATE);
							resvList($(".selector").val());
							$("#chkResvTime").val(
									data.RESV_DATE + " " + data.RESV_TIME);
							
							var detailArr = [];
							if (typeof data.RESV_DETAIL != 'undefined') {
								var test = data.RESV_DETAIL;
								detailArr = test.split(",");
							}
							
							for(var i=0; i<detailArr.length; i++) {
								var tdcnt = $("#chkTb").children().find("td").length;
								
								for(var j=0; j<tdcnt; j++) {
									var tdcont = $("#chkTb").children().find("td").eq(j).text();
									if(tdcont == detailArr[i]) {
										$("#chkTb").children().find("td").eq(j).css('background', '#f6d578');
									}
								}
							}
							
							if (typeof data.RESV_MEMO != 'undefined') {
								$("textarea[name=resv_memo]").val(data.RESV_MEMO);
							}
							
							$("#resv_no").val(data.RESV_NO);
				 			document.getElementById('cancelBtn').setAttribute("data-resv", data.RESV_NO);
				 			document.getElementById('modiBtn').setAttribute("data-resv", data.RESV_NO);
				 			
				 			// 문진표
							$('input:radio[name="a1"][value="'+ data.A1 + '"]').prop('checked', true);
							$('input:radio[name="a2"][value="'+ data.A2 + '"]').prop('checked', true);
							$('input:radio[name="a3"][value="'+ data.A3 + '"]').prop('checked', true);
							$('input:radio[name="a4"][value="'+ data.A4 + '"]').prop('checked', true);
						}
					});
				});
	}
</script>
<script type="text/javascript">
	function question1() {
		console.log("문진표 클릭/////////////////");

		$('#reser2').on("click", "#que1", function() {
			var modal = $('#question');
			var resvNo = $(event.target).parent().siblings("#aa1").text();
			console.log("aaaaaaaaaaa" + resvNo);
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

					modal.find($('input[name=Ra1]')).val([ data[0].a1 ]);
					modal.find($('input[name=Ra2]')).val([ data[0].a2 ]);
					modal.find($('input[name=Ra3]')).val([ data[0].a3 ]);
					modal.find($('input[name=Ra4]')).val([ data[0].a4 ]);
					//modal.modal('show');
				}
			});
		});

	}
	function question2() {//문진표

		$('#unpayList').on("click", "#que2", function() {
			var modal = $('#question');
			var resvNo = $(event.target).parent().siblings("#aa2").text();
			console.log("aaaaaaaaaaa" + resvNo);
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

					modal.find($('input[name=Ra1]')).val([ data[0].a1 ]);
					modal.find($('input[name=Ra2]')).val([ data[0].a2 ]);
					modal.find($('input[name=Ra3]')).val([ data[0].a3 ]);
					modal.find($('input[name=Ra4]')).val([ data[0].a4 ]);
					//modal.modal('show');
				}
			});
		});

	}
	function reserlistResult(data) {
		$("#reser2").empty();
		$
				.each(data,function(idx, item) {
							$("<tr id='a2'>")
									.append($("<td>").attr("id", 'resv_date').attr('value',item.resv_date).html(item.resv_date))
									.append($("<td>").attr("id", 'que'+ idx).append($("<input type='button' id='question_reser' style='width:70px;height:50px;' value='문진표' data-toggle='modal' data-target='#question' data-num='qust_no' data-backdrop='static'>")))
									//.append($("<td>").attr("id", 'modi' ).append($("<input type='button' id='modi' style='width:85px;height:50px;' value='수정/취소' data-toggle='modal' data-target='#modifyAndCancel' data-backdrop='static' data-baby="+item.baby_no+">")))
									.append($("<td style='display:none;'>").attr("id", 'aa1').attr('value',item.resv_no).html(item.resv_no))
									.appendTo('#reser2');
							
							if (item.resv_status == "Y") {
								console.log(">>2 " + item.resv_status);
								text = "진료완료";
								$("#que" + idx).eq(-1).after(
										'<td id="diag_yn">' + text + '</td>');
							}
							else if (item.resv_status == "N") {
								console.log(">>2 " + item.resv_status);
								text = "";
								$("#que" + idx).eq(-1).after("<td><input type='button' id='modi' style='width:85px;height:50px;' value='수정/취소' data-toggle='modal' data-target='#modifyAndCancel' data-backdrop='static' data-baby="+item.baby_no+"/></td>");
							}
						})
	}
	
	
	//미결제
	function reserlistResult2(data) {
		$("#unpayList").empty();
		$
				.each(data,function(idx, item) {
							$("<tr>")
									.append($("<td>").attr("id", 'resv_date').attr('value',item.resv_date).html(item.resv_date))
									.append($("<td>").attr("id",'question' + idx).append($("<input type='button' id='que2' style='width:70px;height:50px;' value='문진표' data-toggle='modal' data-target='#question' data-backdrop='static'>")))
									.append($("<td style='display:none;'>").attr("id", 'aa2').attr('value',item.resv_no).html(item.resv_no))
									.appendTo('#unpayList');
							if (item.resv_payyn == "N") {
								console.log(">> " + item.resv_payyn);
								$("#question" + idx)
										.eq(-1)
										.after('<td id="resv_payyn">'+ '<input type="button" class="btn btn-primary btn-sm" value="결제" onclick="payment()">'
														+ '</td>');
							} else if (item.resv_payyn == "Y") {
								console.log(">> " + item.resv_payyn);
								text = "결제 완료";
								$("#question" + idx).eq(-1)
										.after(
												'<td id="resv_payyn">' + text
														+ '</td>');
							}

						})
	};

	function checkuphist() {//접종 리스트
		var babyNo = $("#baby-name option:selected").val();
		console.log("DDD");
	

		
	}/* end of function */

	function checkuphistResult(data) {
		var text = "";
		
		$("#checkup").empty();
		$.each(data, function(idx, item) {
				console.log("idx>>>" + idx);
						$("<tr>").append(
					$("<td id='chk_name' value= '"+item.CHK_NAME+"'>").html(
							item.CHK_NAME)).append(
					$("<td id='hist_date" + idx+"'>").html(
							item.HIST_DATE)).appendTo('#checkup');

			if (item.HIST_STATE == "I") {
				console.log(">> I " + idx + item.HIST_STATE);
				text = "접종 중";
				$("#hist_date"+idx).eq(-1).after(
						'<td id="hist_state">' + text + '</td>');
			} else if (item.HIST_STATE == "N") {
				console.log(">> N" + idx + item.HIST_STATE);
				text = "미접종";
				$("#hist_date"+idx).eq(-1).after(
						'<td id="hist_state">' + text + '</td>');
			} else if (item.HIST_STATE == "Y") {
				console.log(">> 접종완료 " + idx + item.HIST_STATE);
				text = "접종완료";
				$("#hist_date"+idx).eq(-1)
				.after(
						'<td id="hist_state">' + text
								+ '</td>');;
			}

		})/* end of ajax  */
		var $item = $('#hist_state').on('click', function() {
			  var idx = $(this).index();
			  console.log("idx >>>>>>>>>>>>>>"+idx);
			});
	}
	function checkuphistIncompleteResult(data) {
		var text = "";

		$("#checkupIncom").empty();
		$.each(data, function(idx, item) {
			console.log("idx>>>" +idx);
			$("<tr>").append(
					$("<td id='chk_name2' value= '"+item.CHK_NAME+"'>").html(
							item.CHK_NAME)).append(
					$("<td id='hist_date2" + idx+"'>").html(
							item.HIST_DATE)).appendTo('#checkupIncom');

			if (item.HIST_STATE == "I") {
				//console.log(">> I " + idx + item.HIST_STATE);
				text = "접종 중";
				$("#hist_date2"+idx).eq(-1).after(
						'<td id="hist_state">' + text + '</td>');
			} else if (item.HIST_STATE == "N") {
				//console.log(">> N" + idx + item.HIST_STATE);
				text = "미접종";
				$("#hist_date2"+idx).eq(-1).after(
						'<td id="hist_state">' + text + '</td>');
			}

		})/* end of ajax  */
		var $item = $('#hist_state').on('click', function() {
			  var idx = $(this).index();
			  console.log("idx >>>>>>>>>>>>>>"+idx);
			});
	}

	function checkuphistCompleteResult(data) {
		var text = "";

		$("#checkupCom").empty();
		$.each(data, function(idx, item) {
			console.log("idx>>>" +idx);
			$("<tr>").append(
					$("<td id='chk_name3' value= '"+item.CHK_NAME+"'>").html(
							item.CHK_NAME)).append(
					$("<td id='hist_date3" + idx+"'>").html(
							item.HIST_DATE)).appendTo('#checkupCom');

			 if (item.HIST_STATE == "Y") {
				//console.log(">> N" + idx + item.HIST_STATE);
				text = "접종완료";
				$("#hist_date3"+idx).eq(-1).after(
						'<td id="hist_state">' + text + '</td>');
			} 

		})/* end of ajax  */
		var $item = $('#hist_state').on('click', function() {
			  var idx = $(this).index();
			  console.log("idx >>>>>>>>>>>>>>"+idx);
			});
	}

	function babyList() {
		$.ajax({
			url : 'ajax/getBabyInfo',
			type : 'GET',
			data : {
				parent_no : "${parent_vo.parent_no}"
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				/* $.each(data, function(idx, item) {
							$('#baby-name').children().attr("value", item.baby_no).html(
									item.baby_name);
				}); */
				$.each(data, function(idx, item) {
					let child_no_sel;
					if(item.baby_no == ${param.baby_no} ){
						child_no_sel=$('<option>').attr("value", item.baby_no).prop('selected', true).html(item.baby_name);
					}else{
						child_no_sel=$('<option>').attr("value", item.baby_no).html(item.baby_name);
					}
					$("#baby-name").append(child_no_sel);
					chgBaby();
				});
			}
		});
	}

	function chgBaby() {//체인지 아기
		var babyNo = $("#baby-name option:selected").val();
		var babyNo2 = $("#baby-name option:selected").text();
		console.log("아기 번호 : " + babyNo);
		$.ajax({
			url : 'ajax/getBabyInfo2',
			type : 'GET',
			data : {
				baby_no : babyNo,
				parent_no : "${parent_vo.parent_no}"
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				console.log(data);
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
		$.ajax({//예약
			url : "ajax/reserlist",
			type : "GET",
			dataType : "JSON",
			data : {
				baby_no : babyNo
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				reserlistResult(data.reserlist)
				reserlistResult2(data.reserlist)
				allreserResult(data.allreser)
				console.log(data);
			}
		//만들어야함
		});

		$.ajax({
			url : "ajax/checkhist",
			type : "GET",
			dataType : "JSON",
			data : {
				parent_no : "${parent_vo.parent_no}",
				baby_no : babyNo
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data){
				checkuphistResult(data.checkhistlist)
				checkuphistIncompleteResult(data.checkhistIncom)
				checkuphistCompleteResult(data.checkCom)
			}

		});/* end of ajax */
		
		//정우ㅡㄴ 키,몸무게 등록
		$.ajax({
			url : "ajax/checkBody",
			type : "GET",
			dataType : "JSON",
			data : {
				baby_no : babyNo	
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data){
				$.each(data, function(idx, item) {
					//console.log("ddddd"+item.body_no);
					$('#bodyTable').append($('<tr>')
										.append($('<td>').html(item.body_date))
										.append($('<td>').html(item.body_height))
										.append($('<td>').html(item.body_weight))
						)
				});
			}

		}); /* end checkBody */
		
		
		// 체온등록
		$.ajax({
			url : "ajax/checkTemporature",
			type : "GET",
			dataType : "JSON",
			data : {
				baby_no : babyNo	
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data){
				$.each(data, function(idx, item) {
					$('#tempTable').append($('<tr>')
										.append($('<td>').html(item.temp_date))
										.append($('<td>').html(item.temp_temp))									
						)
				});
			}
		}); /* end checkTemporature */
		
		
		
		
	}

	function allreserResult(data) {
		var text = "";

		$("#allreser").empty();
		console.log(data);
		$
				.each(
						data,
						function(idx, item) {
							$("<tr id='allreser'>").append(
									$("<td>").attr("id", 'resv_date').attr(
											'value', item.RESV_DATE).html(
											item.RESV_DATE)).append(
									$("<td>").attr("id", 'diagsis' + idx).attr(
											'value', item.DIS_NAME).html(
											item.DIS_NAME))
							//.append($("<td>").attr("id", 'status'))
							//.append($("<input type='button' id='que' style='width:70px;height:50px;' value='문진표' data-toggle='modal' data-target='#question' data-backdrop='static'>")))
							.append(
									$("<td style='display:none;'>").attr("id",
											'aa').attr('value', item.RESV_NO)
											.html(item.RESV_NO)).appendTo(
									'#allreser');

							if (item.RESV_STATUS == "N") {
								console.log(">> 1 " + item.RESV_STATUS);
								text = "";
								$("#diagsis"+ idx).eq(-1)
										.after('<td id="diag_yn">'+ '</td>');
							} else if (item.RESV_STATUS == "Y") {
								console.log(">>2 " + item.RESV_STATUS);
								text = "진료완료";
								$("#diagsis" + idx).eq(-1).after(
										'<td id="diag_yn">' + text + '</td>');
							}
						})
		/* $("#question" + idx).eq(-1).after('<td id="resv_payyn">'
						+ '<input type="button" class="btn btn-primary btn-sm" value="결제" onclick="payment()">'
						+ '</td>'); */
	}
	
	function insertbodyinfo() {
		$.ajax({
			url : 'ajax/insertbodyinfo',
			type : 'POST',
			data : {
				parent_no : "${parent_vo.parent_no}"
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
			console.log( "떳니?"+data)
			/* 	$.each(data, function(idx, item) {
					$("#baby-name").append(
							$('<option>').attr("value", item.baby_no).html(
									item.baby_name));
				}); */
			}
		});
	}
	
</script>
</head>
<body>
	<!-- 1 -->
	<div class="row">
		<div class="col-5 col-lg-8 col-xxl-9 d-flex">
			<div class="card flex-fill">
				<div class="form-group">
					<select class="form-control" name="baby_no" id="baby-name"
						onchange="chgBaby()">
						<option value="" selected>==자녀선택==</option>
					</select>
				</div>
				<div style="align-self: center;">
					<img id="babyImg" class="img-fluid rounded-circle mb-2" style="height:120px; width:120px;" />
				</div>
				<input type="button" class="card-title mb-0" value="예약하기">
			</div>
		</div>
		<div class="col-7 col-lg-8 col-xxl-9 d-flex">
			<div class="card flex-fill">
				<div id="babyInfo" style="text-align: left;"></div>
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
											data-toggle="tab" href="#tab-10">결제</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#tab-11">예약</a></li>
									</ul>
								</div>
								<!-- 예약/진료 => 전체탭  -->
								<div class="tab-content">
									<div class="tab-pane fade active show" id="tab-8"
										role="tabpanel">
										<div style="height: 250px; overflow: auto;">
											<table class="table text-center">
												<thead>
													<tr>
														<th class="text-center">예약일시</th>
														<th class="text-center">병명</th>
														<th class="text-center">&nbsp;</th>
													</tr>
												</thead>
												<tbody id="allreser"></tbody>
											</table>
										</div>
										<br>

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
										<div style="height: 250px; overflow: auto;">
											<table class="table text-center">
												<thead>
													<tr>
														<th class="text-center">예약일시3</th>
														<th class="text-center">문진표</th>
														<th class="text-center">결제 여부</th>
													</tr>
												</thead>
												<tbody id="unpayList"></tbody>
											</table>
										</div>
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
											data-toggle="tab" href="#tab-2">미완료</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#tab-3">접종완료</a></li>

									</ul>
								</div>
								<div>
									<div class="tab-content">
										<div class="tab-pane fade active show" id="tab-1"
											role="tabpanel" style="height: 250px; overflow: auto;">
											<div style="width:100%">
											<table class="table text-center">
												<thead>
													<tr >
														<th class="text-center" >접종이름</th>
														<th class="text-center" >일시</th>
														<th class="text-center" >상태</th>
													</tr>
												</thead>
												<tbody id="checkup"></tbody>
											</table>
											</div>
										</div>


										<div class="tab-pane fade text-center" id="tab-2"
											role="tabpanel">
											<div style="height: 250px; overflow: auto;">
											<table class="table text-center">
												<thead>
													<tr>
														<th class="text-center">접종이름</th>
														<th class="text-center">일시</th>
														<th class="text-center">접종상태</th>
													</tr>
												</thead>
												<tbody id="checkupIncom"></tbody>
											</table>
											</div>
										</div>

										<div class="tab-pane fade text-center" id="tab-3"
											role="tabpanel">
											<div style="height: 250px; overflow: auto;">
											<table class="table text-center">
												<thead>
													<tr>
														<th class="text-center">접종이름</th>
														<th class="text-center">일시</th>
														<th class="text-center">접종상태</th>
													</tr>
												</thead>
												<tbody id="checkupCom"></tbody>
											</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 3 -->
							<div class="tab-pane fade" id="tab-6" role="tabpanel" style="height:300px ; overflow: auto;">

								<table class="table text-center">
									<thead>
										<tr>
											<th class="text-center">등록일시</th>
											<th class="text-center">키</th>
											<th class="text-center">몸무게</th>
											<th class="text-center">    </th>
										</tr>
<!-- 										<tr>
											<th class="text-center">21-01-18</th>
											<th class="text-center">170.4</th>
											<th class="text-center">56.8</th>
											<th class="text-center">
											<span class="txt_find" style="">
													<button type="button" class="btn btn-primary btn-sm "
														data-toggle="modal" data-target="#bupModal"
														data-backdrop="static">수정</button>
													<button type="button" class="btn btn-primary btn-sm"
														data-toggle="modal" data-target="#bdelModal"
														data-backdrop="static">삭제</button>
											</span></th>
										</tr> -->
									</thead>
									<tbody id="bodyTable">
									</tbody>
								</table>
								<div class="wrap_btns">
									<button type="button" class="btn_assist notification ons"
										data-cate="notification" data-toggle="modal"
										data-target="#bupModal" data-backdrop="static">
										<span class="blind"><i class="fas fa-plus"></i></span>
									</button>
								</div>
							</div>

							<!-- 4 -->
							<div class="tab-pane fade" id="tab-7" role="tabpanel" style="height:300px ; overflow: auto;">
								<table class="table text-center">
									<thead>
										<tr>
											<th class="text-center">등록일시</th>
											<th class="text-center">체온</th>
										</tr>
									</thead>
									<tbody id="tempTable">
									</tbody>
								</table>
								<div class="wrap_btns">
									<button type="button" class="btn_assist notification ons"
										data-cate="notification" data-toggle="modal"
										data-target="#temporatureModal" data-backdrop="static">
										<span class="blind"><i class="fas fa-plus"></i></span>
									</button>
								</div>
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
	<!-- 수정/취소 모달 S -->
	<div class="modal fade" id="modifyAndCancel" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">수정/취소</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body" style="height: 500px; overflow: auto;">
					<input id="baby_no" type="hidden" value="">
					<form id="frm" name="frm">
						<div class="card">
							<div class="card-body">
								<div style="display: block;">
									<label class="form-check"> <input name="chk_type"
										type="radio" class="form-check-input" value="N"> <span
										class="form-check-label">일반 검진</span>
									</label> <label class="form-check"> <input name="chk_type"
										type="radio" class="form-check-input" value="V"> <span
										class="form-check-label">예방 접종</span>
									</label>
								</div>
								<div style="display: none;" id="resvTypeDiv">
									<select class="form-control mb-3" class="vacSel" id="vacSel"
										name="chk_no" style="width: 250px; margin-left: 15%;">
										<option value="">접종항목</option>
									</select>
								</div>
							</div>
						</div>

						<div class="card flex-fill">
							<div class="card-header">
								<h5 class="card-title"
									style="font-weight: bold; font-size: 15px;">예약 일시</h5>
							</div>
							<div class="card-body d-flex">
								<input type="text" class="selector" placeholder="날짜를 선택하세요."
									style="margin-left: 20%; text-align: center;" name="resv_date"
									class="" /> <a class="input-button" title="toggle" data-toggle><i
									class="icon-calendar"></i></a>
								<script type="text/javascript">
									$(".selector")
											.flatpickr(
													{
														dateFormat : "Y-m-d",
														minDate : "today",
														maxDate : new Date()
																.fp_incr(30),
														disable : [
																"2021-01-28",
																function(date) {
																	return (date
																			.getDay() == 0);
																} ]
													});
								</script>
							</div>
							<!-- 날짜별 예약 가능 시간 -->
							<div class="card-body" style="margin-top: 10px;">
								​ 현재 예약 : <input type="text" id="chkResvTime"
									style="width: 150px; text-align: center;" readonly />
								<div id="resvTime"></div>
							</div>
						</div>

						<div class="card" style="display: none;" id="detailCard">
							<div class="card-header">
								상세 증상&nbsp;<span style="color: gray;">[선택] ※중복 선택 가능</span>
							</div>
							<div class="card-body">
								<table align="center" border="1"
									style="border-collapse: collapse; text-align: center; width: 100%;"
									id="chkTb">
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
									<textarea name="resv_memo" class="form-control"
										placeholder="기타 사항(복용 약물, 알레르기 등)" rows="3"></textarea>
								</div>
								<input style="display: none;" name="resv_detail"
									id="resv_detail"> <input style="display: none;"
									name="resv_type" id="resv_type"> <input
									style="display: none;" name="resv_no" id="resv_no"><input
									style="display: none;" name="nresv_no" id="nresv_no">
							</div>
						</div>

						<div class="card">
							<div class="card-body">
								<button type="button" id="wMediBtn" class="btn btn-outline-info"
									style="width: 40%;">문진표 작성</button>
								<div id="wMedi" style="display: none; padding: 5px;">
									<table style="width: 100%;" border="1">
										<tr>
											<td style="width: 10%">1</td>
											<td>눈을 잘 맞추지 못하거나 눈동자가 흔들립니까?</td>
											<td style="width: 35%"><label class="form-check">
													<input name="a1" type="radio" class="form-check-input"
													value="Y"> <span class="form-check-label">예</span>
											</label> <label class="form-check"> <input name="a1"
													type="radio" class="form-check-input" value="N"> <span
													class="form-check-label">아니오</span>
											</label></td>
										</tr>
										<tr>
											<td>2</td>
											<td>검은 눈동자(동공)가 혼탁합니까?</td>
											<td><label class="form-check"> <input name="a2"
													type="radio" class="form-check-input" value="Y"> <span
													class="form-check-label">예</span>
											</label> <label class="form-check"> <input name="a2"
													type="radio" class="form-check-input" value="N"> <span
													class="form-check-label">아니오</span>
											</label></td>
										</tr>
										<tr>
											<td>3</td>
											<td>정면(앞에 있는 사물)을 볼 때 늘 얼굴을 돌려 옆으로 쳐다보거나 고개를 기울이고 보는 편
												입니까?</td>
											<td><label class="form-check"> <input name="a3"
													type="radio" class="form-check-input" value="Y"> <span
													class="form-check-label">예</span>
											</label> <label class="form-check"> <input name="a3"
													type="radio" class="form-check-input" value="N"> <span
													class="form-check-label">아니오</span>
											</label></td>
										</tr>
										<tr>
											<td>4</td>
											<td>책/TV/물건 등에 너무 가까이 다가가서 보거나 찡그리고 봅니까?</td>
											<td><label class="form-check"> <input name="a4"
													type="radio" class="form-check-input" value="Y"> <span
													class="form-check-label">예</span>
											</label> <label class="form-check"> <input name="a4"
													type="radio" class="form-check-input" value="N"> <span
													class="form-check-label">아니오</span>
											</label></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" type="button" id="modiBtn">예약수정</button>
					<button class="btn btn-primary" type="button" data-toggle="modal" id="cancelBtn"
						data-target="#chkPop" onclick="close_pop()">예약취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 수정/취소 모달 E -->
	<!-- 예약취소 확인 모달 S -->
	<div class="modal fade" id="chkPop" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">예약 취소 확인</h5>
				</div>
				<div class="modal-body">
					<p>예약을 취소하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" type="button" style="margin: 0 25px;"
						id="cRBtn" data-dismiss="modal">예약취소</button>
					<button class="btn btn-primary" type="button" style="margin: 0 25px;"
						data-dismiss="modal" onclick="cancle_pop()">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 예약취소 확인 모달 E -->
	
		<!-- bupModal 등록/수정 모달-->
	<div class="modal fade" id="bupModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">등록</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close" id="btnX">
						<span aria-hidden="true">×</span>
					</button>
				</div>

				<div class="modal-body">
					<div class="card-body">
						<div id="bodyUpdate">
 
						</div>
					</div>
				</div>

				<div class="modal-footer">
					<input type="button" class="btn btn-primary" id="btnId"
						name="btnId" value="찾기">
					<button class="btn btn-secondary" type="button" id="Cancel"
						data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 등록/수정 bupModal end -->
	
	
	<!-- temporatureModal 등록/수정 모달-->
	<div class="modal fade" id="temporatureModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">등록</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close" id="btnX">
						<span aria-hidden="true">×</span>
					</button>
				</div>

				<div class="modal-body">
					<div class="card-body">
						<div id="temporatureUpdate">
 
						</div>
					</div>
				</div>

				<div class="modal-footer">
					<input type="button" class="btn btn-primary" id="btnId"
						name="btnId" value="찾기">
					<button class="btn btn-secondary" type="button" id="Cancel"
						data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 등록/수정 temporatureModal end -->
</body>
</html>