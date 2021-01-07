<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
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

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/icons/icon-48x48.png" />

<link href="${pageContext.request.contextPath}/resources/css/mobile.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		changeMenu();
	});
	
	function changeMenu() {
		console.log("changeMenu");
		// todo: 메뉴 클릭 시 색상변경
		$(".sidebar-nav").on("click", "li", function(event) {
			console.log("click");
			$(event.target).siblings().removeClass("active");
			$(event.target).siblings().attr('class', 'sidebar-item');
			$(event.target).attr('class', 'sidebar-item active');
		});
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
					<li class="sidebar-item"><a class="sidebar-link"
						href="child"> <i class="align-middle"
							data-feather="book"></i> <span class="align-middle">자녀관리</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="pay"> <i class="align-middle"
							data-feather="credit-card"></i> <span class="align-middle">결제내역</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="doc"> <i class="align-middle"
							data-feather="book"></i> <span class="align-middle">증명서 관리</span>
					</a></li>

					<li class="sidebar-item"><a href="#auth"
						data-toggle="collapse" class="sidebar-link collapsed"> <i
							class="align-middle" data-feather="users"></i> <span
							class="align-middle">예약관리</span>
					</a>
						<ul id="auth" class="sidebar-dropdown list-unstyled collapse "
							data-parent="#sidebar">
							<li class="sidebar-item"><a class="sidebar-link"
								href="resv?type='today'">당일 예약</a></li>
							<li class="sidebar-item"><a class="sidebar-link"
								href="resv?type='pre'">사전 예약</a></li>
						</ul></li>
				</ul>

				<div class="sidebar-cta">
					<div class="sidebar-cta-content">
						<strong class="d-inline-block mb-2">Upgrade to Pro</strong>
						<div class="mb-3 text-sm">Are you looking for more
							components? Check out our premium version.</div>

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
					<ul class="navbar-nav navbar-align">
						<li class="nav-item dropdown"><a
							class="nav-icon dropdown-toggle" href="#" id="alertsDropdown"
							data-toggle="dropdown">
								<div class="position-relative">
									<i class="align-middle" data-feather="bell"></i> <span
										class="indicator">4</span>
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
								<a class="dropdown-item" href="pages-profile.html"><i
									class="align-middle mr-1" data-feather="user"></i> Profile</a>

								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="pages-settings.html"><i
									class="align-middle mr-1" data-feather="settings"></i> Settings
									& Privacy</a> <a class="dropdown-item" href="#"><i
									class="align-middle mr-1" data-feather="help-circle"></i> Help
									Center</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Log out</a>
							</div></li>
					</ul>
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
										병원 Demo</strong></a> &copy;
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


	<script>	/* 차트 */
		document.addEventListener("DOMContentLoaded", function() {
			var ctx = document.getElementById("chartjs-dashboard-line")
					.getContext("2d");
			var gradient = ctx.createLinearGradient(0, 0, 0, 225);
			gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
			gradient.addColorStop(1, "rgba(215, 227, 244, 0)");
			// Line chart
			new Chart(document.getElementById("chartjs-dashboard-line"), {
				type : "line",
				data : {
					labels : [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
							"Aug", "Sep", "Oct", "Nov", "Dec" ],
					datasets : [ {
						label : "Sales ($)",
						fill : true,
						backgroundColor : gradient,
						borderColor : window.theme.primary,
						data : [ 2115, 1562, 1584, 1892, 1587, 1923, 2566,
								2448, 2805, 3438, 2917, 3327 ]
					} ]
				},
				options : {
					maintainAspectRatio : false,
					legend : {
						display : false
					},
					tooltips : {
						intersect : false
					},
					hover : {
						intersect : true
					},
					plugins : {
						filler : {
							propagate : false
						}
					},
					scales : {
						xAxes : [ {
							reverse : true,
							gridLines : {
								color : "rgba(0,0,0,0.0)"
							}
						} ],
						yAxes : [ {
							ticks : {
								stepSize : 1000
							},
							display : true,
							borderDash : [ 3, 3 ],
							gridLines : {
								color : "rgba(0,0,0,0.0)"
							}
						} ]
					}
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Pie chart
			new Chart(document.getElementById("chartjs-dashboard-pie"), {
				type : "pie",
				data : {
					labels : [ "Chrome", "Firefox", "IE" ],
					datasets : [ {
						data : [ 4306, 3801, 1689 ],
						backgroundColor : [ window.theme.primary,
								window.theme.warning, window.theme.danger ],
						borderWidth : 5
					} ]
				},
				options : {
					responsive : !window.MSInputMethodContext,
					maintainAspectRatio : false,
					legend : {
						display : false
					},
					cutoutPercentage : 75
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Bar chart
			new Chart(document.getElementById("chartjs-dashboard-bar"),
					{
						type : "bar",
						data : {
							labels : [ "Jan", "Feb", "Mar", "Apr", "May",
									"Jun", "Jul", "Aug", "Sep", "Oct", "Nov",
									"Dec" ],
							datasets : [ {
								label : "This year",
								backgroundColor : window.theme.primary,
								borderColor : window.theme.primary,
								hoverBackgroundColor : window.theme.primary,
								hoverBorderColor : window.theme.primary,
								data : [ 54, 67, 41, 55, 62, 45, 55, 73, 60,
										76, 48, 79 ],
								barPercentage : .75,
								categoryPercentage : .5
							} ]
						},
						options : {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
							scales : {
								yAxes : [ {
									gridLines : {
										display : false
									},
									stacked : false,
									ticks : {
										stepSize : 20
									}
								} ],
								xAxes : [ {
									stacked : false,
									gridLines : {
										color : "transparent"
									}
								} ]
							}
						}
					});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var markers = [ {
				coords : [ 31.230391, 121.473701 ],
				name : "Shanghai"
			}, {
				coords : [ 28.704060, 77.102493 ],
				name : "Delhi"
			}, {
				coords : [ 6.524379, 3.379206 ],
				name : "Lagos"
			}, {
				coords : [ 35.689487, 139.691711 ],
				name : "Tokyo"
			}, {
				coords : [ 23.129110, 113.264381 ],
				name : "Guangzhou"
			}, {
				coords : [ 40.7127837, -74.0059413 ],
				name : "New York"
			}, {
				coords : [ 34.052235, -118.243683 ],
				name : "Los Angeles"
			}, {
				coords : [ 41.878113, -87.629799 ],
				name : "Chicago"
			}, {
				coords : [ 51.507351, -0.127758 ],
				name : "London"
			}, {
				coords : [ 40.416775, -3.703790 ],
				name : "Madrid "
			} ];
			var map = new JsVectorMap({
				map : "world",
				selector : "#world_map",
				zoomButtons : true,
				markers : markers,
				markerStyle : {
					initial : {
						r : 9,
						strokeWidth : 7,
						stokeOpacity : .4,
						fill : window.theme.primary
					},
					hover : {
						fill : window.theme.primary,
						stroke : window.theme.primary
					}
				}
			});
			/* window.addEventListener("resize", () => {
				map.updateSize();
			}); */
		});
	</script>
	<script>
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							document
									.getElementById("datetimepicker-dashboard")
									.flatpickr(
											{
												inline : true,
												prevArrow : "<span class=\"fas fa-chevron-left\" title=\"Previous month\"></span>",
												nextArrow : "<span class=\"fas fa-chevron-right\" title=\"Next month\"></span>",
											});
						});
	</script>

</body>
</html>