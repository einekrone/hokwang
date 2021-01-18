<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOHO</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
	
<style>
.form-control{
width:auto;
display: inline-block;
}
#postBtn{
display: inline-table;
}
</style>
</head>
<body>
<script>
$(function() {
	checkImg();
	changeImg();
	
	var fileTarget = $('.file-upload .upload-hidden');

	fileTarget.on('change',
			function() { // 값이 변경되면
				if (window.FileReader) { // modern browser
					var filename = $(this)[0].files[0].name;
				} else { // old IE
					var filename = $(this).val().split('/').pop().split(
							'\\').pop(); // 파일명만 추출
				}
				// 추출한 파일명 삽입
				$(this).siblings('.upload-name').val(filename);
			});

	$("#uf").on('change', function(e) {
		var files = e.target.files;
		var arr = Array.prototype.slice.call(files);
		for (var i = 0; i < files.length; i++) {
			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
		}
		preview(arr);
	});

	function checkExtension(fileName, fileSize) {

		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 20971520; //20MB

		if (fileSize >= maxSize) {
			alert('파일 사이즈 초과');
			$("input[type='file']").val(""); //파일 초기화
			return false;
		}

		if (regex.test(fileName)) {
			alert('업로드 불가능한 파일이 있습니다.');
			$("input[type='file']").val(""); //파일 초기화
			return false;
		}
		return true;
	}

	function preview(arr) {
		arr
				.forEach(function(f) {

					//파일명이 길면 파일명...으로 처리
					var fileName = f.name;
					if (fileName.length > 10) {
						fileName = fileName.substring(0, 7) + "...";
					}

					//div에 이미지 추가
					var str = '<div style="display: inline-flex; padding: 10px;"><li>';
					str += '<span>' + fileName + '</span><br>';

					//이미지 파일 미리보기
					if (f.type.match('image.*')) {
						var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
						reader.onload = function(e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
							//str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';

							$('#img').attr('src', e.target.result);
							$('#img').attr('style',
									"width:150px; height: 160px");
						}
						reader.readAsDataURL(f);
					} else {
						$('#img').attr('src', e.target.result);
						$('#img').attr('style',
								"width:150px; height: 160px");
					}
				});//arr.forEach
	}
	
});
function checkImg(){
	
	$('#chkImg').on('click',function(){
		var file = $('#file').val();
		if(file == ''){
			alert("사진을 선택하세요");
			return false;
		}
	})
}

