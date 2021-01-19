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
<!-- CSS only -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
#topBtn {
	position: fixed;
	float: right;
	bottom: 50px;
	display: none;
	z-index: 999;
	height: 40px;
	margin-left: 85%;
}
</style>
<script type="text/javascript">
	$(function() {
		changeMenu();
		alertCntAction();
		alertInf();

		$(window).scroll(function() {
			if ($(this).scrollTop() > 200) {
				$("#topBtn").fadeIn();
			} else {
				$("#topBtn").fadeOut();
			}
		});

		$("#topBtn").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});

		$(".resvT, .resvR").on("click", function() {
			var parentinfo = '${parent_vo}';
			if (parentinfo == '') {
				event.preventDefault();
				alert("로그인 후 사용 가능합니다.");
			}
		});
	});

	function alertInf() {
		$
				.ajax({
					url : "ajax/alertInf",
					type : 'GET',
					dataType : 'json',
					data : {
						parent_no : "${parent_vo.parent_no}"
					},
					error : function(xhr, status, msg) {
						alert("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(data) {
						$
								.each(
										data,
										function(idx, item) {
											$('#alertLabel')
													.append(
															$('<a>')
																	.attr(
																			"href",
																			"#")
																	.attr(
																			"class",
																			"list-group-item")
																	.append(
																			$(
																					'<div>')
																					.attr(
																							"class",
																							"row g-0 align-items-center")
																					.append(
																							$(
																									'<div>')
																									.attr(
																											"class",
																											"col-2")
																									.append(
																											$(
																													'<img width="60px">')
																													.css(
																															"padding-right",
																															"15px")
																													.attr(
																															"src",
																															"${pageContext.request.contextPath}/resources/img/"
																																	+ item.BABY_PIC)))
																					.append(
																							$(
																									'<div>')
																									.attr(
																											"class",
																											"col-10")
																									.append(
																											$(
																													'<div>')
																													.attr(
																															"class",
																															"text-dark")
																													.html(
																															item.ALERT_TITLE))
																									.append(
																											$(
																													'<div>')
																													.attr(
																															"class",
																															"text-muted small mt-1")
																													.html(
																															item.ALERT_CONT))
																									.append(
																											$(
																													'<div>')
																													.attr(
																															"class",
																															"text-muted small mt-1")
																													.html(
																															item.ALERT_DATE)))));
										});

					}
				})
	}

	function alertCntAction() {
		$.ajax({
			url : "ajax/alertCntAction",
			type : 'GET',
			dataType : 'json',
			data : {
				parent_no : "${parent_vo.parent_no}"
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				$('#alertCnt').text(data);
			}
		})
	}

	function changeMenu() {
		var sBtn = $("ul > li"); //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
		sBtn.find("a").click(function() { // sBtn에 속해 있는  a 찾아 클릭 하면.
			sBtn.removeClass("active"); // sBtn 속에 (active) 클래스를 삭제 한다.
			$(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
			event.preventDefault();
		});

		// 		console.log("changeMenu");
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

					<c:if test="${parent_vo != null}">
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
					</c:if>
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
							<li class="sidebar-item"><a class="sidebar-link resvT"
								href="resv?type=T">당일 예약</a></li>
							<li class="sidebar-item"><a class="sidebar-link resvR"
								href="resv?type=R">우선 예약</a></li>
						</ul></li>
				</ul>

				<div class="sidebar-cta">
					<img id='img'
						src="${pageContext.request.contextPath}/resources/img/papang.png"
						style="width: 240px; height: 160px; margin: 0 0 30px 10px; border-radius: 10px;">
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
					${kemail}
					<!-- 로그인모양 -->
					<c:if test="${parent_vo == null }">

						<ul class="navbar-nav navbar-align">
							<li class="nav-item"><a class="nav-icon" href="loginM">
									<img
									src="${pageContext.request.contextPath}/resources/img/logM.png"
									style="width: 35px; height: 30px;" />
							</a></li>
						</ul>
					</c:if>


					<c:if test="${parent_vo != null }">
						<ul class="navbar-nav navbar-align">
							<li class="nav-item dropdown"><a
								class="nav-icon dropdown-toggle" href="#" id="alertsDropdown"
								data-toggle="dropdown">
									<div class="position-relative">
										<i class="align-middle" data-feather="bell"></i> <span
											class="indicator" id="alertCnt">4</span>
									</div>
							</a>
								<div
									class="dropdown-menu dropdown-menu-lg dropdown-menu-right py-0"
									aria-labelledby="alertsDropdown">
									<!-- <div class="dropdown-menu-header">4 New Notifications</div> -->
									<div class="list-group" id="alertLabel">
										<!-- 알림 출력부분 -->

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
									<a class="dropdown-item" href="mmypage"> <i
										class="align-middle mr-1" data-feather="user"></i> 마이페이지
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
	<img alt="TOP" id="topBtn"
		src="${pageContext.request.contextPath}/resources/img/top.png">
</body>
</html>