<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

		<!-- Content Row -->
		<div class="row">

			<!-- 1 -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card shadow py-2" style="height: 400px;">
					<div class="card-body">환자정보</div>
				</div>
				<div class="card shadow py-2" style="height: 400px;">
					<div class="card-body">
						체중 신장 차트
						<div class="chart-area">
							<canvas id="myAreaChart"></canvas>
						</div>
					</div>
				</div>
			</div>

			<!-- 2-->
			<div class="col-xl-6 col-md-6 mb-4">
				<div class="card shadow py-2" style="height: 400px;">
					전체환자 리스트
					<table border="1">
						<tr align=center>
							<td >번호</td>
							<td >이름</td>
							<td >생년월일</td>
							<td >전화번호</td>
						</tr>
						<tr align=center>
							<td >${name}</td>
							<td >${id}</td>
							<td >3</td>
							<td >4</td>
						</tr>
					</table>
					<!--전체환자 리스트  -->
				</div>
				<div class="card shadow py-2"
					style="height: 400px; float: left; width: 50%">
					환자 진료 내역
					<table border="1">
						<tr align=center>
							<td >번호</td>
							<td >이름</td>
							<td >생년월일</td>
							<td >전화번호</td>
						</tr>
					</table>
					<!-- 환자 진료 리스트 -->
				</div>
				<div class="card shadow py-2"
					style="height: 400px; float: left; width: 50%">
					환자 진료 내역
					<!-- 환지 진료 리스트 -->
				</div>
			</div>

			<!-- Pending Requests Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card shadow py-2" style="height: 800px;">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xs font-weight-bold text-warning text-uppercase mb-1">
									접종</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800"
									style="float: left">
									18
									<table border="1" width="250px" >
										<tr >
											<td align=center>접종명</td>
											<td align=center>상태</td>
										</tr>
										<tr >
											<td align=center>접종명</td>
											<td align=center><input type="button" id="" name="" value="접종완료"></td>
										</tr>
									</table>
									<input type="text" id="" name="" value="접종완료" style="width:250px">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
