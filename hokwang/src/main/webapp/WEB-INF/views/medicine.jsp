<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="jquery.jqGrid-4.4.3/js/jquery-1.7.2.min.js"></script>
 --><!-- <script src="jquery.jqGrid-4.4.3/js/i18n/grid.locale-kr.js"></script>
<script src="jquery.jqGrid-4.4.3/js/jquery.jqGrid.min.js"></script> -->
<script src="./resources/json.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		medicineList();
	});
	
	function medicineList() {
		$.ajax({
			//url : "http://apis.data.go.kr/1470000/MdcinPatentInfoService/getMdcinPatentInfoList?serviceKey=9WNgCMAquzZlWmN4n%2Fn2noX%2FYPGO6FK5FMU8Jh0XgryTTRUlglPOn14fxnTwaL8CMtu2%2FEy3kglKLsnuxRCNgQ%3D%3D",
			url:"http://apis.data.go.kr/1470000/MdcinPatentInfoService/getMdcinPatentInfoList?serviceKey=9WNgCMAquzZlWmN4n%2Fn2noX%2FYPGO6FK5FMU8Jh0XgryTTRUlglPOn14fxnTwaL8CMtu2%2FEy3kglKLsnuxRCNgQ%3D%3D",
			type : 'GET',
			//contentType:'application/json;charset=utf-8',
			dataType : 'xml',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data){
				console.log(data); 
			}
		});
	}
	
	function babyListResult(data) {
		$("#factory_tbody").empty();
		$.each(data, function(idx, item) {
					$('<tr>')
					.append($('<td>').html(item.baby_no))
					.append($('<td>').html(item.baby_name))
					.append($('<td>').html(item.baby_blood))
					.append($('<td>').html(item.baby_gender))
					.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
					.append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
				    .appendTo('#aaa');
		});//each
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
							<col width="15%" />
							<col width="15%" />
							<col width="20%" />
							<col width="40%" />
							<col width="10%" />
						</colgroup>

						<thead align="center">
							<tr>
								<th width="15%">약번호</th>
								<th width="15%">투여경로</th>
								<th width="20%">제형 구분</th>
								<th width="35%">성분</th>
								<th width="15%"><input type="button" value="추가"></th>
							</tr>
						</thead>

						<tbody id="factory_tbody">
							<tr>
								<td><input type="text" class="form-control"
									placeholder="ex)약번호"></td>
								<td><input type="text" class="form-control" placeholder=""
									onkeypress="return event.charCode >= 48 && event.charCode <= 57">
								</td>
								<td><input type="text" class="form-control"></td>
								<td><input type="text" class="form-control"></td>
								<td><input type="checkbox" class="form-control" value="추가"></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				<table>
					<tr>
						<td><select name='fruits'>
								<option value='' selected>-- 선택 --</option>
								<option value='#'>약품명</option>
								<option value='#'>투여경로</option>
								<option value='#'>제형구분</option>
								<option value='#'>성분</option>
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