<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/layout/userbase.jsp" %>
<div id="background_modal" class="background_modal">
	<div class="modal_contents">
		<h4>
			<b>�մ� ���̵��?</b><span class="close">&times;</span>
		</h4><br>
			<h2 id="id_value"></h2>
		<br>
		<button type="button" id="pwSearch_btn" class="btn peach-gradient btn-rounded waves-effect">
		<i class="fa fa-envelope"></i>��й�ȣ ã��</button>
	</div>
</div>
</body>
</html>