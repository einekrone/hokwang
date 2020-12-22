<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/diagnosis.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="jquery.jqGrid-4.4.3/css/ui.jqgrid.css">

<script src="jquery.jqGrid-4.4.3/js/jquery-1.7.2.min.js"></script>
<script src="jquery.jqGrid-4.4.3/js/i18n/grid.locale-kr.js"></script>
<script src="jquery.jqGrid-4.4.3/js/jquery.jqGrid.min.js"></script>
<script src="./resources/json.min.js"></script>
<script type="text/javascript">
	$(function() {
		babyList();
	});

	function babyList() {
		$.ajax({
			url : 'diagnosis',
			type : 'GET',
			//contentType:'application/json;charset=utf-8',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : babyListResult
		});
	}

	function babyListResult() {
		$("tbody").empty();
		$.each(data, function(idx, item) {
			$('<tr>').append($('<td>').html(item.baby_no)).append(
					$('<td>').html(item.baby_name)).append(
					$('<td>').html(item.baby_blood)).append(
					$('<td>').html(item.baby_gender)).append(
					$('<td>').html('<button id=\'btnSelect\'>조회</button>'))
					.append(
							$('<td>').html(
									'<button id=\'btnDelete\'>삭제</button>'))
				.appendTo('tbody');
		});//each
	}
