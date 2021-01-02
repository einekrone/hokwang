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
	
	
	
<script>

	
	
	
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

					<div class="card shadow py-2" style="height: 350px; float: left; width: 50%">
						<div class="card-body">
							<table>
							<!-- 이미지 파일 -->
								<tr>
									<td>
										<img src="images/${empvo.emp_profile}" 	style="width: 150px; height: 160px"><br>
										첨부파일 <input type="file" name="uploadFile"/><br/>
											  <input type="submit" value="저장">
										      <a href="filedown?uFile=${empvo.emp_profile}"> 파일다운 </a>
									</td>
									<td class="content" style="margin: 10px;">
								</tr>
								
								<tr>
									<td>123</td>
									<td>123</td>
								</tr>
								<tr>
									<td>123</td>
									<td>123</td>
								</tr>
	                      
							</table>
						</div>

							                        <div class="card-footer">
	                            <div class="col-md-4 text-center">
	                                <a class="text-primary" href="<c:url value='update' />" style="font-size: 15px"	>
	                                	프로필 변경
	                                </a>
	                            </div>
	                            <div class="col-md-4 text-center">
	                                <a class="text-primary" href="<c:url value='logout' />" style="font-size: 15px">
	                                  	로그아웃
	                                </a>
	                            </div>
	                            <div class="col-md-4 text-center">
	                                <a class="text-primary" href="<c:url value='delete' />" style="font-size: 15px">
	                                   	 회원탈퇴
	                                </a>
	                            </div>
	                        </div>
					</div>
					<div class="card shadow py-2"
						style="height: 350px; float: left; width: 50%">
						<div class="card-body"></div>
					</div>

				</div>
				<div class="card shadow py-2"  style="height: 480px; width: 100%;">
				<div class="card shadow py-2" style="height: 462px; width: 20%;" >
					<div class="card-body">
						<div>
							<div class="nav flex-column nav-pills" id="v-pills-tab"
								role="tablist" aria-orientation="vertical">
								<a class="nav-link active" id="v-pills-home-tab"
									data-toggle="pill" href="#v-pills-home" role="tab"
									aria-controls="v-pills-home" aria-selected="true">전체쪽지함 <span
									class="badge badge-primary badge-pill">14</span></a> <a
									class="nav-link" id="v-pills-profile-tab" data-toggle="pill"
									href="#v-pills-profile" role="tab"
									aria-controls="v-pills-profile" aria-selected="false">받은쪽지함</a>
								<a class="nav-link" id="v-pills-messages-tab" data-toggle="pill"
									href="#v-pills-messages" role="tab"
									aria-controls="v-pills-messages" aria-selected="false">보낸쪽지함</a>
								<a class="nav-link" id="v-pills-settings-tab" data-toggle="pill"
									href="#v-pills-settings" role="tab"
									aria-controls="v-pills-settings" aria-selected="false">임시저장함</a>
							</div>

						</div>

					</div>
			</div>
		</div>
		</div>
</div>
</body>
</html>