<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>login.jsp</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
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
</head>
<style>
.page-header {
	height: 95vh;
	background-position: center center;
	background-size: cover;
	margin: 0;
	padding: 0;
	border: 0;
	display: flex;
	align-items: center;
}

.card .card-header {
	border-radius: 3px;
	padding: 1rem 15px;
	margin-left: 15px;
	margin-right: 15px;
	margin-top: -30px;
	border: 0;
	box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.2), 0 13px 24px -11px
		rgb(196 137 206/ 0%);
}

.text-center {
	text-align: center !important;
}

.card-title {
	margin-bottom: 0;
}

.input-group1 {
	/* position: revert;
    display: inline; */
	position: relative;
	display: flex;
	flex-wrap: wrap;
	align-items: stretch;
	width: 100%;
}

.input-group1-prepend {
	margin-right: -1px;
	display: flex;
}

.input-group1 .input-group1-text {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 0px 15px 0px 15px;
	background-color: transparent;
	margin-bottom: 0;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	text-align: center;
	white-space: nowrap;
}

.material-icons {
	font-family: 'Material Icons';
	font-weight: normal;
	font-style: normal;
	font-size: 24px;
	line-height: 1;
	letter-spacing: normal;
	text-transform: none;
	display: inline-block;
	white-space: nowrap;
	direction: ltr;
}

.input-group1 .input-group1-prepend .input-group1-text {
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
}

.form-control {
	background: no-repeat center bottom, center calc(100% - 1px);
	background-size: 0 100%, 100% 100%;
	border: 0;
	height: 36px;
	transition: background 0s ease-out;
	padding-left: 0;
	padding-right: 0;
	border-radius: 0;
	display: block;
	width: 100%;
	padding: 1.5rem 0;
	color: #495057;
	background-image: linear-gradient(to top, #9c27b0 2px, rgba(156, 39, 176, 0)
		2px), linear-gradient(to top, #d2d2d2 1px, rgba(210, 210, 210, 0) 1px);
}

.form-group {
	margin-bottom: 17px;
	position: relative;
}

.bmd-form-group {
	padding-top: 27px;
}

.bmd-form-group .bmd-help {
	margin-top: 0;
	font-size: 1rem;
}

.bmd-help {
	position: absolute;
	display: none;
	font-weight: normal;
	color: #6c757d !important;
}

.btn-lg {
	font-size: 1.25rem;
	line-height: 1.2;
	border-radius: .3rem;
	color: #f8f9fc;
	background-color: #169b6bba;
	border-color: #ffffff
}
</style>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
		<input type="hidden" name="redirectUrl">
		<div class="page-header" style=" background-size: cover; background-position: top center;">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-6 ml-auto mr-auto">
						<div class="card">
								<div class="card-header text-center">
									<h4 class="card-title">병원관리전산시스템</h4>
								</div>
								<div class="card-body">
								<!-- 로그인  -->
								<c:if test="${emp_vo == null}">
										<form action='<c:url value='/login'/>' method="post">
									<div class="row">
										<div class="col-lg-10 col-md-6 ml-auto mr-auto">
											<div class="input-group1">
												<div class="input-group1-prepend">
													<span class="input-group1-text"> <i	class="material-icons">person_outline</i> </span>
												</div>
												
												<div class="form-group">
													<input type="text" class="form-control" placeholder="ID..."	id="emp_no" name="emp_no"> 
													<span class="bmd-help" id="id-warning"></span>
												</div>
											</div>
											
											<div class="input-group1">
												<div class="input-group1-prepend">
													<span class="input-group1-text"> <i	class="material-icons">lock_outline</i>	</span>
												</div>
												<div class="form-group">
													<input type="password" class="form-control"	placeholder="Password..." id="emp_pwd" name="emp_pwd">
													<span class="bmd-help" id="pw-warning"></span>
												</div>
											</div>
										</div>
									</div>
									<div class="text-center">
										<input type="submit" class="btn-lg" value="로그인">
									</div>
										</form>
								</c:if>
								
								<c:if test="${emp_vo != null }">
								<c:redirect url="/base"/>
								</c:if>
								<c:if test="${msg == false }">
									<%out.println("<script>alert('로그인 실패 ! 아이디나 비밀번호를 확인해 주세요.')</script>"); %>
								</c:if>
								<!-- 로그인 끝 -->
								</div>
								<div class="card-footer">
									<span class="txt_find" style="">
									<a href="#" data-toggle="modal" data-target="#idModal"> 사원번호 </a> / 
									<a href="#" data-toggle="modal" data-target="#pwModal">	비밀번호찾기 </a>
									</span>
								</div>
								
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>