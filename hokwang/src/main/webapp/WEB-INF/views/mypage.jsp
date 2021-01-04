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

.list-table {
	margin-left: 0;
	margin-top: 50px;
	width: 100%;
}

.list-table thead th {
	height: 30px;
	border-top: 2px solid #09C;
	border-bottom: 1px solid #CCC;
	font-weight: bold;
	font-size: 16px;
}

.list-table tbody td {
	padding: 10px 0;
	border-bottom: 1px solid #CCC;
	height: 20px;
	font-size: 14px;
}

.list-table tbody:hover {
	background: #f2f2f2;
}

.aside {
	width: 180px;
	height: 100%;
	background: #A9E2F3; /* Old browsers */
	background: -moz-linear-gradient(top, #A9E2F3 0%, #ffffff 100%);
	/* FF3.6-15 */
	background: -webkit-linear-gradient(top, #A9E2F3 0%, #ffffff 100%);
	/* Chrome10-25,Safari5.1-6 */
	top: 0;
	margin-left: 0;
	z-index: -100;
	position: absolute;
}

#note_menu {
	margin-top: 100px;
	line-height: 30px;
}

#main_in {
	/* margin: 53px; */
	position: absolute;
	left: 350px;
	width: 75%;
}

#note_bt {
	margin-top: 15px;
}

#note_bt ul li {
	float: left;
	margin-left: 20px;
}

#wri_m_bt {
	margin-left: 30px;
	padding: 10px 20px 10px 20px;
	background: #013ADF;
	border: 0;
	color: white;
	font-size: 12px;
}

#wri_m_bt:hover {
	background: #08298A;
	color: white;
}

#wri_m_bt a {
	color: white;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="container-fluid" style="margin-top: 0px !important;">
		<!-- Content Row -->
		<div class="row" id="row">

			<div class="col-xl-6 col-md-6 mb-4 card">
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
			<div class="col-xl-6 col-md-6 mb-4 card">
					<div class="card-body" id="profileInf">
						<table>
							<tr>
								<td>&nbsp;&nbsp;이름</td>
								<td>&nbsp;&nbsp;${emp_vo.emp_name}</td>
							</tr>
							<tr>
								<td>&nbsp;&nbsp;사원번호</td>
								<td id="no">${emp_vo.emp_no}</td>
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
								<td><input type="text" value="${emp_vo.emp_addr}" id="addr"
									name="addr"></td>
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
			<div class="card shadow py-2" style="height: 480px; width: 100%;">
				<aside>
					<div class="card shadow py-2" style="height: 462px; width: 20%;">
						<div class="card-body">
							<div>
								<div class="nav flex-column nav-pills" id="v-pills-tab"
									role="tablist" aria-orientation="vertical">
									<a class="nav-link active" id="v-pills-home-tab"
										data-toggle="pill" href="#v-pills-home" role="tab"
										aria-controls="v-pills-home" aria-selected="true">전체쪽지함 <span
										class="badge badge-primary badge-pill" id="totalMsg"> </span>
									</a> <a class="nav-link" id="v-pills-profile-tab"
										data-toggle="pill" href="#v-pills-profile" role="tab"
										aria-controls="v-pills-profile" aria-selected="false">읽지
										않은 쪽지함 <span class="badge badge-primary badge-pill"
										id="noReadMsg"> </span>
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
				</aside>


				<div id="main_in">
					<table class="list-table">
						<thead>
							<tr>
								<th width="50" class="tc"><input type="checkbox" /></th>
								<th width="150" class="tl">받는사람</th>
								<th width="600" class="tl">내용</th>
								<th width="200" class="tc">날짜</th>
								<th width="100" class="tc">수신여부</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td class="tc"><input type="checkbox" /></td>
								<td>받는이</td>
								<td>제목</td>
								<td class="tc">보낸시간</td>
								<td class="tc">
									<?php 
              if($recv['recv_chk'] == "0")
              {
                echo "읽지않음";
              }else{ 
                echo "읽음";
              }
            ?>
								</td>
							</tr>
						</tbody>
						<?php } ?>
					</table>
					<div id="note_bt">
						<ul>
							<li id="wri_m_bt"><a href="note/write.php">쪽지쓰기</a></li>
						</ul>
					</div>
				</div>

			</div>
		</div>
</body>
</html>