<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function() {
		showBabyInf();
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
				
				$.each(data, function(idx,item) {
					$('#imgInf').append($('<img>').attr("src","${pageContext.request.contextPath}/resources/img/"+item.baby_pic).attr("width","100px").attr("width","100px"));
				});
			}
		})
	}
	
	
</script>
</head>
<body>
	<h1 class="h3 mb-3" align="center">자녀 관리</h1>

	<div class="row">

		<div class="col-4">
			<div class="card">
				<div class="card-header" id ="imgInf">
		<%-- 			<image
						src="${pageContext.request.contextPath}/resources/icons/verify.png"
						id="logo" width="100px" width="100px"> </image> --%>
				</div>
				<div class="card-body">아기정보</div>
			</div>
		</div>


	</div>

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title mb-0">결제 내역</h5>
				</div>

				<div class="card-body">
					<c:forEach var="item" items="{items}">
						<span></span>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>



</body>
</html>