<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.row {
	margin: 30px 0px 0px 180px;
}
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="container-fluid" style="margin-top: 0px !important;">

		<!-- Content Row -->
		<div class="row" id="row">
			<div class="col-xl-12 col-md-6 mb-4">
				<div>
					<div class="card shadow py-2"
						style="height: 350px; float: left; width: 50%">
						<div class="card-body">

							<!-- 이미지 파일 -->
							첨부파일<input type="file" name="uploadFile" /><br/>
								 <input type="submit" value="저장">
							<a href="filedown?uFile=${empvo.emp_profile}">파일다운</a>
							<img src="images/${empvo.emp_profile}"><br>
							
							<table>
								<tr>
									<td><img src="..." alt="..." class="img-rounded"> <img
										src="..." alt="..." class="img-circle"> <img src="..."
										alt="..." class="img-thumbnail"></td>
									<td>아이디</td>
									<td>---</td>
								</tr>
							</table>
						</div>
						<hr />
						<div class="card-body">dd22d</div>
					</div>
					<div class="card shadow py-2"
						style="height: 350px; float: left; width: 50%">
						<div class="card-body"></div>
					</div>

				</div>
				<div class="card shadow py-2" style="height: 480px;">
					<div class="card-body"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>