function changeImg(){
	$('#chkImg').on('click',function(){
		var form = $('#form1')[0];
		var formData = new FormData(form);
		console.log(form);
		console.log(formData);
		$.ajax({
			url:'ajax/imgUpdate',
			method : 'post',
			enctype : 'multipart/form-data',
			contentType : false,
			processData : false,
			data:formData,
			dataType:'json',
			success:function(){
				alert("성공");
			},
			error:function(){
				alert("실패");
			}
			
		})
	})
}
</script>
	<h1 class="h3 mb-3">회원정보</h1>

	<div class="row">
		<div class="col-md-4 col-xl-3">
			<div class="card mb-3">
				<div class="card-header"></div>
				<div class="card-body text-center">
				<c:if test="${parent_vo.parent_sns == 'social' }">
					<img src="${parent_vo.parent_img}"class="img-fluid rounded-circle mb-2 gc-img" width="200" height="30" />
				</c:if>
				<form id='form1' method="post">
				<c:if test="${parent_vo.parent_sns != 'social' }">
					<img src="${pageContext.request.contextPath}/resources/img/${parent_vo.parent_img}" class="img-fluid rounded-circle mb-2 gc-img" width="200" height="30" id="img"/>
				</c:if>
					<h5 class="card-title mb-0">${parent_vo.parent_name}</h5>
					<div class="text-muted mb-2">${parent_vo.parent_tel}</div>
				<c:if test="${parent_vo.parent_sns != 'social' }">
					<input type="hidden" id="parent-no" name="parent_no">
					<input type="file" name="file" id="uf"/>
						<button id="chkImg" type="submit" class="btn-secondary btn-sm">사진변경</button>
				</c:if>	
				</form>
				</div>
				<hr class="my-0" />
				<div class="card-body">
					<h5 class="h6 card-title">프로필 수정</h5>
					<input type="button" class="btn btn-primary btn-sm" value="정보변경" data-toggle="modal" data-target="#parentModal">
				</div>
				<hr class="my-0" />
				<div class="card-body">
					<h5 class="h6 card-title">About</h5>
					<ul class="list-unstyled mb-0">
						<li class="mb-1"><span data-feather="home"
							class="feather-sm mr-1"></span> Lives in <a href="#">San
								Francisco, SA</a></li>

						<li class="mb-1"><span data-feather="briefcase"
							class="feather-sm mr-1"></span> Works at <a href="#">GitHub</a></li>
						<li class="mb-1"><span data-feather="map-pin"
							class="feather-sm mr-1"></span> From <a href="#">Boston</a></li>
					</ul>
				</div>
				<hr class="my-0" />
				<div class="card-body">
					<h5 class="h6 card-title">Elsewhere</h5>
					<ul class="list-unstyled mb-0">
						<li class="mb-1"><span class="fas fa-globe fa-fw mr-1"></span>
							<a href="#">staciehall.co</a></li>
						<li class="mb-1"><span class="fab fa-twitter fa-fw mr-1"></span>
							<a href="#">Twitter</a></li>
						<li class="mb-1"><span class="fab fa-facebook fa-fw mr-1"></span>
							<a href="#">Facebook</a></li>
						<li class="mb-1"><span class="fab fa-instagram fa-fw mr-1"></span>
							<a href="#">Instagram</a></li>
						<li class="mb-1"><span class="fab fa-linkedin fa-fw mr-1"></span>
							<a href="#">LinkedIn</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="col-md-8 col-xl-9">
			<div class="card">
				<div class="card-body h-100">
					<a href="#" class="btn btn-primary btn-block">Load more</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="parentModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">정보수정</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				<div class="modal-body">
					<form method="post" action="updateparentinfo">
						<div class="form-group">
							<label>이름:&nbsp;</label><input type="text" class="form-control"
								id="parent-name" name="parent_name">
						</div>
						<div class="form-group">
							<label>아이디:&nbsp;</label><input type="number"
								class="form-control" id="parent-id"
								value="${parent_vo.parent_id}" readonly>
						</div>
						<div class="form-group">
							<label>비밀번호:&nbsp;</label><input type="password"
								class="form-control" id="parent-password1" name="parent_pw">
						</div>
						<div class="form-group">
							<label>비밀번호 확인:&nbsp;</label><input type="password" class="form-control" id="parent-password2" name="parent-password2">
						</div>
						<div class="form-group">
						<label>우편번호:&nbsp;</label><input type="text" id="sample3_postcode" placeholder="우편번호">
						<input type="button" onclick="sample3_execDaumPostcode()"
							value="우편번호 찾기" id="postBtn"> 
							</div>
						<div class="form-group">
							<label>주소:&nbsp;</label><input type="text" class="input-field" id="sample3_address" placeholder="주소"><br>
						</div>
						<div class="form-group">
						<label>상세주소:&nbsp;</label><input type="text" class="input-field" id="sample3_detailAddress"
							placeholder="상세주소"> 
						</div>	
							<label>참고항목:&nbsp;</label><input type="text" class="input-field" id="sample3_extraAddress" placeholder="참고항목"><br>
						<input type="button" class="submit" id="btnRegister"
							name="btnRegister" value="등록" />


						<div class="form-group">
							<label class="col-form-label">사진등록</label><br>
							<div
								style="width: 200px; height: 150px; background-color: white;"
								class="img-print1">
								<img class="gc-img">
							</div>
							<input id="baby-pic" type="file" name="uploadFile1"
								class="uploadFile1" style="display: none;"
								onchange="changeValue(event)">
						</div>
						<button type="submit" class="btn btn-primary" id="btnUpdate"
							name="btnUpdate">수정</button>
						<button type="submit" class="btn btn-primary" id="btnCancel"
							name="btnCancel">취소</button>
					</form>
				</div>
				<div class="modal-footer">
					</div>
				</div>
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
											+ data.buildingName
											: data.buildingName);
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
</body>
</html>