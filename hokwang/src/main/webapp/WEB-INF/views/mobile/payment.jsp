<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 진행 중</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li{
  display: inline-block;
	background: #898989;
	color: white;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #e0e0e0;
	color: #222;
}

.tab-content{
  display: none;
	background: #e0e0e0;
	padding: 12px;
}

.tab-content.current{
	display: inherit;
}

</style>
</head>
<script>

$(function() {
	getUnPaidList();
});

function getUnPaidList() {
	$.ajax({
		url : 'ajax/getUnPaidList',
		type : 'GET',
		data : {
			parent_no : "${parent_vo.parent_no}"
		},
		error : function(xhr, status, msg) {
			alert("상태값 :" + status + " Http에러메시지 :" + msg);
		},
		success : unPaidListResult
	});
}


function unPaidListResult(data){
	$("#unPaidList").empty();
	console.log(data);
	$.each(data,function(idx, item){
		$("#unPaidList").append($('<div>').attr('class','col-12')
				     .append($('<div>').attr('class','card'))
				     .append($('<span>').html('결제일시 : ' + item.PAY_DATE))
				     .append($('<hr style="padding:0; margin-top:5px;">'))
				     .append($('<p>').html('아기이름 : ' + item.BABY_NAME))
				     .append($('<p>').html('진단병명 : ' + item.DIS_NAME))
				  	 .append($('<p>').html('결제금액 : ' + item.PAY_PRICE))
				     
		 )		     
	});
}
</script>
<body>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<h1>결제 내역</h1>
				<div class="row" id="unPaidList">

				</div>
			</div>	
		</div>
	</div>
</body>
</html>