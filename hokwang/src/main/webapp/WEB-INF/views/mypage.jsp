<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>호광병원</title>

<!-- Custom fonts for this template-->
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

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<script src="./resources/json.min.js"></script>
<!-- 팝업 -->
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/demo/chart-pie-demo.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.file-upload label {
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
}

.file-upload input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.file-upload input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.file-upload label {
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
}

/* named upload */
.file-upload .upload-name {
	display: inline-block;
	padding: .5em .75em; /* label의 패딩값과 일치 */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

.dataTables_length {
	display: none;
}

.dataTables_info {
	display: none;
}

.row {
	margin: 30px 180px 0px 180px;
}

.list-table {
	margin-left: 0;
	margin-top: 50px;
	width: 100%;
}

.list-table thead th {
	height: 30px;
	border-top: 2px solid #09C;
	border-bottom: 1px solid #CCC;
	font-weight: bold;
	font-size: 16px;
}

.list-table tbody td {
	padding: 10px 0;
	border-bottom: 1px solid #CCC;
	height: 20px;
	font-size: 14px;
}

.list-table tbody:hover {
	background: #f2f2f2;
}

.aside {
	width: 180px;
	height: 100%;
	background: #A9E2F3; /* Old browsers */
	background: -moz-linear-gradient(top, #A9E2F3 0%, #ffffff 100%);
	/* FF3.6-15 */
	background: -webkit-linear-gradient(top, #A9E2F3 0%, #ffffff 100%);
	/* Chrome10-25,Safari5.1-6 */
	top: 0;
	margin-left: 0;
	z-index: -100;
	position: absolute;
}

#note_menu {
	margin-top: 100px;
	line-height: 30px;
}

#main_in {
	/* margin: 53px; */
	position: absolute;
	left: 330px;
	width: 75%;
	margin: 50px 10px 10px 10px;
}

.note_bt {
	position: absolute;
	left: 24%;
	margin-top: 0%;
	top: 33px;
	width: 75%;
}

#note_bt1 {
	position: absolute;
	left: 20%;
	margin-top: 0%;
	top: 33px;
}

#note_bt ul li {
	float: left;
	margin-left: 20px;
}

#wri_m_bt {
	margin-left: 30px;
	padding: 10px 20px 10px 20px;
	background: #007bff;
	border: 0;
	color: white;
	font-size: 12px;
	border-radius: 10px;
}

#wri_m_bt:hover {
	background: #369ec7;
	color: white;
}

#wri_m_bt a {
	color: white;
}

