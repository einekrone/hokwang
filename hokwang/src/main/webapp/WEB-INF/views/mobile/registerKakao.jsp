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

							$
									.ajax({
										url : "ajax/registerAction",
										type : 'GET',
										data : {
											parent_id : $('#id').val(),
											parent_pw : $('#pw').val(),
											parent_name : $('#name').val(),
											parent_email : $('#email').val(),
											parent_tel : $('#tel').val(),
											parent_regno1 : $('#reg1').val(),
											parent_regno2 : $('#reg2').val(),
											parent_addr : $('#sample3_address')
													.val(),
											parent_addrdetail : $(
													'#sample3_detailAddress')
													.val(),
											parent_addrextra : $(
													'#sample3_extraAddress')
													.val(),
											parent_post : $('#sample3_postcode')
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

						});
	}
</script>
<div class="wrap">
	<div class="form-wrap">
		<div class="button-wrap">
			<div id="btn"></div>
			<button type="button" class="togglebtn" onclick="register()">추가정보</button>
		</div>

		<form id="register" action="" class="input-group"
			style="left: 50px; overflow: auto; height: 400px;">
			<input type="text" class="input-fieldbtn" placeholder="id" id="id"
				name="id" /><input type="password" class="input-field"
				placeholder="password" id="pw" name="pw" /> <input type="text"
				class="input-field" placeholder="name" id="name" name="name" value = "${kname}" readonly/> <input
				type="text" class="input-fieldbtn" placeholder="email" id="email"
				name="email" value = "${kemail}" readonly/><input type="tel" class="input-field"
				placeholder="전화번호는 - 를 제외하고 입력하시오" id="tel" name="tel" /> <input
				type="text" class="input-field" placeholder="주민등록번호 앞자리" id="reg1"
				name="reg1" /> <input type="password" class="input-field"
				placeholder="주민등록번호 뒷자리" id="reg2" name="reg2" /> <input
				type="text" id="sample3_postcode" placeholder="우편번호"> <input
				type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"
				id="postBtn"><br> <input type="text"
				class="input-field" id="sample3_address" placeholder="주소"><br>
			<input type="text" class="input-field" id="sample3_detailAddress"
				placeholder="상세주소"> <input type="text" class="input-field"
				id="sample3_extraAddress" placeholder="참고항목"> <input
				type="button" class="submit" id="btnRegister" name="btnRegister"
				value="등록" />
		</form>
	</div>
</div>





<div id="wrap"
	style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
		id="btnFoldWrap"
		style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
		onclick="foldDaumPostcode()" alt="접기 버튼">
</div>




<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var x = document.getElementById("login");
	var y = document.getElementById("register");
	var z = document.getElementById("btn");

	function register() {
		x.style.left = "-400px";
		y.style.left = "50px";
		z.style.left = "110px";
	}

	var element_wrap = document.getElementById('wrap');

	function foldDaumPostcode() {
		// iframe을 넣은 element를 안보이게 한다.
		element_wrap.style.display = 'none';
	}

	function sample3_execDaumPostcode() {
		// 현재 scroll 위치를 저장해놓는다.
		var currentScroll = Math.max(document.body.scrollTop,
				document.documentElement.scrollTop);
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample3_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample3_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample3_postcode').value = data.zonecode;
						document.getElementById("sample3_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample3_detailAddress")
								.focus();

						// iframe을 넣은 element를 안보이게 한다.
						// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						element_wrap.style.display = 'none';

						// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
						document.body.scrollTop = currentScroll;
					},
					// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
					onresize : function(size) {
						element_wrap.style.height = size.height + 'px';
					},
					width : '100%',
					height : '100%'
				}).embed(element_wrap);

		// iframe을 넣은 element를 보이게 한다.
		element_wrap.style.display = 'block';
	}
</script>
