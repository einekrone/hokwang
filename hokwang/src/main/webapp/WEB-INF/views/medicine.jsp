<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="./resources/json.min.js"></script>
<script type="text/javascript">
	$(function() {
		medicineList();
		totalMediList();
		check();

	});

	function check() {
		$('#Val').on("keyup", function() {
			if (event.keyCode == 13) {
				medicineList();
				console.log($('#Val').val());
			}
		})
	}

	function totalMediList() {
		$.ajax({
			url : "ajax/getMediList",
			type : 'GET',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : mediResultList
		})
	}

	function mediResultList(data) {
		console.log(data);
		$("#mediTotalList").empty();
		$.each(data, function(idx, item) {
			$('<tr>').append($('<td>').html(item.medi_no)).append(
					$('<td>').html(item.medi_com)).append(
					$('<td>').html(item.medi_name)).append(
					$('<td>').html(item.medi_composition)).appendTo(
					'#mediTotalList');

		});
		$('#use_table').DataTable();
	}

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
						$(data)
								.find("item")
								.each(
										function() {
											var info = '<tr>';
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
											info += '<td>'
													+ '<button class="form-control">추가</button>'
													+ '</td>';
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
					<table id="factory_table" class="table" style="margin-top: 5px;">
						<colgroup>
							<col width="30%" />
							<col width="40%" />
							<col width="40%" />
							<col width="30%" />
							<col width="15%" />
						</colgroup>

						<thead align="center">
							<tr>
								<th width="15%">회사명</th>
								<th width="15%">제품명</th>
								<th width="20%">성분</th>
								<th width="35%">제품코드</th>
								<th width="15%">추가</th>
								<!-- <th width="15%"><input type="button" value="추가"></th> -->
							</tr>
						</thead>

						<tbody id="factory_tbody" align="center">
						</tbody>

					</table>
				</div>
				<table>
					<tr>
						<td><select name='Key' id='Key'>
								<option value='선택' selected>--선택--</option>
								<option value='company'>회사명</option>
								<option value='product'>제품명</option>
								<option value='page'>페이지 번호</option>
						</select><input style="width: 300px;" type="text" placeholder="검색어를 입력하시오"
							id='Val' name='Val'></td>
					</tr>
				</table>
			</div>
			<!-- 오른쪽 칸 -->
			<div class="col-xl-6.5 col-md-6 mb-4">
				<div class="card shadow py-2" style="height: 800px;">
					<p class="text-s font-weight-bold text-info" align="center">현재
						사용중인 약품</p>
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
						<tbody id="mediTotalList">
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>
</body>
</html>