<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

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
	<form action="login" method="post">
		<input type="hidden" name="redirectUrl">
	</form>
			<legend>로그인 정보 입력폼</legend>
					<div class="form-group">
							<label for="loginId">사원번호</label> 
							<input type="text" class="form-control" id="loginId" name="loginId" placeholder="ID" >
						<div class="check_font" id="id_check"></div>
						
							<label for="loginPw">비밀번호</label>
							<input type="password" class="form-control" id="loginPw" name="loginPw" placeholder="Password" >
						<div class="check_font" id="pw_check"></div>
					</div>
					
					<input style="margin-top: 20px;" type="button" value="로그인"
							  id="homeBtn" onclick="location.href='base'" />
						
					<div>
						<input type="checkbox" id="keepLogin" name="keepLogin">
						<label for="keepLogin">
						<span>로그인 상태 유지</span>
						</label>
					</div>
					
					<span class="txt_find"> 
					<a href="#" data-toggle="modal"	data-target="#idModal"> 사원번호 </a> / 
					<a href="#" data-toggle="modal"	data-target="#pwModal"> 비밀번호찾기 </a>
					</span>
	</form>

</body>
</html>