#body {
	position: fixed
}
</style>
<script type="text/javascript">
	$(function() {
		$(".nav-tabs").tabs({
			active : 0
		});
	})

	$(function() {
		updateInf();
		updateImg();

		btnModal();
		writeTempMsg();
		writeMsg();
		firstMsg();
		changeClick();
		AllCntMsg();
		//ClickTable()
		//deleteMsg();
		oneSales();

	});
	

	/* allSales() */
	function oneSales() {
		$.ajax({
			url : "ajax/oneSales",
			type : "GET",
			dataType : "json",
			data : {
				emp_room : "${emp_vo.emp_room}"
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				if (data.day == null) {
					data.day = 0;
				}
				if (data.resv == null) {
					data.resv = 0;
				}
				if (data.month == null) {
					data.month = 0;
				}
				$('#daySales').append(data.day).append('원');
				$('#countResv').append(data.resv).append('건');
				$('#monthSales').append(data.month).append('원');
			}

		});
	}

	function updateInf() {
		$('#btnUpdate').on("click", function() {
			if ($('#pw').val() == $('#pw2').val()) {
				$.ajax({
					url : "ajax/updateInf",
					type : 'POST',
					/* dataType : 'json', */
					data : {
						emp_pwd1 : $('#oldpw').val(),
						emp_pwd : $('#pw').val(),
					},
					error : function(xhr, status, msg) {
						alert("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(data) {
						if (data == true) {
							alert("변경되었습니다.");
							location.href = "logout";
						} else {
							alert("기존 비밀번호 재확인 ");
							$('#oldpw').val("")
							$('#pw').val("")
							$('#pw2').val("")
						}
					}
				});
			} else {
				alert("새 비밀번호 재확인바람 ");
			}
		});
	}//end of function (updateInf)

	function updateImg() {
		//수정 버튼 클릭

		$('#btnUpdateImg').on('click', function() {
			var form = $('#form1')[0];
			var formData = new FormData(form);

			$.ajax({
				url : "ajax/updateImg",
				dataType : 'json',
				enctype : 'multipart/form-data',
				data : formData,
				method : 'post',
				contentType : false,
				processData : false,
				success : function(data) {
					empSelect();
					
				},
				error : function(xhr, status, message) {
					alert(" status: " + status + " er:" + message);
				}
			});

			$.ajax({
				url : "ajax/updateFinal",
				dataType : 'json',
				data : {
					emp_no : "${emp_vo.emp_no}",
					emp_tel : $('#tel').val(),
					emp_addr : $('#addr').val()
				},
				method : 'post',
				success : function(data) {
					alert("변경되었습니다  다시 로그인 하세요.")
					location.href="logout";//새로고침
				},
				error : function(xhr, status, message) {
					alert(" status: " + status + " er:" + message);
				}
			});

		});//수정 버튼 클릭
	}//userUpdate

	function btnModal() {
		$('#wri_m_bt')
				.on(
						"click",
						function() {
							
							$
									.ajax({
										url : 'ajax/checkTemp',
										type : 'POST',
										data : {
											temp_sendno : "${emp_vo.emp_no}"
										},
										error : function(xhr, status, msg) {
											alert("상태값 :" + status
													+ " Http에러메시지 :" + msg);
										},
										success : function(data) {
											var modal = $('#mailModal');
											console.log(data);
											if (data.temp_no != null) {
												var result = confirm("최근 작성하던 임시 메일이 있습니다.불러올까요?");
												if (result) {
													modal
															.find(
																	'#recipient-name')
															.val(
																	data.temp_resvno);
													modal
															.find(
																	'#message-text')
															.html(
																	data.temp_cont);
													modal.modal('show');
												} else {
													////////////////////
													$('#message-text').empty();
													AllCntMsg();
													modal.find(
															'#recipient-name')
															.html();
													modal.find('#message-text')
															.html("");
													modal.modal('show');
												}
											} else {
												modal.find('#recipient-name')
														.html();
												modal.find('#message-text')
														.html("");
												modal.modal('show');
											}
											$('#dataTab3').DataTable().ajax.reload();
										}
									}); //endof 
						})//end of click function
	}//end of function (btnModal)

	function writeTempMsg() {
		$('#btnTempSave').on("click", function() {
			console.log("${emp_vo.emp_no}");
			console.log($('#message-text').val());
			console.log($('#recipient-name option:selected').val());

			$.ajax({
				url : "ajax/tempMsgInf",
				type : 'POST',
				/* dataType : 'json', */
				data : {
					temp_sendno : "${emp_vo.emp_no}",
					temp_cont : $('#message-text').val(),
					temp_resvno : $('#recipient-name option:selected').val()

				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(data) {
					alert("임시저장되었습니다.");
					AllCntMsg();
					$('#dataTab4').DataTable().ajax.reload();
				}
			});
		})
	}//end of function (writeTempMsg)

	function writeMsg() {
		$('#btnSave').on("click", function() {
			console.log("${emp_vo.emp_no}");
			console.log($('#message-text').val());
			console.log($('#recipient-name option:selected').val());

			if($('#message-text').val() == 0 || $('#recipient-name option:selected').val() ==0){
				alert("필수값을 입력하시오.");
			}
			else{
				$.ajax({
					url : "ajax/sendMsgInf",
					type : 'POST',
					/* dataType : 'json', */
					data : {
						emp_sendno : "${emp_vo.emp_no}",
						msg_cont : $('#message-text').val(),
						emp_resvno : $('#recipient-name option:selected').val()

					},
					error : function(xhr, status, msg) {
						alert("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(data) {
						alert("전송되었습니다.");
						AllCntMsg();
						$('#dataTab1').DataTable().ajax.reload();
						$('#dataTab2').DataTable().ajax.reload();
						$('#dataTab3').DataTable().ajax.reload();
						$('#dataTab4').DataTable().ajax.reload();
					}
				});	
				
			}
		})
	}//end of function (writeMsg)

	function firstMsg() {
		var table1 = $('#dataTab1').DataTable({
			responsive : true,
			autoWidth : false,
			ajax : {

				url : 'ajax/getTotalMsg',
				data : {
					emp_no : "${emp_vo.emp_no}"
				},
				dataSrc : ''
			},
			columns : [ {
				data : 'emp_sendno'
			}, {
				data : 'emp_name'
			}, {
				data : 'msg_cont'
			}, {
				data : 'msg_date'
			}, {
				data : 'msg_yn'
			}, {
				data : 'msg_no'
			} ],
			columnDefs : [ {
				targets : [ 5 ],
				searchable : false,
				visible : false

			} ]
		});

		var table2 = $('#dataTab2').DataTable({
			responsive : true,
			autoWidth : false,
			ajax : {
				url : 'ajax/noReadTotalMsg',
				data : {
					emp_no : "${emp_vo.emp_no}"
				},
				dataSrc : ''
			},
			columns : [ {
				data : 'emp_sendno'
			}, {
				data : 'emp_name'
			}, {
				data : 'msg_cont'
			}, {
				data : 'msg_date'
			}, {
				data : 'msg_no'
			} ],
			columnDefs : [ {
				targets : [ 4 ],
				searchable : false,
				visible : false

			} ]
		});

		var table3 = $('#dataTab3').DataTable({
			responsive : true,
			autoWidth : false,
			ajax : {
				url : 'ajax/sendTotalInf',
				data : {
					emp_no : "${emp_vo.emp_no}"
				},
				dataSrc : ''
			},
			columns : [ {
				data : 'emp_resvno'
			}, {
				data : 'emp_name'
			}, {
				data : 'msg_cont'
			}, {
				data : 'msg_date'
			}, {
				data : 'msg_no'
			} ],
			columnDefs : [ {
				targets : [ 4 ],
				searchable : false,
				visible : false

			} ]
		});

		var table4 = $('#dataTab4').DataTable({

			responsive : true,
			autoWidth : false,
			ajax : {
				url : 'ajax/tempTotalMsg',
				data : {
					emp_no : "${emp_vo.emp_no}"
				},
				dataSrc : ''
			},
			columns : [ {
				data : 'temp_resvno'
			}, {
				data : 'temp_cont'
			}, {
				data : 'temp_date'
			}, {
				data : 'temp_no'
			} ],
			columnDefs : [ {
				targets : [ 3 ],
				searchable : false,
				visible : false

			} ]
		});

		$('#dataTab1 tbody').on('click', 'td', function() {
			var no1 = table1.row($(this).parents('tr')).data().msg_no;
			console.log(no1);

			$.ajax({
				url : 'ajax/checkFinal',
				type : 'POST',
				data : {
					msg_no : no1
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(data) {

					var modal = $('#mailCheckModal');
					console.log(data);
					modal.find('#recipient-name1').val(data.emp_sendno);
					modal.find('#message-text1').html(data.msg_cont);
					modal.modal('show');
					AllCntMsg();
					$('#dataTab1').DataTable().ajax.reload();
					$('#dataTab2').DataTable().ajax.reload();
					$('#showMessage').empty();
					checkMsg();
					showNotReadMsg();
					//

					$('button[name=btnDelete]').on('click', function() {
						console.log(data.msg_no);
						$.ajax({
							url : "ajax/deleteMsg",
							type : 'POST',
							/* dataType : 'json', */
							data : {
								msg_no : data.msg_no
							},
							error : function(xhr, status, msg) {
								alert("상태값 :" + status + " Http에러메시지 :" + msg);
							},
							success : function(data) {
								alert("삭제되었습니다.");
								AllCntMsg();
								$('#dataTab1').DataTable().ajax.reload();
							}
						});
					})
				}
			});
		})

		$('#dataTab2 tbody').on('click', 'td', function() {
			var no2 = table2.row($(this).parents('tr')).data().msg_no;
			console.log(no2);

			$.ajax({
				url : 'ajax/checkFinal',
				type : 'POST',
				data : {
					msg_no : no2
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(data) {

					var modal = $('#mailCheckModal');
					console.log(data);
					modal.find('#recipient-name1').val(data.emp_sendno);
					modal.find('#message-text1').html(data.msg_cont);
					modal.modal('show');
					AllCntMsg();
					$('#dataTab2').DataTable().ajax.reload();
					$('#showMessage').empty();
					checkMsg();
					showNotReadMsg();
					//읽을 경우 헤더 부분의 카운트 감소
					checkMsg();
					$('button[name=btnDelete]').on('click', function() {
						console.log("삭제버튼 클릭");
						$.ajax({
							url : "ajax/deleteMsg",
							type : 'POST',
							/* dataType : 'json', */
							data : {
								mgs_no : data.msg_no
							},
							error : function(xhr, status, msg) {
								alert("상태값 :" + status + " Http에러메시지 :" + msg);
							},
							success : function(data) {
								alert("삭제되었습니다.");
								AllCntMsg();
								$('#dataTab2').DataTable().ajax.reload();
							}
						});
					})
				}
			});
		})

		$('#dataTab3 tbody').on('click', 'td', function() {
			var no3 = table3.row($(this).parents('tr')).data().msg_no;
			console.log(no3);
			$.ajax({
				url : 'ajax/checkFinal',
				type : 'POST',
				data : {
					msg_no : no3
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(data) {

					var modal = $('#mailCheckModal3');
					console.log(data);
					modal.find('#recipient-name3').val(data.emp_resvno);
					modal.find('#message-text3').html(data.msg_cont);
					modal.modal('show');

					$('#btnDeleteT').on('click', function() {
						console.log("삭제버튼 클릭");
						$.ajax({
							url : "ajax/deleteMsg",
							type : 'POST',
							/* dataType : 'json', */
							data : {
								msg_no : data.msg_no
							},
							error : function(xhr, status, msg) {
								alert("상태값 :" + status + " Http에러메시지 :" + msg);
							},
							success : function(data) {
								alert("삭제되었습니다.");
								AllCntMsg();
								$('#dataTab3').DataTable().ajax.reload();
							}
						});
					})

				}
			});
		})

		$('#dataTab4 tbody').on('click', 'td', function() {
			var no4 = table4.row($(this).parents('tr')).data().temp_no;
			console.log(no4);

			$.ajax({
				url : 'ajax/checkTempFinal',
				type : 'POST',
				data : {
					temp_no : no4
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(data) {

					var modal = $('#mailModal');
					console.log(data);
					modal.find('#recipient-name').val(data.temp_resvno);
					modal.find('#message-text').html(data.temp_cont);
					modal.modal('show');

				}
			});
		})
	} //end of function (firstMsg)

	function changeClick() {
		$('#v-pills-tab').on('click', 'a', function(event) {
			$(event.target).siblings().attr('class', 'nav-link');
			$(event.target).attr('class', 'nav-link active');

			$('.note_bt').hide();

			if ($(event.target).attr('id') == 'v-pills-home-tab') {
				$('#cont1').show();
			}
			if ($(event.target).attr('id') == 'v-pills-profile-tab') {

				$('#cont2').show();
			}
			if ($(event.target).attr('id') == 'v-pills-messages-tab') {
				$('#cont3').show();
			}
			if ($(event.target).attr('id') == 'v-pills-settings-tab') {
				$('#cont4').show();
			}
		});
	} //end of function (changeClick)

	function AllCntMsg() {
		$.ajax({
			url : "ajax/AllCntMsg",
			type : 'GET',
			dataType : 'json',
			data : {
				emp_no : "${emp_vo.emp_no}"
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				$('#sendMsg').empty();
				$('#noReadMsg').empty();
				$('#totalMsg').empty();
				$('#tempMsg').empty();
				
				$('#recipient-name').empty();
				
				$('#sendMsg').text(data.send);
				$('#noReadMsg').text(data.noread);
				$('#totalMsg').text(data.total);
				$('#tempMsg').text(data.temp);
				
				$('#recipient-name').append($('<option>').attr("value","").html("==선택하세요=="));	//dhfn	
				$.each(data.empInf, function(idx, item) {				
					
					$('#recipient-name').append(
							$('<option>').attr("value", item.emp_no).html(
									item.emp_name));
				});
			}
		});
	} //end of function (AllCntMsg)
	//사용자 조회 요청
	function empSelect() {
		//특정 사용자 조회
		$.ajax({
			url : 'ajax/selectempl',
			type : 'GET',
			data : {
				emp_no : "${emp_vo.emp_no}"
			},
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : empSelectResult
		});

	}//userSelect

	//사용자 조회 응답
	function empSelectResult(emp) {
		console.log(emp);

		$('#img').attr(
				'src',
				'${pageContext.request.contextPath}/resources/img/'
						+ emp.emp_profile);
		$('#regno').val(emp.emp_regno);
		$('#lic').val(emp.emp_lic);
		$('#tel').val(emp.emp_tel);
		$('#addr').val(emp.emp_addr);
		$('#no').val(emp.emp_no);
		$("#name").val(emp.emp_name);
		$('#room').val(emp.emp_room);
		$('select[name="role"]').val(emp.role).attr("selected", "selected");

	}//userSelectResult
	//img view

	$(function() {

		var fileTarget = $('.file-upload .upload-hidden');

		fileTarget.on('change',
				function() { // 값이 변경되면
					if (window.FileReader) { // modern browser
						var filename = $(this)[0].files[0].name;
					} else { // old IE
						var filename = $(this).val().split('/').pop().split(
								'\\').pop(); // 파일명만 추출
					}
					// 추출한 파일명 삽입
					$(this).siblings('.upload-name').val(filename);
				});

		$("#uf").on('change', function(e) {
			var files = e.target.files;
			var arr = Array.prototype.slice.call(files);
			for (var i = 0; i < files.length; i++) {
				if (!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
			}
			preview(arr);
		});

		function checkExtension(fileName, fileSize) {

			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 20971520; //20MB

			if (fileSize >= maxSize) {
				alert('파일 사이즈 초과');
				$("input[type='file']").val(""); //파일 초기화
				return false;
			}

			if (regex.test(fileName)) {
				alert('업로드 불가능한 파일이 있습니다.');
				$("input[type='file']").val(""); //파일 초기화
				return false;
			}
			return true;
		}

		function preview(arr) {
			arr
					.forEach(function(f) {

						//파일명이 길면 파일명...으로 처리
						var fileName = f.name;
						if (fileName.length > 10) {
							fileName = fileName.substring(0, 7) + "...";
						}

						//div에 이미지 추가
						var str = '<div style="display: inline-flex; padding: 10px;"><li>';
						str += '<span>' + fileName + '</span><br>';

						//이미지 파일 미리보기
						if (f.type.match('image.*')) {
							var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
							reader.onload = function(e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
								//str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';

								$('#img').attr('src', e.target.result);
								$('#img').attr('style',
										"width:150px; height: 160px");
							}
							reader.readAsDataURL(f);
						} else {
							$('#img').attr('src', e.target.result);
							$('#img').attr('style',
									"width:150px; height: 160px");
						}
					});//arr.forEach
		}
	});
</script>
</head>

<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<jsp:include page="/WEB-INF/views/header.jsp" />

				<div class="container-fluid" style="margin-top: 0px !important;">
					<!-- Content Row -->
					<div class="row" id="row">

						<div class="col-xl-6 col-md-6 mb-4 card">
							<div class="card-body" style="padding-top: 2.5rem;">
								<div>
									<form id='form1' method="post">
										<input type="hidden" name="emp_no" value="${emp_vo.emp_no}">
										<table style="margin: auto;">
											<!-- 이미지 파일 -->
											<tr>
												<!-- 이미지원형 -->
												<td><img id='img'
													src="${pageContext.request.contextPath}/resources/img/${emp_vo.emp_profile}"
													class="img-fluid rounded-circle mb-2"
													style="width: 150px; height: 160px"> <!-- 첨부파일 -->
												<td class="content" style="margin: 10px;">
											</tr>
										</table>
										<div class="btn-group file-upload btn-group-toggle" style="float: right;">
											<input type="hidden" class="upload-name" value="파일선택" /> <label for="uf">프로필사진 업로드</label> <input
												type="file" class="upload-hidden upload-name" id='uf' name="uf">
										</div>
									</form>
								</div>
								<!-- 추가 -->
								<div>
									<div id="profileInf">
										<table style="margin: auto;">
											<tr>
												<td>&nbsp;&nbsp;이름</td>
												<td id='name'>&nbsp;&nbsp;${emp_vo.emp_name}</td>
											</tr>
											<tr>
												<td>&nbsp;&nbsp;사원번호</td>
												<td id="no">${emp_vo.emp_no}</td>
											</tr>
											<tr>
												<td>&nbsp;&nbsp;주민등록번호</td>
												<td id='regno'>&nbsp;&nbsp;${emp_vo.emp_regno}</td>
											</tr>
											<tr>
												<td>&nbsp;&nbsp;면허 정보</td>
												<td id='lic'>&nbsp;&nbsp;${emp_vo.emp_lic}</td>
											</tr>
											<tr>
												<td>&nbsp;&nbsp;전화번호</td>
												<td><input type="text" value="${emp_vo.emp_tel}"
													id="tel" name="emp_tel"></td>
											</tr>
											<tr>
												<td>&nbsp;&nbsp;주소</td>
												<td><input type="text" value="${emp_vo.emp_addr}"
													id="addr" name="emp_addr"></td>
											</tr>
											<c:if test="${emp_vo.emp_author=='D'}">
												<tr>
													<td>&nbsp;&nbsp;진료실</td>
													<td id='room'>&nbsp;&nbsp;${emp_vo.emp_room} 진료실</td>
												</tr>
											</c:if>
										</table>
									</div>
								</div>
							</div>
							<div class="card-footer" style="height: 50px; text-align: right;">
								<a class="text-primary" href="#" data-toggle="modal"
									data-target="#UpdateModal" data-backdrop="static"
									style="font-size: 15px"> 비밀번호 변경 </a> / <a class="text-primary"
									href="#" data-toggle="modal" data-target="#UpdateModal2"
									data-backdrop="static" style="font-size: 15px"> 프로필 변경 </a>
							</div>
						</div>
						<div class="col-xl-6 col-md-6 mb-4 card">
							<div class="row1" style="margin-top: 40px;">
								<div class="col-xl-6 col-md-6 mb-4">
									<div class="card border-left-warning shadow h-100 py-2">
										<div class="card-body">
											<div class="row1 no-gutters align-items-center">
												<div class="col mr-2">
													<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
														당일 예약 건수</div>
													<div class="h5 mb-0 font-weight-bold text-gray-800" id="countResv">
														<div class="col-auto" style="float: right;">
															<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								
							<div class="col-xl-6 col-md-6 mb-4">
				<div class="card border-left-success shadow h-100 py-2">
					<div class="card-body">
						<div class="row1 no-gutters align-items-center">
							<div class="col mr-2">
								<div class="text-xs font-weight-bold text-success text-uppercase mb-1">
									월 매출</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800" id="monthSales">
							<div class="col-auto" style="float: right;">
								<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
								</div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
							
							
							
								<div class="col-xl-6 col-md-6 mb-4">
									<div class="card border-left-primary shadow h-100 py-2">
										<div class="card-body">
											<div class="row1 no-gutters align-items-center">
												<div class="col mr-2">
													<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
														일 매출</div>
													<div class="h5 mb-0 font-weight-bold text-gray-800" id="daySales">
														<div class="col-auto" style="float: right;">
															<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>


							</div>
						</div>

						<div class="card shadow py-2 main_in"
							style="height: 480px; width: 100%; padding: 5px 10px;">
							<aside>
								<div class="card shadow py-2" style="height: 462px; width: 20%;">
									<div class="card-body">
										<div>
											<div class="nav flex-column nav-pills" id="v-pills-tab"
												role="tablist" aria-orientation="vertical">
												<a class="nav-link active" id="v-pills-home-tab"
													data-toggle="pill" href="#v-pills-home" role="tab"
													aria-controls="v-pills-home" aria-selected="true">전체메일함
													<span class="badge badge-primary badge-pill" id="totalMsg">
												</span>
												</a> <a class="nav-link" id="v-pills-profile-tab"
													data-toggle="pill" href="#v-pills-profile" role="tab"
													aria-controls="v-pills-profile" aria-selected="false">읽지
													않은 메일함 <span class="badge badge-primary badge-pill"
													id="noReadMsg"> </span>
												</a> <a class="nav-link" id="v-pills-messages-tab"
													data-toggle="pill" href="#v-pills-messages" role="tab"
													aria-controls="v-pills-messages" aria-selected="false">보낸메일함
													<span class="badge badge-primary badge-pill" id="sendMsg">
												</span>
												</a> <a class="nav-link" id="v-pills-settings-tab"
													data-toggle="pill" href="#v-pills-settings" role="tab"
													aria-controls="v-pills-settings" aria-selected="false">임시저장함
													<span class="badge badge-primary badge-pill" id="tempMsg">
												</span>
												</a>
											</div>
										</div>
									</div>
								</div>
							</aside>

							<div id="note_bt1">
								<input type="button" id="wri_m_bt" value="메일쓰기">
								<!-- data-toggle="modal" data-target="#mailModal"
									data-backdrop="static" -->
							</div>
							<!-- 
								<div id="note_bt1">
								<ul>
									<li id="wri_m_bt"><a href="note/write.php">쪽지쓰기</a></li>
								</ul>
							</div> -->

							<div class="note_bt" style="display: block; top: 70px;" id="cont1">
								<table id="dataTab1">
									<thead>
										<tr>
											<!-- <th width="50" class="tc"><input type="checkbox" /></th> -->
											<th class="tl">사원 번호</th>
											<th class="tl">보낸 사람</th>
											<th class="tl">내용</th>
											<th class="tc">날짜</th>
											<th class="tc">수신여부</th>
											<th width='20%' class="tc">히든</th>
										</tr>

									</thead>
									<tbody>
									</tbody>
								</table>
							</div>

							<div class="note_bt" style="display: none" id="cont2">
								<table id="dataTab2">
									<thead>
										<tr>
											<th width='15%' class="tl">사원 번호</th>
											<th width='15%' class="tl">보낸 사람</th>
											<th width='55%' class="tl">내용</th>
											<th width='15%' class="tc">날짜</th>
											<th width='20%' class="tc">히든</th>
										</tr>

									</thead>
									<tbody>
									</tbody>
								</table>
							</div>

							<div class="note_bt" style="display: none" id="cont3">
								<table id="dataTab3">
									<thead>
										<tr>
											<!-- <th width="50" class="tc"><input type="checkbox" /></th> -->
											<th width='15%' class="tl">사원 번호</th>
											<th width='15%' class="tl">받는 사람</th>
											<th width='55%' class="tl">내용</th>
											<th width='15%' class="tc">날짜</th>
											<th width='20%' class="tc">히든</th>
										</tr>

									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
							<div class="note_bt" style="display: none" id="cont4">
								<table id="dataTab4">
									<thead>
										<tr>
											<th width='15%' class="tl">받는 사원번호</th>
											<th width='65%' class="tl">내용</th>
											<th width='20%' class="tc">날짜</th>
											<th width='20%' class="tc">히든</th>
										</tr>

									</thead>
									<tbody>
									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>
				<!-- End of Main Content -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

		<!-- Logout Modal-->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">수고하셨습니다</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">${emp_vo.emp_name}님정말로로그아웃하시겠습니까?</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="logout">Logout</a>
					</div>
				</div>
			</div>
		</div>
		<!-- Page level plugins -->
		<script
			src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>

		<!-- Page level custom scripts -->

		<!-- 편지모달 -->
		<div class="modal fade" id="mailModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">메일 쓰기</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="recipient-name" class="col-form-label">받는 사람</label>
								<select class="form-control" id="recipient-name"
									name="recipient-name">
									<option value="" selected>==선택하세요==</option>
								</select>
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">내용</label>
								<textarea class="form-control" id="message-text"
									name="message-text"></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="btnSave"
							name="btnSave" data-dismiss="modal">보내기</button>
						<button type="button" class="btn btn-secondary" id="btnTempSave"
							name="btnTempSave" data-dismiss="modal">임시저장</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Update Modal-->
		<div class="modal fade" id="UpdateModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">비밀번호 재확인</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
					</div>
					<div class="modal-body">
						<table>
							<tr>
								<td><span class="point">&nbsp;*</span>기존 비밀번호</td>
								<td><input type="password" id="oldpw" name="oldpw"
									placeholder="기존 비밀번호를 입력하시오"></td>

							</tr>
							<tr>
								<td><span class="point">&nbsp;*</span>비밀번호</td>
								<td><input type="password" id="pw" name="pw"
									placeholder="변경할 비밀번호를 입력하시오"></td>
							</tr>
							<tr>
								<td><span class="point">&nbsp;*</span>비밀번호 재입력</td>
								<td><input type="password" id="pw2" name="pw2"
									placeholder="비밀번호를 재입력하시오"></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="btnUpdate"
							data-dismiss="modal" name="btnUpdate">변경</button>
						<button class="btn btn-primary" type="button" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Update Modal2-->
		<div class="modal fade" id="UpdateModal2" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">프로필 변경</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
					</div>
					<div class="modal-body">프로필변경하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="btnUpdateImg"
							name="btnUpdateImg" data-dismiss="modal">변경</button>
						<button class="btn btn-primary" type="button" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>


		<!-- 확인 Modal-->
		<div class="modal fade" id="mailCheckModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">메일 확인</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="recipient-name" class="col-form-label">보내는
									사원번호</label> <input type="text" class="form-control"
									id="recipient-name1" name="recipient-name1" readonly>
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">내용</label>
								<textarea class="form-control" id="message-text1"
									name="message-text1" readonly></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" id="btnDelete"
							name="btnDelete" data-dismiss="modal">삭제</button>
					</div>
				</div>
			</div>
		</div>

		<!-- temp확인 Modal-->
		<div class="modal fade" id="mailTempCheckModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">메일 쓰기</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="recipient-name" class="col-form-label">받는 사람</label>
								<select class="form-control" id="recipient-name2"
									name="recipient-name2">
									<option value="" selected>==선택하세요==</option>
								</select>
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">내용</label>
								<textarea class="form-control" id="message-text2"
									name="message-text2"></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="TempSaveBtn"
							name="TempSaveBtn" data-dismiss="modal">보내기</button>
						<button type="button" class="btn btn-secondary" id="TempDeleteBtn"
							name="TempDeleteBtn" data-dismiss="modal">삭제</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 확인 Modal-->
		<div class="modal fade" id="mailCheckModal3" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">메일 확인</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="recipient-name" class="col-form-label">보낸
									사원번호</label> <input type="text" class="form-control"
									id="recipient-name3" name="recipient-name3" readonly>
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">내용</label>
								<textarea class="form-control" id="message-text3"
									name="message-text3" readonly></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" id="btnDeleteT" name="btnDelete" data-dismiss="modal">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>