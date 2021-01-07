<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h1 class="h3 mb-3">예약 페이지${resvType}</h1>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title mb-0">Empty card</h5>
				</div>
				<div class="card-body"></div>
			</div>

			<!-- <div class="col-12 col-md-6 col-xxl-3 d-flex order-1 order-xxl-1"> -->
			<c:if test="${resvType == 'prio'}">
				<div class="card flex-fill">
					<div class="card-header">
						<h5 class="card-title mb-0">Calendar</h5>
					</div>
					<div class="card-body d-flex">
					
						<div class="align-self-center w-100">
							<div class="chart">
								<div id="datetimepicker-dashboard"></div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${resvType == 'today'}">
				<div class="card">
					<div class="card-header">
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
						<h5 class="card-title mb-0">예약일 : <c:out value="${today}" /></h5>
					</div>
					<div class="card-body"></div>
				</div>
			</c:if>
			<!-- </div> -->
		</div>
	</div>
</body>
</html>