<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
$(document).ready(function(){
	
	$('ul.tabs li').click(function(){							//선택자를 통해 tabs 메뉴를 클릭 이벤트를 지정해줍니다.
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');			//선택 되있던 탭의 current css를 제거하고 
		$('.tab-content').removeClass('current');		

		$(this).addClass('current');								////선택된 탭에 current class를 삽입해줍니다.
		$("#" + tab_id).addClass('current');
	})

});
</script>
<body>
	<h1 class="h3 mb-3">결제 관리</h1>

	<div class="row">
		<div class="col-4">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title mb-0">
						<a href="${pageContext.request.contextPath}/views/mobile/records.jsp">
            				<image src="${pageContext.request.contextPath}/resources/icons/verify.png" id="logo" width="50px" width="50px">
            				</image>
        				</a>
         			</h5>
				</div>
				<div class="card-body">전체 내역</div>
			</div>
		</div>
		
		<div class="col-4">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title mb-0">
						<a href="${pageContext.request.contextPath}/views/mobile/records.jsp">
            				<image src="${pageContext.request.contextPath}/resources/icons/verify.png" id="logo" width="50px" width="50px">
            				</image>
        				</a>
         			</h5>
				</div>
				<div class="card-body">미 결제</div>
			</div>
		</div>
		
		<div class="col-4">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title mb-0">
						<a href="${pageContext.request.contextPath}/views/mobile/records.jsp">
            				<image src="${pageContext.request.contextPath}/resources/icons/verify.png" id="logo" width="50px" width="50px">
            				</image>
        				</a>
         			</h5>
				</div>
				<div class="card-body">예약 내역</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title mb-0">
						결제 내역
         			</h5>
				</div>
				
				<div class="card-body">
					<c:forEach var="item" items="{items}">
						<span></span>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
<div class="container">
<!-- 탭 메뉴 상단 시작 -->
	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1">메뉴_하나</li>
		<li class="tab-link" data-tab="tab-2">메뉴_둘</li>
		<li class="tab-link" data-tab="tab-3">메뉴_셋</li>
	</ul>
<!-- 탭 메뉴 상단 끝 -->
<!-- 탭 메뉴 내용 시작 -->
	<div id="tab-1" class="tab-content current">
    <h1>탭 메뉴 1 내용입니다.</h1>
   
	</div>
	<div id="tab-2" class="tab-content">
  <h1>  탭 메뉴 2 내용입니다.  </h1>
  
	</div>
	<div id="tab-3" class="tab-content">
  <h1>  탭 메뉴 3 내용입니다.  </h1>
  
	</div>
<!-- 탭 메뉴 내용 끝 -->
</div>
</body>
</html>