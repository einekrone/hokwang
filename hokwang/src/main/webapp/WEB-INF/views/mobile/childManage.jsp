<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<script>
//사진 미리보기 변경
function changeValue(event){
    console.log(event);//해당 이벤트 target즉 onchange이벤트가 일어난 주체의 value값      
    var reader = new FileReader();
    
    reader.onload = function(event){
       var img = $(".gc-img");
       img.attr("src",event.target.result);
       img.attr({"width":"250px","height":"250px"});
    }
    reader.readAsDataURL(event.target.files[0]);
}
//주민번호 글자수 제한
function numberMaxLength(e){
    if(e.value.length > e.maxLength){
        e.value = e.value.slice(0, e.maxLength);
    }
}

	$(function() {
		showBabyInf();
		getBabyInf();
	
		
		//파일 div클릭시
		$(".img-print").on("click",function(){
		    $(".uploadFile").click();            
		       
		 });
		$(".img-print1").on("click",function(){
		    $(".uploadFile1").click();            
		       
		 });
	});
	function showBabyInf(){
		$.ajax({
			url : "ajax/getBabyInf",
			type : 'GET',
			dataType : 'json',
			data:{
				parent_no:"${parent_vo.parent_no}"
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				$('#babyList').empty();
				$.each(data, function(idx,item) {
					 $('<tr>')
					  .append($('<td>').html(item.baby_name))
					  .append($('<td>').html(item.baby_gender))
					  .append($('<td>').html(item.baby_regno1))
					  .append($('<td>').html(item.baby_blood))
					  .appendTo('#babyList');
					$('div#imgInf').append($('<img class="rounded-circle mb-2" style="width:110px; height:110px; overflow:auto;">').attr("src","${pageContext.request.contextPath}/resources/img/"+item.baby_pic)
					.attr("onclick","location.href='babyDiary?baby_no='"+item.baby_no)
					);
				});
			}
		})
	}
	
	function getBabyInf(){
		$('body').on('click','#mobile-babyinfo tr',function(){
			var td = $(this).children();
			//console.log("이름 : " + td.eq(0).text());
			
			$.ajax({
				url:'getInfo',
				type:'GET',
				data : {
					baby_name : td.eq(0).text(),
					parent_no : "${parent_vo.parent_no}"
				},
				dataType:'json',
				success: function(data){
					console.log(data);
					var modal = $('#updateModal');
					modal.find('#baby-name').val(data.baby_name);
					modal.find('#baby-regno1').val(data.baby_regno1);
					modal.find('#baby-regno2').val(data.baby_regno2);
					modal.find('#baby-gender').val(data.baby_gender);
					modal.find('#baby-blood').val(data.baby_blood);
					modal.modal('show');
					
				},
				error:function(){
					alert("error");
				}
				
				
			});
			
		})
	}
	
	
</script>
</head>
<body>
	<h1 class="h3 mb-3" align="center">자녀 관리</h1>
	<div class="row mb-2 mb-xl-3">
		<div class="col-auto ml-auto text-right mt-n1">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb bg-transparent p-0 mt-1 mb-0">
				</ol>
				<input id="babybtn" type="button" class="btn btn-primary btn-sm" value="+" data-toggle="modal" data-target="#babyModal" />
			</nav>
		</div>
	</div>


		<div class="col-xl-6 col-xxl-5 d-flex">
			<div id ="imgInf">
				<div class="card-body">
		<%-- 			<image
						src="${pageContext.request.contextPath}/resources/icons/verify.png"
						id="logo" width="100px" width="100px"> </image> --%>
				</div>
				<div class="card-header">아기정보</div>
			</div>
		</div>

	<div class="modal fade" id="babyModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">자녀 등록</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form encType="multipart/form-data" method="post" action="insertbabyinfo">
						<div class="form-group">
								<input type="text" class="form-control" id="baby-name" name="baby_name" placeholder="이름" >
							</div>
							<input type="hidden" class="form-control" id="parent-no" name="parent_no">
							<div class="form-group">
								<input type="number" class="form-control" id="baby-regno1" name="baby_regno1" placeholder="생년월일 6자리 ex)910504" 
								maxlength="6" oninput="numberMaxLength(this);">
							</div>
							<div class="form-group">
								<input type="number" class="form-control" id="baby-regno2" name="baby_regno2" placeholder="뒷자리 7자리"
								maxlength="7" oninput="numberMaxLength(this);">
							</div>
							<div class="form-group">
								<select id="baby-gender" name="baby_gender" class="form-control">
									<option value="" selected>==성별==</option>
									<option value="M">남성</option>
									<option value="F">여성</option>
								</select>
								
							</div>
							<div class="form-group">
								<select  id="baby-blood" name="baby_blood" class="form-control">
									<option value="" selected>==혈액형==</option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="AB">AB</option>
									<option value="O">O</option>
								</select>
							</div>
							<div class="form-group">
								<label class="col-form-label">사진등록</label>
								 <div style="width:200px; height:150px; background-color:white;" class="img-print"><img class="gc-img"></div>
                                    <input id="baby-pic" type="file" name="uploadFile" class="uploadFile" style="display:none;" onchange="changeValue(event)">
									
							</div>
						<button type="submit" class="btn btn-primary" id="btnAdd"
							name="btnAdd">등록</button>
						</form>
					</div>
					<div class="modal-footer">
					</div>
				</div>
			</div>
		</div>
		
<!-- 아기 정보수정 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">자녀 정보수정</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form encType="multipart/form-data" method="post" action="updatebabyinfo">
						<div class="form-group">
								<input type="text" class="form-control" id="baby-name" name="baby_name"  placeholder="이름" >
							</div>
							<input type="hidden" class="form-control" id="parent-no" name="parent_no">
							<div class="form-group">
								<input type="number" class="form-control" id="baby-regno1" name="baby_regno1" placeholder="생년월일 6자리 ex)910504" 
								maxlength="6" oninput="numberMaxLength(this);">
							</div>
							<div class="form-group">
								<input type="number" class="form-control" id="baby-regno2" name="baby_regno2" placeholder="뒷자리 7자리"
								maxlength="7" oninput="numberMaxLength(this);">
							</div>
							<div class="form-group">
								<select id="baby-gender" name="baby_gender" class="form-control">
									<option value="" selected>==성별==</option>
									<option value="M">남성</option>
									<option value="F">여성</option>
								</select>
								
							</div>
							<div class="form-group">
								<select  id="baby-blood" name="baby_blood" class="form-control">
									<option value="" selected>==혈액형==</option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="AB">AB</option>
									<option value="O">O</option>
								</select>
							</div>
							<div class="form-group">
								<label class="col-form-label">사진등록</label><br>
								 <div style="width:200px; height:150px; background-color:white;" class="img-print1"><img class="gc-img"></div>
                                    <input id="baby-pic" type="file" name="uploadFile1" class="uploadFile1" style="display:none;" onchange="changeValue(event)">
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
	

 <!-- 아기 목록 -->
	<div class="row">
		<div class="col-12 col-lg-8 col-xxl-9 d-flex">
			<div class="card flex-fill">
				<div class="card-header">
					<h5 class="card-title mb-0">아기</h5>
				</div>
				<table id="mobile-babyinfo" class="table table-hover my-0">
					<thead>
						<tr>
							<th>이름</th>
							<th>성별</th>
							<th>생년월일</th>
							<th>혈액형</th>
						</tr>
					</thead>
					<tbody id="babyList">
					</tbody>
				</table>
			</div>
		</div>
	</div>



</body>
</html>