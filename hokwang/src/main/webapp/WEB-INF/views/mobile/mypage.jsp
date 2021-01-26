<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
#chkImg {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	width: 100px;
}

.form-control {
	width: 60%;
	display: inline-block;
}

#postBtn {
	display: inline-table;
}

#parent_addr {
	width: 100%;
}
</style>
</head>
<body>
	<script>
		var e = false;
		var i = false;
		$(function() {
			checkImg();
			changeImg();
			getImage();
			updateInf();
			getparentinf();
			chkEmail();
			mainSelect();

			var fileTarget = $('.file-upload .upload-hidden');

			fileTarget.on('change', function() { // 값이 변경되면
				if (window.FileReader) { // modern browser
					var filename = $(this)[0].files[0].name;
				} else { // old IE
					var filename = $(this).val().split('/').pop().split('\\')
							.pop(); // 파일명만 추출
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

		function chkEmail() {
			$('#overLapEmail').on("click",
							function() {
								var emailVal = $("#parent-email").val();
								var regExp = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
								if ($('#parent-email').val() == '') {
									alert("이메일을 입력하시오")
								} else {
									$
											.ajax({
												url : "ajax/chkEmail",
												type : 'GET',
												data : {
													parent_email : $(
															'#parent-email')
															.val(),
												},
												error : function(xhr, status,
														msg) {
													alert("에러");
												},
												success : function(data) {
													if(data == true){
														if (emailVal.match(regExp) != null) {
															alert('이메일 사용가능합니다.');
														} else {
															alert('이메일 형식이 아닙니다.');
														}	
													}else{
														alert('E-mail이 중복됩니다');
													}
													
													

												}
											})
								}
							})

		}

		function checkImg() {

			$('#chkImg').on('click', function() {
				var file = $('#file').val();
				if (file == '') {
					alert("사진을 선택하세요");
					return false;
				}
			})
		}

		function changeImg() {
			$('#chkImg').on('click', function() {
				var form = $('#form1')[0];
				var formData = new FormData(form);
				console.log(form);
				console.log(formData);
				$.ajax({
					url : 'ajax/imgUpdate',
					method : 'post',
					enctype : 'multipart/form-data',
					contentType : false,
					processData : false,
					data : formData,
					dataType : 'json',
					success : function() {
						alert("성공");
					},
					error : function() {
						alert("실패");
					}

				});

			})
		}

		function getImage() {
			$
					.ajax({
						url : 'ajax/getParentInf',
						type : 'GET',
						data : {
							parent_no : "${parent_vo.parent_no}"
						},
						dataType : 'json',
						success : function(data) {
							$
									.each(
											data,
											function(idx, item) {
												console.log(item);
												if (item.parent_sns == 'social') {
													$('#divimg')
															.append(
																	$(
																			'<img class="rounded-circle mb-2" style="width:150px; height:150px;">')
																			.attr(
																					"src",
																					"${parent_vo.parent_img}"));
												} else if (item.parent_img == null) {
													$('#divimg')
															.append(
																	$(
																			'<img id="img" class="rounded-circle mb-2" style="width:150px; height:150px;">')
																			.attr(
																					"src",
																					"${pageContext.request.contextPath}/resources/img/emptyimg.png"));
												} else {
													$('#divimg')
															.append(
																	$(
																			'<img id="img" class="rounded-circle mb-2" style="width:150px; height:150px;">')
																			.attr(
																					"src",
																					"${pageContext.request.contextPath}/resources/img/"
																							+ item.parent_img));
												}

											});
						},
						error : function() {
							alert("error");
						}
					})
		}

		function updateInf() {
			$('#pwUpdate').on("click", function() {
				if ($('#pw').val() == $('#pw2').val()) {
					$.ajax({
						url : 'ajax/updatePw',
						type : 'POST',
						/* dataType : 'json', */
						data : {
							parent_pw1 : $('#parent_pw').val(),
							parent_pw : $('#pw').val()
						},
						error : function(xhr, status, msg) {
							alert("기존 비밀번호를 확인해주세요.");
						},
						success : function(data) {
							console.log(data);
							if (data == true) {
								alert("변경되었습니다 다시로그인 하세요.");
								location.href = "logoutM";
								//location.reload(true);
							} else {
								alert("비밀번호가 일치하지않습니다. ")
							}
						}
					});
				} else {
					alert("새 비밀번호가 일치하지않습니다. ");
				}
			});
		}

		function getparentinf() {
			$('#updateModal').on('click', function() {
				var modal = $('#updateModal');
				$.ajax({
					url : 'ajax/getParentInf',
					type : 'GET',
					data : {
						parent_no : "${parent_vo.parent_no}"
					},
					dataType : 'json',
					success : function(data) {
						$.each(data, function(idx, item) {
							console.log(item.parent_name);
							$('#parent-name').val(item.parent_name);
							$('#parent-tel').val(item.parent_tel);
							$('#parent-email').val(item.parent_email);
							$('#parent_addr').val(item.parent_addr);
						})
					},
					error : function() {
						alert("error");
					}
				});

			})
		}

		function mainSelect() {
			$.ajax({
				url : 'ajax/getParentInf',
				type : 'GET',
				data : {
					parent_no : "${parent_vo.parent_no}"
				},
				dataType : 'json',
				success : function(data) {
					$.each(data, function(idx, item) {
						console.log(item.parent_name);
						$('#main-name').html(item.parent_name);
						$('#main-tel').html(item.parent_tel);
						$('#main-email').html(item.parent_email);
						$('#main-addr').html(item.parent_addr);
						$('#main-id').html(item.parent_id);
					})
				},
				error : function() {
					alert("error");
				}
			});
		}
	</script>
	<div class="row">
		<div class="col-md-4 col-xl-3">
			<div class="card mb-3">
				<div class="card-body text-center">
					<form id='form1' method="post" style="margin-bottom: 10px;">
						<div id="divimg" class="card-body" style="padding: 0;"></div>
						<h5 id="main-name" class="h5 card-title mb-0"></h5>
						<span data-feather="phone" class="feather-sm mr-1"></span><a
							id="main-tel" style="color: black;"></a>
						<c:if test="${parent_vo.parent_sns != 'social'}">
							<input type="hidden" id="parent-no" name="parent_no">
							<input type="file" name="file" id="uf" style="width: 200px;" />
							<button id="chkImg" type="submit" class="btn-secondary btn-sm"
								style="color: black;">사진변경</button>
						</c:if>
					</form>
					<input id="updateModal" type="button"
						class="btn btn-primary btn-sm" value="정보변경" data-toggle="modal"
						data-target="#parentModal">
					<c:if test="${parent_vo.parent_sns != 'social'}">
						<input id="pwbtn" type="button" class="btn btn-secondary btn-sm"
							value="비밀번호변경" data-toggle="modal" data-target="#pwModal">
					</c:if>
				</div>
				<hr class="my-0" />
				<div class="card-body">
					<h5 class="h6 card-title">상세정보</h5>
					<ul class="list-unstyled mb-0">
						<li class="mb-1"><span data-feather="info"
							class="feather-sm mr-1"></span> 아이디 : <a id="main-id"
							style="color: blue;"></a></li>
						<li class="mb-1"><span data-feather="at-sign"
							class="feather-sm mr-1"></span> 이메일: <a id="main-email"
							style="color: blue;"></a></li>
						<li class="mb-1"><span data-feather="home"
							class="feather-sm mr-1"></span> 주소 : <a id="main-addr"
							style="color: blue;"></a></li>
					</ul>
				</div>
				<hr class="my-0" />

				<!--<div class="card-body">
					<h5 class="h6 card-title">Elsewhere</h5>
					<ul class="list-unstyled mb-0">
						<li class="mb-1"><span class="fas fa-globe fa-fw mr-1"></span>
							<a href="#">staciehall.co</a></li>
					</ul>
				</div>-->
			</div>
		</div>
	</div>
	<!-- 부모정보수정 -->
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
				<form id="form" name="form" method="post" action="updateparentinfo">
					<div class="modal-body">
						<input type="hidden" id="parent-no" name="parent_no">
						<div class="form-group">
							<label>이름:&nbsp;</label><input type="text" class="form-control"
								id="parent-name" name="parent_name">
						</div>
						<div class="form-group">
							<label>아이디:&nbsp;</label><input type="text" class="form-control"
								id="parent-id" value="${parent_vo.parent_id}" readonly>
						</div>
						<div class="form-group">
							<label>전화번호:&nbsp;</label><input type="text" class="form-control"
								id="parent-tel" name="parent_tel">
						</div>
						<div class="form-group">
							<label>이메일:&nbsp;</label><input type="text" class="form-control"
								id="parent-email" name="parent_email"> <input
								type="button" class="btn btn-secondary" value="중복검사"
								id="overLapEmail" name="overLapEmail">
						</div>
						<div class="form-group">
							<button type="button" class="btn btn-warning" onclick="goPopup()"
								style="margin-bottom: 10px;">주소검색</button>
							<input type="text" id="parent_addr" name="parent_addr"
								class="form-control" placeholder="Enter Addr" required readonly />
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary" id="btnUpdate"
							name="btnUpdate">수정</button>
						<button type="button" class="btn btn-primary" id="btnCancel"
							name="btnCancel" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- 비밀번호 변경-->
	<div class="modal fade" id="pwModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body">
					<table>
						<tr>
							<td><span class="point">&nbsp;*</span>비밀번호</td>
							<td><input type="password" id="parent_pw" name="parent_pw"
								placeholder="기존 비밀번호를 입력하시오" style="width: 230px;"></td>

						</tr>
						<tr>
							<td><span class="point">&nbsp;*</span>새비밀번호</td>
							<td><input type="password" id="pw" name="pw"
								placeholder="변경할 비밀번호를 입력하시오" style="width: 230px;"></td>
						</tr>
						<tr>
							<td><span class="point">&nbsp;*</span>새비밀번호 확인</td>
							<td><input type="password" id="pw2" name="pw2"
								placeholder="비밀번호를 재입력하시오" style="width: 230px;"></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="pwUpdate"
						name="pwUpdate">변경</button>
					<button class="btn btn-primary" type="button" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>


	<script language="javascript">
		function goPopup() {

			// 주소검색을 수행할 팝업 페이지를 호출합니다.
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
			var pop = window.open("popup", "pop",
					"width=570,height=420, scrollbars=yes, resizable=yes");

			// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
			//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
		}

		function jusoCallBack(roadFullAddr) {
			console.log(roadFullAddr);
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
			document.form.parent_addr.value = roadFullAddr;
		}
	</script>

</body>
</html>