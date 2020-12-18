<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="post" id="authForm"
		>
		<input type="hidden" name="redirectUrl"
			>
		<fieldset>
			<legend class="screen_out">로그인 정보 입력폼</legend>
			<div class="box_login">
				<div class="inp_text">
					<form method="post" id="authForm" name="authForm"
						action="./uploadproc" enctype="multipart/form-data"></form>
					<div>
						<label for="loginId">아이디</label> <input type="text" id="loginId"
							name="loginId" value="" placeholder="ID"> <label
							for="loginPw">비밀번호</label> <input type="password" id="loginPw"
							name="password" placeholder="Password">
					</div>
					
					<input style="margin-top: 20px;" type="button" value="로그인"
						id="homeBtn" onclick="location.href='resv'" />
					<div>
						<input type="checkbox" id="keepLogin" name="keepLogin"> <label
							for="keepLogin"><span>로그인 상태 유지</span></label>
					</div>
					<span class="txt_find"> <a href="#" data-toggle="modal"
						data-target="#idModal"> 아이디 </a>/ <a href="#" data-toggle="modal"
						data-target="#pwModal"> 비밀번호찾기 </a>
					</span>
	</form>

</body>
</html>