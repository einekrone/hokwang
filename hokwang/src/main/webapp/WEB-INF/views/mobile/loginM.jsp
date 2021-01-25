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
	background: #7dabd0;
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
	/* 	background: linear-gradient(to right, #ff105f, #ffad06); */
	border: 0;
	outline: none;
	margin: 0 auto;
	/* 	border-radius: 30px; */
}

.checkbox {
	margin: 30px 10px 30px 0;
}

span {
	color: #777;
	font-size: 12px;

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
	var e = false;
	var i = false;
	$(function() {

		login();
		logInAction();
		registerAction();
		checkId();
		checkEmail();
		findIdInf();
		findPwInf();
	});

	function findIdInf() {
		$('#btnFindId').on("click", function() {
			$.ajax({
				url : "ajax/findIdInf",
				type : 'GET',
				data : {
					parent_name : $('#findName').val(),
					parent_email : $('#findEmail1').val()
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(data) {
					if (data != "") {
						$('#findName').val("");
						$('#findEmail1').val("");
						alert("Id는 " + data + " 입니다.");
					} else {//없는경우
						$('#findName').val("");
						$('#findEmail1').val("");
						alert("등록된 계정이 없습니다.");
					}
				}
			})//endAjax

		})
	}

	function findPwInf() {
		$('#btnFindPw').on("click", function() {
			$.ajax({
				url : "ajax/findPwInf",
				type : 'GET',
				data : {
					parent_id : $('#findId').val(),
					parent_email : $('#findEmail2').val()
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(data) {
					if (data != "") {
						$('#findId').val("");
						$('#findEmail2').val("");
						alert("임시비밀번호는 " + data + " 입니다. 로그인 후  반드시 변경해주세요. ");
					} else {//없는경우
						$('#findId').val("");
						$('#findEmail2').val("");
						alert("등록된 계정이 없습니다.");
					}
				}
			})//endAjax

		})
	}

	function checkEmail() {
		$('#overLapEmail').on("click", function() {
			if ($('#email').val() == '') {
				alert("이메일을 입력하시오")
			} else {
				$.ajax({
					url : "ajax/checkEmail",
					type : 'GET',
					data : {
						parent_email : $('#email').val(),
					},
					error : function(xhr, status, msg) {
						alert("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(data) {
						if (data == true) {
							alert("사용가능합니다");
							$('#email').attr("readonly", true);
							e = true;
						} else
							alert("E-mail이 중복됩니다");
					}
				})
			}
		})

	}

	function checkId() {
		$('#overLapId').on("click", function() {
			if ($('#id').val() == '') {
				alert("id를 입력하시오")
			} else {
				$.ajax({
					url : "ajax/checkId",
					type : 'GET',
					data : {
						parent_id : $('#id').val(),
					},
					error : function(xhr, status, msg) {
						alert("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(data) {
						if (data == true) {
							alert("사용가능합니다");
							$('#id').attr("readonly", true);
							i = true;
						} else
							alert("ID가 중복됩니다");

					}
				})
			}
		})

	}

	function registerAction() {
		$('#btnRegister')
				.on(
						"click",
						function() {
							console.log(e);
							if (e == false || i == false) {
								alert("아이디와 이메일의 중복검사를 해야합니다.");
							} else if ($('#pw').val() == ''
									|| $('#name').val() == ''
									|| $('#reg1').val() == ''
									|| $('#reg2').val() == ''
									|| $('#parent_addr').val() == '') {
								alert('필수 입력을 해야합니다');
							} else {
								$
										.ajax({
											url : "ajax/registerAction",
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
												parent_addr : $('#parent_addr')
														.val()
											},
											dataType : 'json',
											error : function(xhr, status, msg) {
												alert("상태값 :" + status
														+ " Http에러메시지 :" + msg);
											},
											success : function(data) {
												alert("회원가입에 성공하였습니다");
												$(
														"#register input:not([id=btnRegister]):not([id=postBtn])")
														.val('');
												login();
											}
										})
							}

						});
	}

	function logInAction() {
		$('#btnIn').on("click", function() {
			$.ajax({
				url : "ajax/logInAction",
				type : 'GET',
				data : {
					parent_id : $('#idInput').val(),
					parent_pw : $('#pwInput').val()
				},
				/* dataType : 'json', */
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(data) {
					if (data == true) {
						location.href = "mobile";
					} else {
						alert("아이디와 비밀번호를 확인하시오.")
					}

				}
			})
		});
	}
</script>
<div class="wrap" style="height: 550px; margin-bottom: 10px;">
	<div class="form-wrap" style="height: 100%;">
		<div class="button-wrap">
			<div id="btn"></div>
			<button type="button" class="togglebtn" onclick="login()">
				로그인</button>
			<button type="button" class="togglebtn" onclick="register()">회원가입</button>
		</div>
		<div class="social-icons">
			<a href="${kakao_url}"><img
				src="${pageContext.request.contextPath}/resources/img/kakaoimg.png"
				alt="kakao" style="width: 200px;"></a>
		</div>
		<form id="login" action="" class="input-group">
			<input type="text" class="input-field" placeholder="id" id="idInput"
				name="idInput" required /> <input type="password"
				class="input-field" placeholder="pw" id="pwInput" name="pwInput"
				style="margin-bottom: 10px;" required />
			<input type="button"
				class="submit" id="btnIn" name="btnIn" value="로그인"
				style="border-radius: 15px; background-color: #7dabd0; color: white; margin: 0 auto;" />
			<input type="button" class="submit" id="btnFind" name="btnIn"
				value="ID/PW찾기" data-toggle="modal" data-target="#findInf"
				style="border-radius: 15px; background-color: #7dabd0; color: white; margin: 0 auto;" />
		</form>
		<form id="register" name="form" action="" class="input-group"
			style="left: 50px; overflow: auto; height: 350px;">
			<input type="text" class="input-fieldbtn" placeholder="id" id="id"
				name="id" /> <input type="button" class="btn btn-secondary"
				value="중복검사" id="overLapId" name="overLapId"
				style="border-radius: 10px;"> <input type="password"
				class="input-field" placeholder="password" id="pw" name="pw" /> <input
				type="text" class="input-field" placeholder="name" id="name"
				name="name" /> <input type="text" class="input-fieldbtn"
				placeholder="email" id="email" name="email" /> <input type="button"
				class="btn btn-secondary" value="중복검사" id="overLapEmail"
				name="overLapEmail" style="border-radius: 10px;"> <input
				type="tel" class="input-field" placeholder="전화번호는 - 를 제외하고 입력하시오"
				id="tel" name="tel" /> <input type="text" class="input-field"
				placeholder="주민등록번호 앞자리" id="reg1" name="reg1" /> <input
				type="password" class="input-field" placeholder="주민등록번호 뒷자리"
				id="reg2" name="reg2" />
			<div>
				<button type="button" class="btn btn-warning" onclick="goPopup()">주소검색</button>
				<input type="text" id="parent_addr" name="parent_addr"
					class="form-control" placeholder="Enter Addr" required="true"
					readonly="true" />
			</div>

			<input type="button" class="submit" id="btnRegister"
				name="btnRegister" value="등록"
				style="border-radius: 15px; background-color: #7dabd0; color: white; margin: 0 auto;" />
		</form>
	</div>
</div>




<!-- 확인 Modal-->
<div class="modal fade" id="findInf" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Id/Pw찾기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="card" style="width: 30rem;">
					<div class="card-body">
						<h3>아이디찾기</h3>
						<table>
							<tr>
								<td><h5 class="card-com">이름 :</h5></td>
								<td><input type="text" class="card-name" id="findName"
									name="findName"></td>
							</tr>
							<tr>
								<td><h5 class="card-composition">이메일 :</h5></td>
								<td><input type="text" class="card-name" id="findEmail1"
									name="findEmail1"></td>
							</tr>
							<tr>
								<td><input type="button" class="card-name" id="btnFindId"
									name="btnFindId" value="찾기"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div class="card" style="width: 30rem;">
					<div class="card-body">
						<h3>비밀번호찾기</h3>
						<table>
							<tr>
								<td><h5 class="card-com">아이디 :</h5></td>
								<td><input type="text" class="card-name" id="findId"
									name="findId"></td>
							</tr>
							<tr>
								<td><h5 class="card-composition">이메일 :</h5></td>
								<td><input type="text" class="card-name" id="findEmail2"
									name="findEmail2"></td>
							</tr>
							<tr>
								<td><input type="button" class="card-name" id="btnFindPw"
									name="btnFindPw" value="찾기"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
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
