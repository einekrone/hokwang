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

.form-control{
width:60%;
display: inline-block;
}
#postBtn{
display: inline-table;
}
#parent_addr{
width:100%;
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

function chkEmail(str) {
	$('#overLapEmail').on("click", function() {
		if ($('#parent-email').val() == '') {
			alert("이메일을 입력하시오")
		} else {
			$.ajax({
				url : "ajax/chkEmail",
				type : 'GET',
				data : {
					parent_email : $('#parent-email').val(),
				},
				error : function(xhr, status, msg) {
					alert("E-mail이 중복됩니다");
				},
				success : function(data) {
					if (data == true) {
						alert("사용가능합니다");
						
					}
					else
						alert("E-mail이 중복됩니다");	
				}
			})
		}
	})

}

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
			
		});
		
		
	})
}

function getImage(){
	$.ajax({
		url:'ajax/getParentInf',
		type:'GET',
		data:{
			parent_no:"${parent_vo.parent_no}"
		},
		dataType:'json',
		success:function(data){
			$.each(data,function(idx,item){
				console.log(item);
				if(item.parent_sns == 'social'){
					$('#divimg').append($('<img class="rounded-circle mb-2" style="width:110px; height:110px; overflow:auto;">').attr("src","${parent_vo.parent_img}"));
				}else{
					$('#divimg').append($('<img id="img" class="rounded-circle mb-2" style="width:110px; height:110px; overflow:auto;">').attr("src","${pageContext.request.contextPath}/resources/img/"+item.parent_img));
				}
				
			});
		},
		error:function(){
			alert("error");
		}
	})
}


