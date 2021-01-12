<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		updateBabyInf();
		
		//파일 클릭 div클릭시
		$(".img-print").on("click",function(){
		    $(".uploadFile").click();            
		       
		 });
	});
	function showBabyInf(){
		$.ajax({
			url : "ajax/getBabyInf",
			type : 'GET',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				$('tbody').empty();
				$.each(data, function(idx,item) {
					 $('<tr>')
					  .append($('<td>').html(item.baby_name))
					  .append($('<td>').html(item.baby_gender))
					  .append($('<td>').html(item.baby_regno1))
					  .append($('<td>').html(item.baby_blood))
					  .appendTo('tbody');
					$('div#imgInf').append($('<img>').attr("src","${pageContext.request.contextPath}/resources/img/"+item.baby_pic).attr("width","180px").attr("height","180px"));
				});
			}
		})
	}
	
	function updateBabyInf(){
		$('body').on('click','#mobile-babyinfo tr',function(){
			console.log($(this).children());
			var tdArr = new Array();
			var td = $(this).children();

			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});

			console.log("baby :" + td.eq(0).text());
			
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
				<input type="button" class="btn btn-primary btn-sm" value="+"  data-toggle="modal" data-target="#babyModal" />
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
								<input type="text" class="form-control" id="baby-name" name="baby_name" placeholder="이름"><br>
							</div>
							<input type="hidden" class="form-control" id="parent-no">
							<div class="form-group">
								<input type="number" class="form-control" id="baby-regno1" name="baby_regno1" placeholder="생년월일 6자리 ex)910504" 
								maxlength="6" oninput="numberMaxLength(this);"><br>
							</div>
							<div class="form-group">
								<input type="number" class="form-control" id="baby-regno2" name="baby_regno2" placeholder="뒷자리 7자리"
								maxlength="7" oninput="numberMaxLength(this);"><br>
							</div>
							<div class="form-group">
								<select id="baby-gender" name="baby_gender" class="form-control">
									<option value="" selected>==성별==</option>
									<option value="M">남성</option>
									<option value="F">여성</option>
								</select>
								<br>
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
								 <div style="width:500px; height:300px; background-color:white;" class="img-print"><img class="gc-img"></div>
                                    <input id="baby-pic" type="file" name="uploadFile" class="uploadFile" style="display:none;" onchange="changeValue(event)">
									
							</div>
						<button type="submit" class="btn btn-primary" id="btnAdd"
							name="btnAdd">등록</button>
						<button type="button" class="btn btn-secondary" id="btnCancel"
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
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>



</body>
</html>