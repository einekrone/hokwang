<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>호광병원</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	margin: 0;
	padding: 0;
	font-family: sans-serif;
}

.wrap {
	height: 100%;
	width: 100%;
	background-image:
		url(${pageContext.request.contextPath}/resources/img/mainPic.png);
	background-position: center;
	background-size: cover;
	position: absolute;
}

.form-wrap {
	width: 380px;
	height: 700px;
	position: relative;
	margin: 6% auto;
	background: #fff;
	padding: 5px;
	overflow: hidden;
}

.button-wrap {
	width: 230px;
	margin: 35px auto;
	position: relative;
	box-shadow: 0 0 600px 9px #fcae8f;
	border-radius: 30px;
}

.togglebtn {
	padding: 10px 30px;
	cursor: pointer;
	background: transparent;
	border: 0;
	outline: none;
	position: relative;
}

#btn {
	top: 0;
	left: 0;
	position: absolute;
	width: 110px;
	height: 100%;
	background: linear-gradient(to right, #ff105f, #ffad06);
	border-radius: 30px;
	transition: .5s;
}

.social-icons {
	margin: 30px auto;
	text-align: center;
}

.social-icons img {
	width: 30px;
	cursor: pointer;
}

.input-group {
	top: 180px;
	position: absolute;
	width: 280px;
	transition: .5s;
}

.input-field {
	width: 100%;
	padding: 10px 0;
	margin: 5px 0;
	border: none;
	border-bottom: 1px solid #999;
	outline: none;
	background: transparent;
}

.submit {
	width: 85%;
	padding: 10px 30px;
	cursor: pointer;
	display: block;
	margin: auto;
	background: linear-gradient(to right, #ff105f, #ffad06);
	border: 0;
	outline: none;
	border-radius: 30px;
}

.checkbox {
	margin: 30px 10px 30px 0;
}

span {
	color: #777;
	font-size: 12px;
	bottom: 68px;
	position: absolute;
}

#login {
	left: 50px;
}

#register {
	left: 450px;
}

</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#btnIn').on("click",function(){
			$.ajax({
				url : "ajax/logInAction",
				type : 'GET',
 				data: {
					parent_id : $('#idInput').val(),
					parent_pw : $('#pwInput').val()
				}, 
				/* dataType : 'json', */
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(data) {
					if (data==true){
						location.href = "mobile";						
					}
					
				}
			})
		});
	});
</script>
</head>



<body>
	<div class="wrap">
		<div class="form-wrap">
			<div class="button-wrap">
				<div id="btn"></div>
				<button type="button" class="togglebtn" onclick="login()">
					로그인</button>
				<button type="button" class="togglebtn" onclick="register()">회원가입</button>
			</div>
			<div class="social-icons">
				<img
					src="${pageContext.request.contextPath}/resources/img/kakao.png"
					alt="kakao"> <img
					src="${pageContext.request.contextPath}/resources/img/facebook.png"
					alt="facebook"> <img
					src="${pageContext.request.contextPath}/resources/img/twitter.png"
					alt="twitter">
			</div>
			<form id="login" action="" class="input-group">
				<input type="text" class="input-field" placeholder="User name or Email" id = "idInput" name = "idInput" required> 
				<input type="password" class="input-field" placeholder="Enter Password" id = "pwInput" name = "pwInput" required> 
				<br>
				<br>
				<br>
				<br> 
				<input type="button" class="submit" id="btnIn" name="btnIn" value="로그인">
			</form>
			<form id="register" action="" class="input-group">
				<input type="text" class="input-field" placeholder="id" id="id"
					name="id" required> <input type="password"
					class="input-field" placeholder="password" id="pw" name="pw"
					required> <input type="text" class="input-field"
					placeholder="name" id="name" name="name" required> <input
					type="email" class="input-field" placeholder="email" id="email"
					name="email" required> <input type="tel"
					class="input-field" placeholder="phone" id="tel" name="tel"
					required> <input type="text" class="input-field"
					placeholder="주민등록번호 앞자리" id="reg1" name="reg1" required> <input
					type="password" class="input-field" placeholder="주민등록번호 뒷자리"
					id="reg2" name="reg2" required> <input type="text"
					class="input-field" placeholder="address" id="addr" name="addr"
					required> 
					<input type="button" class="submit" id="btnRegister" name="btnRegister" value="등록">
			</form>
		</div>
	</div>


	<script>
		var x = document.getElementById("login");
		var y = document.getElementById("register");
		var z = document.getElementById("btn");

		function login() {
			x.style.left = "50px";
			y.style.left = "450px";
			z.style.left = "0";
		}

		function register() {
			x.style.left = "-400px";
			y.style.left = "50px";
			z.style.left = "110px";
		}
	</script>
</body>
</html>