<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script>
	$(function() {
		notReadMsg();
		totalGetMsg();
		sendCntMsg();
		changeClick();
		updateInf();
	});

	function updateInf() {
		$('#btnUpdate').on("click", function() {
			$.ajax({
				url : "ajax/updateInf",
				type : 'POST',
				/* dataType : 'json', */
				data : {
					emp_no : $('#no').text(),
					emp_tel : $('#tel').val(),
					emp_addr : $('#addr').val(),
					emp_pwd : $('#pw').val(),
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(data) {	
					alert("변경되었습니다.");
				}
			});
		});

	}

	function changeClick() {
		$('#v-pills-tab').on('click', 'a', function(event) {
			$(event.target).siblings().attr('class', 'nav-link');
			$(event.target).attr('class', 'nav-link active');
		});
	}

	function sendCntMsg() {
		$.ajax({
			url : "ajax/sendCountMsg",
			type : 'GET',
			dataType : 'json',
			data : {
				emp_no : "${emp_vo.emp_no}"
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				$('#sendMsg').text(data);
			}
		})

	}

	function notReadMsg() {
		$.ajax({
			url : "ajax/getCountMsg",
			type : 'GET',
			dataType : 'json',
			data : {
				emp_no : "${emp_vo.emp_no}"
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				$('#noReadMsg').text(data);
			}
		})

	}

	function totalGetMsg() {
		$.ajax({
			url : "ajax/getToalCountMsg",
			type : 'GET',
			dataType : 'json',
			data : {
				emp_no : "${emp_vo.emp_no}"
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				$('#totalMsg').text(data);
			}
		})

	}
</script>
<style>
.row {
	margin: 30px 180px 0px 180px;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="container-fluid" style="margin-top: 0px !important;">
		<!-- Content Row -->
		<div class="row" id="row">
			<div class="col-xl-12 col-md-6 mb-4">
				<div class="card shadow py-2"
					style="height: 350px; float: left; width: 20%">
					<div class="card-body">
						<table>
							<!-- 이미지 파일 -->
							<tr>
								<td><img
									src="${pageContext.request.contextPath}/resources/img/${emp_vo.emp_profile}"
									style="width: 150px; height: 160px"><br> <!-- 첨부파일 -->
									<input type="file" name="uploadFile" /><br /> <input
									type="submit" value="저장"></td>
								<td class="content" style="margin: 10px;">
							</tr>

						</table>
					</div>
					<div class="card-footer" style="height: 50px;">

						<a class="text-primary" id="btnUpdate" style="font-size: 15px">
							프로필 변경 </a>
						<!-- 	<button class = "text-primary" id="btnUpdate"
							style="font-size: 15px"> 프로빌 변경
						</button> -->

						<a class="text-primary" href="<c:url value='logout' />"
							style="font-size: 15px">로그아웃 </a>

					</div>
				</div>
				<div class="card shadow py-2"
					style="height: 350px; float: left; width: 50%">
					<div class="card-body" id="profileInf">
						<table>
							<tr>
								<td>&nbsp;&nbsp;이름</td>
								<td>&nbsp;&nbsp;${emp_vo.emp_name}</td>
							</tr>
							<tr>
								<td>&nbsp;&nbsp;사원번호</td>
								<td id="no">&nbsp;&nbsp;${emp_vo.emp_no}</td>
							</tr>
							<tr>
								<td><span class="point">&nbsp;*</span>비밀번호</td>
								<td><input type="text" id="pw" name="pw"
									placeholder="비밀번호를 재입력하시오"></td>
							</tr>
							<tr>
								<td>&nbsp;&nbsp;주민등록번호</td>
								<td>&nbsp;&nbsp;${emp_vo.emp_regno}</td>
							</tr>
							<tr>
								<td>&nbsp;&nbsp;면허 정보</td>
								<td>&nbsp;&nbsp;${emp_vo.emp_lic}</td>
							</tr>
							<tr>
								<td>&nbsp;&nbsp;전화번호</td>
								<td><input type="text" value="${emp_vo.emp_tel}" id="tel"
									name="tel"></td>
							</tr>
							<tr>
								<td>&nbsp;&nbsp;주소</td>
								<td><input type="text" value="${emp_vo.emp_addr}"
									id="addr" name="addr"></td>
							</tr>
							<c:if test="${emp_vo.emp_author=='D'}">
								<tr>
									<td>&nbsp;&nbsp;진료실</td>
									<td>&nbsp;&nbsp;${emp_vo.emp_room} 진료실</td>
								</tr>
							</c:if>

						</table>
					</div>
				</div>

			</div>
			<div class="card shadow py-2" style="height: 480px; width: 100%;">
				<div class="card shadow py-2" style="height: 462px; width: 20%;">
					<div class="card-body">
						<div>
							<div class="nav flex-column nav-pills" id="v-pills-tab"
								role="tablist" aria-orientation="vertical">
								<a class="nav-link active" id="v-pills-home-tab"
									data-toggle="pill" href="#v-pills-home" role="tab"
									aria-controls="v-pills-home" aria-selected="true">전체쪽지함 <span
									class="badge badge-primary badge-pill" id="totalMsg"> </span>
								</a> <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill"
									href="#v-pills-profile" role="tab"
									aria-controls="v-pills-profile" aria-selected="false">읽지 않은
									쪽지함 <span class="badge badge-primary badge-pill" id="noReadMsg">
								</span>
								</a> <a class="nav-link" id="v-pills-messages-tab"
									data-toggle="pill" href="#v-pills-messages" role="tab"
									aria-controls="v-pills-messages" aria-selected="false">보낸쪽지함
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
			</div>
		</div>
	</div>
</body>
</html>