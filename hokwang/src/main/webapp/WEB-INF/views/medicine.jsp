<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="jquery.jqGrid-4.4.3/js/jquery-1.7.2.min.js"></script>
 -->
<!-- <script src="jquery.jqGrid-4.4.3/js/i18n/grid.locale-kr.js"></script>
<script src="jquery.jqGrid-4.4.3/js/jquery.jqGrid.min.js"></script> -->
<script src="./resources/json.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		medicineList();
	});

	function medicineList() {
		$.ajax({
			url : "mediAPI",
			type : 'GET',
			dataType : 'xml',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				console.log(data);

				$(data).find("item").each(function() {
							var info = '<tr>';
							info += '<td>' + $(this).addClass('form-control').find("ENTRPS").text()+'</td>';
							info += '<td>' + $(this).addClass('form-control').find("PRDUCT").text()+'</td>';
							info += '<td>' + $(this).addClass('form-control').find("MTRAL_NM").text()+'</td>';
							info += '<td>' + $(this).addClass('form-control').find("MTRAL_CODE").text() +'</td>';
							info += '<td>' + '<button class="form-control">추가</button>' +'</td>';
							info += '</tr>';

							$('#factory_tbody').append(info);

						});

				//data.getElementsByTagName("body").getElementsByTagName("pageNo"));
			}
		//console.log(data.getElementsByTagName("body"));	

		});
	}
	/* 
	 function medicineList(data) {
	 //$("#factory_tbody").empty();
	 console.log(data);
	
	 } */
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
								<th width="15%"><input type="button" value="추가"></th>
							</tr>
						</thead>

						<tbody id="factory_tbody" align="center">
	
						</tbody>
					</table>
				</div>
				<table>
					<tr>
						<td><select name='fruits'>
								<option value='' selected>-- 선택 --</option>
								<option value='#'>회사명</option>
								<option value='#'>제품명</option>
								<option value='#'>성분</option>
								<option value='#'>제품코드</option>
						</select> <input style="width: 300px;" type="text" placeholder="검색어를 입력하시오"></td>
					</tr>
				</table>
			</div>
			<!-- 오른쪽 칸 -->
			<div class="col-xl-6.5 col-md-6 mb-4">
				<div class="card shadow py-2" style="height: 800px;"></div>
			</div>
		</div>
	</div>
</body>
</html>