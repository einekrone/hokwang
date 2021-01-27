<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 --%>


<style>
* {
	margin: 0;
	padding: 0;
	font-family: sans-serif;
}
/* .wrap {
	height: 100%;
	width: 100%;
	background-image:
		url(${pageContext.request.contextPath}/resources/img/mainPic.png);
	background-position: center;
	background-size: cover;
	position: absolute;
} */
.form-wrap {
	width: 380px;
	height: 800px;
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

.input-fieldbtn {
	/* width: 75%; */
	width: 100%;
	padding: 5px 5px 5px 0;
	margin: 5px 5px 5px 0;
	border: none;
	border-bottom: 1px solid #999;
	outline: none;
	background: transparent;
}

.submit {
	width: 50%;
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
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<script type="text/javascript">
	$(function() {
		registerAction();

	});

	function registerAction() {
		$('#btnRegister')
				.on(
						"click",
						function() {
							if ($('#pw').val() == '' || $('#reg1').val() == ''
									|| $('#reg2').val() == ''
									|| $('#parent_addr').val() == '') {
								alert('필수 입력을 해야합니다');
							} else {
								$
										.ajax({
											url : "ajax/kakaoRegisterAction",
											type : 'POST',
											data : {
												parent_id : $('#id').val(),
												parent_pw : $('#pw').val(),
												parent_name : $('#name').val(),
												parent_email : $('#email')
														.val(),
												parent_tel : $('#tel').val(),
												parent_regno1 : $('#reg1')
														.val(),
												parent_regno2 : $('#reg2')
														.val(),
												parent_addr :$('#parent_addr').val(),
												parent_img : "${kimage}"
											},
											dataType : 'json',
											error : function(xhr, status, msg) {
												alert("상태값 :" + status
														+ " Http에러메시지 :" + msg);
											},
											success : function(data) {
												alert("회원가입에 성공하였습니다");
												location.href="loginM";
											}
										})
							}
						});
	}
	
</script>
<div class="wrap">
	<div class="form-wrap">
		<div class="button-wrap">
			<div id="btn"></div>
			<button type="button" class="togglebtn" onclick="register()">추가정보</button>
		</div>

		<form id="register" name="form" action="" class="input-group"
			style="left: 50px; overflow: auto; height: 400px;">
			<input type="text" class="input-fieldbtn" placeholder="id" id="id"
				name="id" value="${kid}" readonly /><input type="password"
				class="input-field" placeholder="password" id="pw" name="pw" /> <input
				type="text" class="input-field" placeholder="name" id="name"
				name="name" value="${kname}" readonly /> <input type="text"
				class="input-fieldbtn" placeholder="email" id="email" name="email"
				value="${kemail}" readonly /><input type="tel" class="input-field"
				placeholder="전화번호는 - 를 제외하고 입력하시오" id="tel" name="tel" /> <input
				type="text" class="input-field" placeholder="주민등록번호 앞자리" id="reg1"
				name="reg1" /> <input type="password" class="input-field"
				placeholder="주민등록번호 뒷자리" id="reg2" name="reg2" />
				<div class="form-group">
				<button type="button" class="btn btn-warning" onclick="goPopup()">주소검색</button>
				<input type="text" id="parent_addr" name="parent_addr"
					class="form-control" placeholder="Enter Addr" required="true"
					readonly="true" />
			    </div> 
			<input
				type="button" class="submit" id="btnRegister" name="btnRegister"
				value="등록" />
		</form>
	</div>
</div>





<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

	function goPopup() {

		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("popup", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
		document.form.parent_addr.value = roadFullAddr;
	}
</script>
