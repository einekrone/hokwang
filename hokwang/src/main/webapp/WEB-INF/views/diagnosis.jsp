<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/diagnosis.css">
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
								<image src="${pageContext.request.contextPath}/DD.JPG" id="title_logo"></image>
						
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
								<th class="tit" id = "baby_regno_title">주민등록번호</th>
								<td><span class="cont" id = "baby_regno1">930402</span> - 
								<span class="cont" id = "baby_regno2">1611111</span></td>
							</tr>
							<!-- 혈액형 -->
							<tr id="nbda">
								<th ><span class="tit" id="baby_blood"></span>혈액형</th>
								<td ><span class="cont" id="baby_blood">청일이형</span></td>
							</tr>
							
						<!-- 보호자정보 -->
							<tr id="nbda">
								<th><span class="tit" id="baby_blood"></span>보호자정보</th>
							</tr>
							<!-- 보호자이름 -->
							<tr id="nbda">
								<th><span class="tit" id="parent_name_title"></span>보호자이름</th>
								<td ><span class="cont" id="baby_blood">공유</span></td>
							</tr>
							
							<!-- 주소 -->
							<tr id="nbda">
								<th><span class="tit" id="parent_addr_title"></span>주소</th>
								<td ><span class="cont" id="parent_addr">대구광역시 수성구 무학로</span></td>
								<td ><span class="cont" id="parent_addrDetail">999길 999-999</span></td>
							</tr>	
					</table>
					</div> <!-- end of wrapeer -->
				</div>
					
			<!-- 특이사항 -->	
				<div class="card shadow py-2" style="height: 150px;">
					<div class="card-body">
						
						<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<image src="${pageContext.request.contextPath}/DD.JPG" id="title_logo"></image>
						
							<!-- content -->
								<span class="tit" id="baby_unusual_title" style="font-weight: 600;">특이사항</span>
							</div>
							<span class="cont" id="baby_unusual">너무 잘생김</span>
						</div>
					
					</div>
				</div>
			<!-- 환자리스트 -->	
				<div class="card shadow py-2" style="height: 410px;">
					<div class="card-body">
						<div id="content">
						<%-- 	<jsp:include page="#" /> --%>

						<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#">대기환자</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#">당일예약</a></li>
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
			<div class="col-xl-6 col-md-6 mb-4">
			
			<!-- 사진 -->
			<div class="card shadow py-2" style="height: 300px; float: left; width : 50%">
					<div class="card-body">
					<!-- Title -->
						<div>
							<!-- logo -->
							<div class="title_logo">
								<image src="${pageContext.request.contextPath}/DD.JPG" id="title_logo"></image>
						
							<!-- content -->
								<span class="tit" style="font-weight: 600;">상세 사진</span>
							</div>
						</div>
					
					<!-- 사진 -->
						<div>
							<image src="${pageContext.request.contextPath}/DD.JPG" id="baby_pic"></image>
						</div>
					</div>
			</div>
			
			<!-- 성장 차트 -->
			<div class="card shadow py-2" style="height: 300px; float: left; width : 50%">
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
								<image src="${pageContext.request.contextPath}/DD.JPG" id="title_logo"></image>
						
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
						<div style="width:60%; float:right;">
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
									<td>
										 <td>이탈리안 비엠티</td>
										 <tr>
										 	<td>1 </td>
										 	<td>1</td>
										 	<td>1</td>
										 </tr>
									</td>	
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- 진료 4 -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card shadow py-2" style="height: 840px;">
					<div class="card-body">88</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>