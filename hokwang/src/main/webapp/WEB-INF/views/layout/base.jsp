<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<style type="text/css">
*{font-family: 'Nanum Gothic', sans-serif;}
</style>
<title>호광병원</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./resources/json.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
<%-- <script
	src="${pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script> --%>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">

<script
	src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>


<script type="text/javascript">
	$(function() {
		$(".nav-tabs").tabs({
			active : 0,
			activate: function( event, ui ) {
				if(ui.newTab.innerText=="진료"){
					$(".diagMenu").show();
				}
				else{
					$(".diagMenu").hide();
				}
			}
		});
	})
</script>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<jsp:include page="/WEB-INF/views/header.jsp" />
				<div style="padding: 5px;" class=" nav-tabs">
					<ul>
						<li><a href="resve">예약</a></li>
						<c:if test= '${!empty emp_vo.emp_no && emp_vo.emp_author == "D"}'>
						<li><a href="diagnosis">진료</a></li>
						</c:if>
						<li><a href="patient">환자관리</a></li>
						<li><a href="schedule">근태관리</a></li>
						<li><a href="medicine">약품관리</a></li>
						
						
						<c:if test= '${!empty emp_vo.emp_no && emp_vo.emp_author == "O"}'>
						<li><a href="sales">매출</a></li>
						</c:if>
						
						
						<div class="diagMenu" style="float: right; display: none;">
							<button id="diagEnd">진료종료</button>
							<button id="prescript"  type="button"data-toggle="modal" data-target="#getQuestionInfo" data-num="resv_no">문진표</button>
							<button id="prePhoto" type="button" data-toggle="modal" data-target="#imagesModal" data-num="resv_no">사진</button>
						</div>
					</ul>
				</div>
			</div>
			<!-- End of Main Content -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">${emp_vo.emp_name}님 로그아웃 하시겠습니까?</div>
				<div class="modal-footer">
					<a class="btn btn-primary" href="logout">로그아웃</a>
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<%-- 	 <script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script> --%>

	<%-- <script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> --%>

	<!-- Core plugin JavaScript-->


	<!-- Custom scripts for all pages-->


	<!-- Page level plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
</body>
</html>