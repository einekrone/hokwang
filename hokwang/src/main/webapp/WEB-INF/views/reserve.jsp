<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/resources/css/resvcss.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

	<script type="text/javascript">
		$(function() {
			$('.tgl-flat').change(function() {
				searchType = "chkType";
				if ($('.tgl-flat').is(":checked")) {
					keyword = "today";
				} else {
					keyword = "all";
				}
				console.log(">> " + keyword);
			});
		});
	</script>
	<div class="container-fluid" style="margin-top: 10px !important;">
		<!-- Content Row -->
		<div class="row">

			<!-- 1번 -->
			<div class="col-xl-3 col-md-6 mb-4">
				<form style="margin: 0 0 10px 0 !important; width: 100%;"
					class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control border-0 small"
							placeholder="예약환자명" aria-label="Search"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
				<div class="card shadow py-2" style="height: 250px;">
					<div class="card-body">
						<p>환자정보</p>
					</div>
				</div>
				<div class="card shadow py-2" style="height: 100px; margin: 10px 0;">
					<div class="card-body">
						<p>특이사항</p>
					</div>
				</div>
				<div class="card shadow py-2" style="height: 380px;">
					<div class="card-body">
						<p>진료/예약 이력</p>
						<table border="1"
							style="border-collapse: collapse; width: 100%; text-align: center;">
							<tr>
								<td>No</td>
								<td>일시</td>
								<td>설명</td>
								<td>사진</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<!-- 2번 -->
			<div class="col-xl-3 col-md-6 mb-4 column">
				<div class="card shadow py-2" style="height: 800px;">
					<div class="card-body">
						<div class="text-s font-weight-bold text-primary"
							style="margin-bottom: 20px;">
							<!-- <span>전체 예약 환자</span><span style="float: right;"><input type="checkbox" />당일 환자</span> -->
							<span>전체 예약 환자</span> <span
								class="mb-0 font-weight-bold text-gray-800"
								style="float: right; margin: 4px 0 0 5px;">당일만</span> <span
								style="float: right;"> <input class="tgl tgl-flat"
								id="cb4" type="checkbox" /> <label class="tgl-btn" for="cb4"></label>
							</span>
						</div>

						<!-- 여기에 예약 환자 목록 -->
					</div>
				</div>
			</div>

			<!-- 3번 -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card shadow py-2" style="height: 260px;">
					<div class="card-body">
						<p class="text-s font-weight-bold">진료실 1</p>
					</div>
				</div>
				<div class="card shadow py-2" style="height: 260px; margin: 10px 0;">
					<div class="card-body">
						<p class="text-s font-weight-bold">진료실 2</p>
					</div>
				</div>
				<div class="card shadow py-2" style="height: 260px;">
					<div class="card-body">
						<p class="text-s font-weight-bold">진료실 3</p>
					</div>
				</div>
			</div>

			<!-- 4번 -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card shadow py-2" style="height: 395px;">
					<div class="card-body">
						<p class="text-s font-weight-bold text-warning">수납 대기</p>
					</div>
				</div>
				<div class="card shadow py-2" style="height: 395px; margin: 10px 0;">
					<div class="card-body">
						<p class="text-s font-weight-bold text-info">수납 완료</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>