function updateInf() {
	$('#pwUpdate').on("click", function() {
		var oldpw = $('#oldpw').val();
		console.log(oldpw);
		if ($('#pw').val() == $('#pw2').val()) {
			$.ajax({
				url : 'ajax/updatePw',
				type : 'POST',
				/* dataType : 'json', */
				data : {
					parent_pw1 : $('#oldpw').val(),
					parent_pw : $('#pw').val()
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(data) {
					console.log(data);
					if (data == true) {
						alert("변경되었습니다.");
						location.href="mmypage";
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


function getparentinf(){
	$('#updateModal').on('click',function(){
		var modal = $('#updateModal');
		$.ajax({
			url:'ajax/getParentInf',
			type:'GET',
			data : {
				parent_no : "${parent_vo.parent_no}"
			},
			dataType:'json',
			success: function(data){
				$.each(data,function(idx,item){
					console.log(item.parent_name);
					$('#parent-name').val(item.parent_name);
					$('#parent-tel').val(item.parent_tel);
					$('#parent-email').val(item.parent_email);
				})
			},
			error:function(){
				alert("error");
			}
		});
	})
}




</script>
	<h1 class="h3 mb-3">보호자정보</h1>

	<div class="row">
		<div class="col-md-4 col-xl-3">
			<div class="card mb-3">
				<div  class="card-body text-center">
				<form id='form1' method="post">
				<div id="divimg"class="card-body">
				<!--   <c:if test="${parent_vo.parent_sns == 'social' }">
					<img src="${parent_vo.parent_img}" class="img-fluid rounded-circle mb-2 gc-img" width="200" height="30" />
				</c:if> 
				<c:if test="${parent_vo.parent_sns != 'social' }">
					<img src="${pageContext.request.contextPath}/resources/img/${parent_vo.parent_img}" class="img-fluid rounded-circle mb-2 gc-img" width="200" height="30" id="img"/>
				</c:if> -->
				</div>
					<h5 class="card-title mb-0">${parent_vo.parent_name}</h5>
					<div class="text-muted mb-2">${parent_vo.parent_tel}</div>
				<c:if test="${parent_vo.parent_sns != 'social'}">
					<input type="hidden" id="parent-no" name="parent_no">
					<input type="file" name="file" id="uf"/>
						<button id="chkImg" type="submit" class="btn-secondary btn-sm">사진변경</button>
				</c:if>	
				</form>
				</div>
				<hr class="my-0" />
				<div class="card-body">
					<h5 class="h6 card-title">프로필 수정</h5>
					<input id="updateModal" type="button" class="btn btn-primary btn-sm" value="정보변경" data-toggle="modal" data-target="#parentModal">
					<c:if test="${parent_vo.parent_sns != 'social'}">
					<input id="pwbtn" type="button" class="btn btn-primary btn-sm" value="비밀번호변경" data-toggle="modal" data-target="#pwModal">
					</c:if>
				</div>
				<hr class="my-0" />
				<div class="card-body">
					<h5 class="h6 card-title">상세정보</h5>
					<ul class="list-unstyled mb-0">
						<li class="mb-1"><span data-feather="at-sign" class="feather-sm mr-1"></span> 이메일: <a style="color:blue;">${parent_vo.parent_email}</a></li>
						<li class="mb-1"><span data-feather="home" class="feather-sm mr-1"></span> 주소 : <a style="color:blue;">${parent_vo.parent_addr}</a></li>
					</ul>
				</div>
				<hr class="my-0" />
				<div class="card-body">
					<h5 class="h6 card-title">Elsewhere</h5>
					<ul class="list-unstyled mb-0">
						<li class="mb-1"><span class="fas fa-globe fa-fw mr-1"></span>
							<a href="#">staciehall.co</a></li>
					</ul>
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
				<div class="modal-body">
					<form id="form" name="form" method="post" action="updateparentinfo">
					<input type="hidden" id="parent-no" name="parent_no">
						<div class="form-group">
							<label>이름:&nbsp;</label><input type="text" class="form-control"
								id="parent-name" name="parent_name">
						</div>
						<div class="form-group">
							<label>아이디:&nbsp;</label><input type="text"
								class="form-control" id="parent-id"
								value="${parent_vo.parent_id}" readonly>
						</div>
						<div class="form-group">
							<label>전화번호:&nbsp;</label><input type="text" class="form-control"
								id="parent-tel" name="parent_tel">
						</div>
						<div class="form-group">
							<label>이메일:&nbsp;</label><input type="text" class="form-control"
								id="parent-email" name="parent_email">
								<input type="button" class="btn btn-secondary" value="중복검사"
									id="overLapEmail" name="overLapEmail">
									</div>
							<div class="form-group">
							<button type="button" class="btn btn-warning" onclick="goPopup()">주소검색</button>		
							<input type="text" id="parent_addr" name="parent_addr" class="form-control" placeholder="Enter Addr" required="true" readonly="true"/>
							<br>
							<hr>
						<button type="submit" class="btn btn-primary" id="btnUpdate"
							name="btnUpdate">수정</button>
						<button type="cancel" class="btn btn-primary" id="btnCancel"
							name="btnCancel" data-dismiss="modal">취소</button>
							</div>
					</form>
				</div>
				<div class="modal-footer">
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- 비밀번호 변경-->
		<div class="modal fade" id="pwModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">비밀번호 재확인</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
					</div>
					<div class="modal-body">
						<table>
							<tr>
								<td><span class="point">&nbsp;*</span>비밀번호</td>
								<td><input type="password" id="oldpw" name="oldpw"
									placeholder="기존 비밀번호를 입력하시오"></td>

							</tr>
							<tr>
								<td><span class="point">&nbsp;*</span>새비밀번호</td>
								<td><input type="password" id="pw" name="pw"
									placeholder="변경할 비밀번호를 입력하시오"></td>
							</tr>
							<tr>
								<td><span class="point">&nbsp;*</span>새비밀번호 확인</td>
								<td><input type="password" id="pw2" name="pw2"
									placeholder="비밀번호를 재입력하시오"></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="pwUpdate"
							data-dismiss="modal" name="pwUpdate">변경</button>
						<button class="btn btn-primary" type="button" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		
		
		<script language="javascript">
function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("popup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
		document.form.parent_addr.value = roadFullAddr;		
}
</script>
		
</body>
</html>