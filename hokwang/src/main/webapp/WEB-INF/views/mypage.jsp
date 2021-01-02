<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
.row {
	margin: 30px 0px 0px 180px;
}
}
</style>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>호광병원</title>

<!-- Custom fonts for this template-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
	
	
	
<script>
$('#v-pills-tab a').on('click', function (e) {
	  e.preventDefault()
	  $(this).tab('show')
	  $('#v-pills-tab a[href="#profile"]').tab('show') // Select tab by name
	  $('#v-pills-tab li:first-child a').tab('show') // Select first tab
	  $('#v-pills-tab li:last-child a').tab('show') // Select last tab
	  $('#v-pills-tab li:nth-child(3) a').tab('show') 
	})


	
	
	
</script>

</head>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="container-fluid" style="margin-top: 0px !important;">


		<div class="page-header header-filter" style="background-image: url('../assets/img/udo2.jpg'); background-size: cover; background-position: top center;">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-4 col-md-6 ml-auto mr-auto">
	                    <div class="card">
	                        <div class="card-body">
		                        <div class="text-center">
		                            <!-- uPhoto 변수 설정 -->
		                            <c:set var = "uPhoto" value = "${loginInfo.uPhoto}" />
			                         <c:choose>
			                          	<c:when test="${empty uPhoto}">
			                           		<img src="../uploadFile/no_images.jpg" style="width: 150px; height: 160px">
			                           	</c:when>
			                           	<c:otherwise>
			                           		<img src="../uploadFile/${loginInfo.uPhoto}" style="width: 150px; height: 160px">
			                           	</c:otherwise>
			                            </c:choose>                                
		                        </div>
		                        <br>
	                            <div class="content" style="margin: 10px;">
	                                <!--ID-->
	                                <div class="col-lg-12 col-md-6 ml-auto mr-auto">
	                                    <div class="row">
	                                        <div class="col-md-2">
	                                            <i class="material-icons">email</i>
	                                        </div>
	                                        <div class="col-md-10" id=uId>${loginInfo.uId}</div>
	                                    </div>
	                                </div>
	                                
	                                <!--Phone-->
	                                <br>
	                                <div class="col-lg-12 col-md-6 ml-auto mr-auto">
	                                    <div class="row">
	                                        <div class="col-md-2">
	                                            <i class="material-icons">face</i>
	                                        </div>
	                                        <c:set var = "uName" value = "${loginInfo.uName}"/>
	                                        <c:choose>
	                                        	<c:when test="${empty uName}">
	                                        		<div class="col-md-10" id=uName>[이름]정보가 없습니다.</div>
	                                        	</c:when>
	                                        	<c:otherwise>
	                                        		<div class="col-md-10" id=uName>${loginInfo.uName}</div>
	                                        	</c:otherwise>
	                                        </c:choose>       
	                                    </div>
	                                </div>
	                                
	                                <!--Phone-->
	                                <br>
	                                <div class="col-lg-12 col-md-6 ml-auto mr-auto">
	                                    <div class="row">
	                                        <div class="col-md-2">
	                                            <i class="material-icons">phone</i>
	                                        </div>
	                                        <div class="col-md-10" id=uPhone>${loginInfo.uPhone}</div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="card-footer">
	                            <div class="col-md-4 text-center">
	                                <a class="text-primary" href="<c:url value='/member/myPage/update' />" style="font-size: 12px">
	                                	프로필 변경
	                                </a>
	                            </div>
	                            <div class="col-md-4 text-center">
	                                <a class="text-primary" href="<c:url value='/member/myPage/logout' />" style="font-size: 12px">
	                                  	로그아웃
	                                </a>
	                            </div>
	                            <div class="col-md-4 text-center">
	                                <a class="text-primary" href="<c:url value='/member/myPage/delete' />" style="font-size: 12px">
	                                   	 회원탈퇴
	                                </a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
        </div>




		<!-- Content Row -->
		<div class="row" id="row">
			<div class="col-xl-12 col-md-6 mb-4">
				<div>
					<div class="card shadow py-2" style="height: 350px; float: left; width: 50%">
						<div class="card-body">
							<table>
							<!-- 이미지 파일 -->
								<tr>
									<td>
										<img src="images/${empvo.emp_profile}" 	style="width: 150px; height: 160px"><br>
										첨부파일 <input type="file" name="uploadFile"/><br/>
											  <input type="submit" value="저장">
										      <a href="filedown?uFile=${empvo.emp_profile}"> 파일다운 </a>
									</td>
									<td class="content" style="margin: 10px;">
								</tr>
								
								<tr>
									<td>123</td>
									<td>123</td>
								</tr>
								<tr>
									<td>123</td>
									<td>123</td>
								</tr>
	                              
							</table>
						</div>

							                        <div class="card-footer">
	                            <div class="col-md-4 text-center">
	                                <a class="text-primary" href="<c:url value='update' />" style="font-size: 15px"	>
	                                	프로필 변경
	                                </a>
	                            </div>
	                            <div class="col-md-4 text-center">
	                                <a class="text-primary" href="<c:url value='logout' />" style="font-size: 15px">
	                                  	로그아웃
	                                </a>
	                            </div>
	                            <div class="col-md-4 text-center">
	                                <a class="text-primary" href="<c:url value='delete' />" style="font-size: 15px">
	                                   	 회원탈퇴
	                                </a>
	                            </div>
	                        </div>
					</div>
					<div class="card shadow py-2"
						style="height: 350px; float: left; width: 50%">
						<div class="card-body"></div>
					</div>

				</div>
				<div class="card shadow py-2" style="height: 480px;">
					<div class="card-body">
					<div>
					<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					  <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Home</a>
					  <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Profile</a>
					  <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">Messages</a>
					  <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Settings</a>
					</div>
					<div class="tab-content" id="v-pills-tabContent">
					  <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">sdfsdfsdfsdfsdfsa</div>
					  <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">sdfsdfsdfsdf</div>
					  <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">dsfsdfsdfsd</div>
					  <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">sdfsdfsd</div>
					</div>
					<div class="tab-content">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">...</div>
  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">...</div>
  <div class="tab-pane fade" id="messages" role="tabpanel" aria-labelledby="messages-tab">...</div>
  <div class="tab-pane fade" id="settings" role="tabpanel" aria-labelledby="settings-tab">...</div>
</div>
					</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>