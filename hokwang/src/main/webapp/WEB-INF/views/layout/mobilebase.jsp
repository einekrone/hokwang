<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOHO</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Responsive Admin &amp; 홈 Template based on Bootstrap 5">
<meta name="author" content="호광 병원">
<meta name="keywords"
	content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/icons/icon-48x48.png" />

<link href="${pageContext.request.contextPath}/resources/css/mobile.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		changeMenu();
		//alertCntAction();
	});
	/*
	function alertCntAction(){
		$.ajax({
			url : "ajax/alertCntAction",
			type : 'GET',
			dataType : 'json',
			data : {
				parent_no : "${vo.parent_no}"
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {

			}
		})
	}
	
	*/
	
	function changeMenu() {
		console.log("changeMenu");
		// todo: 메뉴 클릭 시 색상변경
		/* $(".sidebar-nav").on("click", "li", function(event) {
			console.log("click");
			$(event.target).siblings().removeClass("active");
			$(event.target).siblings().attr('class', 'sidebar-item');
			$(event.target).attr('class', 'sidebar-item active');
		}); */
	}
</script>
</head>
<body>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="mobile"> <span
					class="align-middle">호광 병원</span>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">Pages</li>

					<li class="sidebar-item active"><a class="sidebar-link"
						href="mobile"> <i class="align-middle" data-feather="sliders"></i>
							<span class="align-middle">홈</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="mmypage"> <i class="align-middle" data-feather="user"></i>
							<span class="align-middle">마이페이지</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link" href="child">
							<i class="align-middle" data-feather="book"></i> <span
							class="align-middle">자녀 관리</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link" href="pay">
							<i class="align-middle" data-feather="credit-card"></i> <span
							class="align-middle">결제 관리</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link" href="doc">
							<i class="align-middle" data-feather="book"></i> <span
							class="align-middle">증명서 관리</span>
					</a></li>

					<li class="sidebar-item"><a href="#resv"
						data-toggle="collapse" class="sidebar-link collapsed"> <i
							class="align-middle" data-feather="users"></i> <span
							class="align-middle">예약 관리</span>
					</a>
						<ul id="resv" class="sidebar-dropdown list-unstyled collapse "
							data-parent="#sidebar">
							<li class="sidebar-item"><a class="sidebar-link"
								href="resv?type=T">당일 예약</a></li>
							<li class="sidebar-item"><a class="sidebar-link"
								href="resv?type=R">우선 예약</a></li>
						</ul></li>
				</ul>

				<div class="sidebar-cta">
					<div class="sidebar-cta-content">
						<strong class="d-inline-block mb-2">광고 제목</strong>
						<div class="mb-3 text-sm">광고 내용</div>

					</div>
				</div>
			</div>
		</nav>

		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle d-flex"> <i
					class="hamburger align-self-center"></i>
				</a>

				<form class="d-none d-sm-inline-block">
					<div class="input-group input-group-navbar">
						<input type="text" class="form-control" placeholder="Search…"
							aria-label="Search">
						<button class="btn" type="button">
							<i class="align-middle" data-feather="search"></i>
						</button>
					</div>
				</form>

				<div class="navbar-collapse collapse">
				<!-- 로그인모양 -->
					<ul class="navbar-nav navbar-align">
						<li class="nav-item">
						<a class="nav-icon" href="loginM" >
							<img src="${pageContext.request.contextPath}/resources/img/logM.png"
								 style="width: 35px; height: 30px;" />
						</a>
						</li>
					</ul>

				

					<c:if test="${parent_vo != null }">
					<ul class="navbar-nav navbar-align">
						<li class="nav-item dropdown"><a
							class="nav-icon dropdown-toggle" href="#" id="alertsDropdown"
							data-toggle="dropdown">
								<div class="position-relative">
									<i class="align-middle" data-feather="bell"></i> 
									<span class="indicator" id="alertCnt">4</span>
								</div>
						</a>
							<div
								class="dropdown-menu dropdown-menu-lg dropdown-menu-right py-0"
								aria-labelledby="alertsDropdown">
								<div class="dropdown-menu-header">4 New Notifications</div>
								<div class="list-group">
									<a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="text-danger" data-feather="alert-circle"></i>
											</div>
											<div class="col-10">
												<div class="text-dark">Update completed</div>
												<div class="text-muted small mt-1">Restart server 12
													to complete the update.</div>
												<div class="text-muted small mt-1">30m ago</div>
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="text-warning" data-feather="bell"></i>
											</div>
											<div class="col-10">
												<div class="text-dark">Lorem ipsum</div>
												<div class="text-muted small mt-1">Aliquam ex eros,
													imperdiet vulputate hendrerit et.</div>
												<div class="text-muted small mt-1">2h ago</div>
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="text-primary" data-feather="home"></i>
											</div>
											<div class="col-10">
												<div class="text-dark">Login from 192.186.1.8</div>
												<div class="text-muted small mt-1">5h ago</div>
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="text-success" data-feather="user-plus"></i>
											</div>
											<div class="col-10">
												<div class="text-dark">New connection</div>
												<div class="text-muted small mt-1">Christina accepted
													your request.</div>
												<div class="text-muted small mt-1">14h ago</div>
											</div>
										</div>
									</a>
								</div>
								<div class="dropdown-menu-footer">
									<a href="#" class="text-muted">Show all notifications</a>
								</div>
							</div></li>

						<!-- 톱니모양 -->
						<li class="nav-item dropdown"><a
							class="nav-icon dropdown-toggle d-inline-block d-sm-none"
							href="#" data-toggle="dropdown"> <i class="align-middle"
								data-feather="settings"></i>
						</a> <a class="nav-link dropdown-toggle d-none d-sm-inline-block"
							href="#" data-toggle="dropdown"> <img
								src="${pageContext.request.contextPath}/resources/img/avatar.jpg"
								class="avatar img-fluid rounded mr-1" alt="Charles Hall" /> <span
								class="text-dark">Charles Hall</span>
						</a>
							<div class="dropdown-menu dropdown-menu-right">
								<a class="dropdown-item" href="mmypage">
								<i class="align-middle mr-1" data-feather="user"></i> 마이페이지
								</a>

							
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="logoutM">로그 아웃</a>
							</div></li>
					</ul>
					</c:if>
				</div>
			</nav>

			<main class="content">
				<div class="container-fluid p-0">
					<tiles:insertAttribute name="body" />
				</div>
			</main>

			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-left">
							<p class="mb-0">
								<a href="index.html" class="text-muted"><strong>호광
										병원 HOKWANG</strong></a> &copy;
							</p>
						</div>
						<div class="col-6 text-right">
							<ul class="list-inline">
								<li class="list-inline-item"><a class="text-muted" href="#">Support</a>
								</li>
								<li class="list-inline-item"><a class="text-muted" href="#">Help
										Center</a></li>
								<li class="list-inline-item"><a class="text-muted" href="#">Privacy</a>
								</li>
								<li class="list-inline-item"><a class="text-muted" href="#">Terms</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

</body>
</html>