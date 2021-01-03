<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 여기에 js가 없어서 에러 -->
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function() {
		checkMsg();
		showNotReadMsg();
	});

	function checkMsg() {
		$.ajax({
			url : "ajax/getCountMsg",
			type : 'GET',
			dataType : 'json',
			data : {
				emp_no : "${emp_vo.emp_no}"
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				$('#msgCount').text(data);
			}
		})

	}

	function showNotReadMsg() {
		$.ajax({
			url : "ajax/showNotReadMsg",
			type : 'POST',
			dataType : 'json',
			data : {
				emp_no : "${emp_vo.emp_no}"
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : getMessageList
		})
	}
	
	function getMessageList(data){
		var cnt=0;
 		$.each(data, function(idx, item){
			
	 			if(item.msg_yn=="N"){
					$('#showMessage').append(
							$('<a>').addClass("dropdown-item d-flex align-items-center")
								.append($('<div>').addClass("dropdown-list-image mr-3")
									.append($('<img>').addClass('rounded-circle').attr('src',"${pageContext.request.contextPath}/resources/img/"+item.emp_profile)))
								.append($('<div>').addClass("font-weight-bold")
									.append($('<div>').addClass("text-truncate").text(item.msg_cont)
								.append($('<div>').addClass("small text-gray-500").text(item.msg_date))))
					
					)
				
				}
				else if(item.msg_yn=="Y"){
					$('#showMessage').append(
							$('<a>').addClass("dropdown-item d-flex align-items-center")
								.append($('<div>').addClass("dropdown-list-image mr-3")
									.append($('<img>').addClass('rounded-circle').attr('src',"${pageContext.request.contextPath}/resources/img/"+item.emp_profile)))
								.append($('<div>')
									.append($('<div>').addClass("text-truncate").text(item.msg_cont)
								.append($('<div>').addClass("small text-gray-500").text(item.msg_date))))
					)
					
				}
	 		if(idx==3){
			 /* $('#showMessage').appendTo($('a').addClass("dropdown-item text-center small text-gray-500").text('Read More Messages'))  
	 		 */	return false;
	 		}
	 			
		});
 		 
 		 
		console.log(data);
	}
	
</script>
</head>
<body>


	<!-- Topbar -->
	<nav
		class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"
		style="height: 40px; margin-bottom: 0px !important;">

		<!-- Topbar Navbar -->
		<ul class="navbar-nav ml-auto">
			<!-- Dropdown - Messages -->
			<div
				class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
				aria-labelledby="searchDropdown">
				<form class="form-inline mr-auto w-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-light border-0 small"
							placeholder="Search for..." aria-label="Search"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
			</div>

			<!-- 	<li class="nav-item dropdown no-arrow mx-1"><input
				style="margin-top: 20px;" type="button" value="홈" id="homeBtn"
				onclick="location.href='base'" /></li>  -->

			<c:if test="${emp_vo != null }">
				<!-- Nav Item - Messages -->
				<li class="nav-item dropdown no-arrow mx-1"><a
					class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i> <!-- Counter - Messages -->
						<span class="badge badge-danger badge-counter" id="msgCount"></span>
				</a> <!-- Dropdown - Messages -->
					<div
						class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
						aria-labelledby="messagesDropdown" id = "showMessage">
						<h6 class="dropdown-header" >쪽지함</h6>
						<%-- <a class="dropdown-item d-flex align-items-center">
							<div class="dropdown-list-image mr-3">
								<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/d1.png">
							</div>

							<div class="font-weight-bold"><!-- 읽음여부표시 -->
								<div class="text-truncate">Hi there! I am wondering if you
									can help me with a problem I've been having.</div>
								<div class="small text-gray-500">Emily Fowler · 58m</div>
							</div>
						</a>  --%> 
						<a class="dropdown-item text-center small text-gray-500" href="mypage">Read
							More Messages</a>
					</div>
					</li>

				<div class="topbar-divider d-none d-sm-block"></div>

				<!-- Nav Item - User Information -->
				<li class="nav-item dropdown no-arrow"><a
					class="nav-link dropdown-toggle" href="#" id="userDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span
						class="mr-2 d-none d-lg-inline text-gray-600 small">${emp_vo.emp_name}
					</span> <!-- 이름부분 --> <img class="img-profile rounded-circle"
						src="${pageContext.request.contextPath}/resources/img/${emp_vo.emp_profile}">
				</a> <!-- Dropdown - User Information -->
					<div
						class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
						aria-labelledby="userDropdown">
						<a class="dropdown-item" href="mypage"> <i
							class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#" data-toggle="modal"
							data-target="#logoutModal"> <i
							class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
							Logout
						</a>
					</div></li>
			</c:if>
		</ul>
	</nav>

	<!-- End of Topbar -->
</body>
</html>