</script>
</head>
<body>
	<!-- 진료 전체 -->
	<div class="container-fluid" style="margin-top: 10px !important;">
		<!-- Content Row -->
		<div class="row">

			<!-- 진료 1 -->
			<div class="col-xl-3 col-md-6 mb-4">
				<!-- 환자정보 -->
				<div class="card shadow py-2" style="height: 280px;">
					<!-- wrapeer -->
					<div class="card-body">

						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-user"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">환자정보</span>
							</div>
						</div>

						<!-- 환자기초정보 -->
						<table id="noborder_table">
							<tr class="baby_info_wrapper" id="nbda">
								<td><span class="" id="baby_no">No.1</span></td>
								<td><span class="" id="baby_name">이동욱</span></td>
								<td><span class="" id="baby_birth">남/336개월</span></td>
							</tr>
						</table>

						<!-- 환자 상세정보 -->
						<table id="noborder_table">
							<!-- 주민등록번호 -->
							<tr id="nbda">
								<th class="tit" id="baby_regno_title">주민등록번호</th>
								<td><span class="cont" id="baby_regno1">930402</span> - <span
									class="cont" id="baby_regno2">1611111</span></td>
							</tr>
							<!-- 혈액형 -->
							<tr id="nbda">
								<th><span class="tit" id="baby_blood"></span>혈액형</th>
								<td><span class="cont" id="baby_blood">청일이형</span></td>
							</tr>

							<!-- 보호자정보 -->
							<tr id="nbda">
								<th><span class="tit" id="baby_blood"></span>보호자정보</th>
							</tr>
							<!-- 보호자이름 -->
							<tr id="nbda">
								<th><span class="tit" id="parent_name_title"></span>보호자이름</th>
								<td><span class="cont" id="baby_blood">공유</span></td>
							</tr>

							<!-- 주소 -->
							<tr id="nbda">
								<th><span class="tit" id="parent_addr_title"></span>주소</th>
								<td><span class="cont" id="parent_addr">대구광역시 수성구
										무학로</span></td>
								<td><span class="cont" id="parent_addrDetail">999길
										999-999</span></td>
							</tr>
						</table>
					</div>
					<!-- end of wrapeer -->
				</div>

				<!-- 특이사항 -->
				<div class="card shadow py-2" style="height: 150px;">
					<div class="card-body">

						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-check"></i>

								<!-- content -->
								<span class="tit" id="baby_unusual_title"
									style="font-weight: 600;">특이사항</span>
							</div>
							<span class="cont" id="baby_unusual">너무 잘생김</span>
						</div>

					</div>
				</div>
				<!-- 환자리스트 -->
				<div class="card shadow py-2" style="height: 410px;">
					<div class="card-body">
						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-user"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">환자리스트</span>
							</div>
						</div>


						<div id="content">
							<%-- 	<jsp:include page="#" /> --%>

							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#">대기환자</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#">당일예약</a></li>
							</ul>

							<div class="tab-content">
								<div class="tab-pane fade show active" id="reserve">
									<%-- 	<jsp:include page="" /> --%>
								</div>
								<div class="tab-pane fade" id="diagnosis">


									<%-- <jsp:include page="" /> --%>
								</div>
							</div>
							<!-- /.container-fluid -->
						</div>
					</div>
				</div>
			</div>


			<!-- 진료 2 -->
			<div class="col-xl-5 col-md-6 mb-4">

				<!-- 사진 -->
				<div class="card shadow py-2"
					style="height: 300px; float: left; width: 50%">
					<div class="card-body">
						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="far fa-image"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">상세 사진</span>
							</div>
						</div>

						<!-- 사진 -->
						<div>
							<image src="${pageContext.request.contextPath}/DD.JPG"
								id="baby_pic"></image>
						</div>
					</div>
				</div>

				<!-- 성장 차트 -->
				<div class="card shadow py-2"
					style="height: 300px; float: left; width: 50%">
					<div class="card-body">
						<div class="chart-area">
							<canvas id="myAreaChart"></canvas>
						</div>
					</div>
				</div>

				<!-- 환자 기록 -->
				<div class="card shadow py-2" style="height: 540px;">
					<div class="card-body">
						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-file-medical"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">진료 기록</span>
							</div>
						</div>


						<!-- 진료 기록 -->
						<div style="width: 40%; float: left">
							<table id="noborder_table">
								<tr id="nbab">
									<td>2020-12-18</td>
									<td>코끼리</td>
								</tr>
							</table>
						</div>

						<!-- 진료 기록 상세 -->
						<div style="width: 60%; float: right;">
							<table id="noborder_table">
								<tr id="nbab">
									<th>날짜</th>
									<td>2020-12-18</td>
								</tr>
								<tr>
									<th>기록</th>
									<td>배가 고파서 밥을 먹었다.</td>
								</tr>
								<tr>
									<th>상병</th>
									<td>급성 배고픔</td>
								</tr>
								<tr>
									<th>처방</th>
									<td>이탈리안 비엠티</td>
									<td>에그마요추가</td>
									<td>아메리칸치즈</td>
									<td>랜치</td>
									<td>후추</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- 진료 4 -->
			<div class="col-xl-4 col-md-6 mb-4">

				<!-- 외래기록 -->
				<div class="card shadow py-2" style="height: 200px;">
					<div class="card-body">
						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-pencil-alt"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">외래기록</span>
							</div>
						</div>

						<!--소견내용  -->
						<div>
							<input class="cont" id="patient_records" name="records">
						</div>
					</div>
				</div>

				<!-- 상병 -->
				<div class="card shadow py-2" style="height: 320px;">
					<div class="card-body">
						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-stethoscope"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">상병</span>
							</div>
						</div>
						<!-- 상병 내용 table -->
						<table class="table text-center">
							<thead>
								<tr>
									<th class="text-center">아이디</th>
									<th class="text-center">이름</th>
									<th class="text-center">성별</th>
									<th class="text-center">거주지</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
						<!-- 						<table>
							<tr>
								<td>코드</td>
								<td>상병명</td>
								<td>좌 우</td>
							</tr>
							<tr>
								<td>123</td>
								<td>급성 비인두염[감기]</td>
								<td><span style="margin: 4px 0 0 5px;">좌</span>
								<input class="chk" type="checkbox">
								<span style="margin: 4px 0 0 5px;">우</span>
								<input class="chk" type="checkbox"></td>
							</tr>
						</table> -->
						<table id="list1"></table>
						<div id="pager1"></div>
					</div>
				</div>

				<!-- 처방 -->
				<div class="card shadow py-2" style="height: 320px;">
					<div class="card-body">
						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<i class="fas fa-capsules"></i>

								<!-- content -->
								<span class="tit" style="font-weight: 600;">처방</span>
							</div>
						</div>

						<!-- 처방 내용 table -->

						<table>
							<tr>
								<td>코드</td>
								<td>처방명</td>
								<td>용량</td>
								<td>일투</td>
								<td>일수</td>
								<td>용법</td>
								<td>특정내역</td>
							</tr>
							<tr>
								<td>123</td>
								<td>어린이부루펜시럽(내복)</td>
								<td>28</td>
								<td>4</td>
								<td>2</td>
								<td>fev</td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>