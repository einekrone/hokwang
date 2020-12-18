<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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