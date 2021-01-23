<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>

<script type="text/javascript">
	$(function() {
		medicineList();
		totalMediList();
		check();
		modalCheck();
		saveMedi();
	});

	function saveMedi() {
		$('#btnSave').on("click", function() {
			console.log($('.card-com').text());
			$.ajax({
				url : "ajax/saveMedi",
				type : 'POST',
				dataType : 'json',
				data : {
					medi_com : $('.card-com').text(),
					medi_name : $('.card-name').val(),
					medi_composition : $('.card-composition').text(),
					medi_no : $('.card-no').text(),
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(data) {
					if (data == 0) {
						alert("이미 저장된 값입니다.");
					} else
						alert("저장완료되었습니다.");
					$('#use_table').DataTable().ajax.reload();
				}
			});

		});

	}

	//모달띄우기
	function modalCheck() {
		$('#exampleModal').on('show.bs.modal', function(event) {
			var tds = $(event.relatedTarget).find('td');
			var modal = $(this);
			modal.find('.card-com').text(tds.eq(0).text());
			modal.find('.card-name').val(tds.eq(1).text())
			modal.find('.card-composition').text(tds.eq(2).text())
			modal.find('.card-no').text(tds.eq(3).text())

		});

	}
	//검색
	function check() {
		$('#Val').on("keyup", function() {
			if (event.keyCode == 13) {
				medicineList();
				console.log($('#Val').val());
			}
		})
	}
	//DB에서 저장된 약 정보 값가져오기
	function totalMediList() {

		var datatable = $('#use_table').DataTable({
			/* responsive : true,
			autoWidth : false, */
			ajax : {
				url : 'ajax/getMediList',
				dataSrc : ''
			},
			columns : [ {
				data : 'medi_com'
			}, {
				data : 'medi_name'
			}, {
				data : 'medi_composition'
			}, {
				data : 'medi_no'
			} ]
		});

		//삭제
		$('#use_table tbody').on('click', 'td', function() {
			var delno = datatable.row($(this).parents('tr')).data().medi_no;
			console.log(delno);

			var delInf = confirm("제품코드 " + delno + " 를 삭제 하시겠습니까?");
			if (delInf) {
				$.ajax({
					url : 'ajax/deleteMedi',
					type : 'POST',
					data : {
						medi_no : delno
					},
					error : function(xhr, status, msg) {
						alert("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(data) {
						alert("삭제됨");
						$('#use_table').DataTable().ajax.reload();

					}
				});

			}

		})

	}

	//api에서 약 api가져오기
	function medicineList() {
		$
				.ajax({
					url : "mediAPI",
					type : 'GET',
					dataType : 'xml',
					data : {
						Key : $('#Key').val(),
						Val : $('#Val').val()
					},
					error : function(xhr, status, msg) {
						alert("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(data) {
						console.log(data);
						
						$('#factory_tbody').empty();
						$(data).find("item").each(function() {
											var info = '<tr data-toggle="modal" data-target="#exampleModal">';
											info += '<td>'
													+ $(this).addClass(
															'form-control')
															.find("ENTRPS")
															.text() + '</td>';
											info += '<td>'
													+ $(this).addClass(
															'form-control')
															.find("PRDUCT")
															.text() + '</td>';
											info += '<td>'
													+ $(this).addClass(
															'form-control')
															.find("MTRAL_NM")
															.text() + '</td>';
											info += '<td>'
													+ $(this).addClass(
															'form-control')
															.find("MTRAL_CODE")
															.text() + '</td>';

											info += '</tr>';
											$('#factory_tbody').append(info);
										});
					}
				});
	}
</script>
</head>
<body>
	<div class="container-fluid" style="margin-top: 10px !important;">
		<!-- Content Row -->
		<div class="row">

			<!-- 왼쪽 칸 -->
			<div class="col-xl-5.5 col-md-6 mb-4">
				<div class="card shadow py-2" style="height: 800px;">
					<div>
						<select name='Key' id='Key' style="width: 150px; float: left; height: 30px; text-align: center; margin: 0 10px;">
							<option value='선택' selected>--선택--</option>
							<option value='company'>회사명</option>
							<option value='product'>제품명</option>
							<option value='page'>페이지 번호</option>
						</select><input style="width: 300px; float: left;" type="text"
							placeholder="검색어를 입력하시오" id='Val' name='Val'>
					</div>
					<table id="factory_table" class="table" style="margin-top: 10px;">
						<colgroup>
							<col width="30%" />
							<col width="40%" />
							<col width="40%" />
							<col width="30%" />

						</colgroup>

						<thead align="center">
							<tr>
								<th width="30%">회사명</th>
								<th width="40%">제품명</th>
								<th width="40%">성분</th>
								<th width="30%">제품코드</th>

								<!-- <th width="15%"><input type="button" value="추가"></th> -->
							</tr>
						</thead>

						<tbody id="factory_tbody" align="center">
						</tbody>

					</table>
				</div>
			</div>
			<!-- 오른쪽 칸 -->
			<div class="col-xl-6.5 col-md-6 mb-4">
				<div class="card shadow py-2" style="height: 800px; padding: 10px;">
					<p class="text-s font-weight-bold text-info" align="center">현재 사용중인 약품</p>
					<table id="use_table" class="table table-striped table-bordered"
						style="width: 100%">
						<thead align="center">
							<tr>
								<th>회사명</th>
								<th>제품명</th>
								<th>성분</th>
								<th>제품코드</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">약품 확인</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="card" style="width: 30rem;">
						<div class="card-body">
							회사 명 :
							<h5 class="card-com">회사명</h5>
							약 이름 : <br> <input type="text" class="card-name"><br>
							약 성분 :
							<h5 class="card-composition">약성분</h5>
							약 번호:
							<h5 class="card-no">약번호</h5>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnSave"
						name="btnSave" data-dismiss="modal">Save</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>