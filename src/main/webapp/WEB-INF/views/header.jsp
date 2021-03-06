<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<spring:url value="/resources/css/style.css" var="mainCss" />
<html>
<head>
<title>Main</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Language" content="ua">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="${mainCss}" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

</head>
<body>
	<header>
		<div id="header" class="page-header">
			<h1>Hotel Stanislaw</h1>
			<p>Luxury Hotel Service</p>
		</div>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>

				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li value="home" class=""><a href=""><span
								class="glyphicon glyphicon-home"></span> </a></li>
						<li value="rooms" class=""><a href="rooms">Rooms</a></li>
						<li value="services"><a href="services">Services</a></li>
						<sec:authorize access="isAuthenticated()">
							<li value="roomBookings"><a href="roomBookings">Room
									Bookings</a></li>
							<li value="serviceBookings"><a href="serviceBookings">Service
									Bookings</a></li>
						</sec:authorize>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<c:choose>
							<c:when test="${empty pageContext.request.userPrincipal}">
								<li><a href="login">Login</a></li>
							</c:when>
							<c:otherwise>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">${pageContext.request.userPrincipal.name}<span
										class="caret"></span></a>
									<ul class="dropdown-menu">
										<li role="separator" class="divider"></li>
										<li><a href="j_spring_security_logout">Logout</a></li>
									</ul></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		<script>
		<c:choose>
	    <c:when test="${not empty tableName}">
	    $(document).ready(function() {
			$("ul.navbar-nav li[value='<c:out value="${tableName}s"/>']").addClass("active");
		})
	    </c:when>
	    <c:otherwise>
	    <c:if test="${not empty content}">
	    $(document).ready(function() {
			$("ul.navbar-nav li[value='<c:out value="${content}"/>']").addClass("active");
		})
		 </c:if>
	    </c:otherwise>
		</c:choose>
		
		function validateRoomBookingForm() {
			if($('input[name="dateTo"]').val()<=$('input[name="dateFrom"]').val()){
				alert("Invalid date Range!");
				return false;
			}
			return true;
		}
		</script>
	</header>
	<div class="container text-center">
		<c:choose>
			<c:when test="${empty pageContext.request.userPrincipal}">
				<h4 class="bg-warning">
					Please login to order Room or Service</a>
				</h4>
			</c:when>
		</c:choose>
		<sec:authorize access="hasRole('CLIENT')">
			<c:if
				test="${tableName=='serviceBooking' || tableName=='roomBooking'}">
				<button id="createRec" type="button" class="btn btn-primary"
					data-toggle="modal" data-target="#editRec">
					<span class="glyphicon glyphicon-plus-sign"></span> Create
					${tableName}
				</button>
				<jsp:include page="CRUID_Forms.jsp" flush="true" />
			</c:if>
		</sec:authorize>
		<sec:authorize access="hasRole('ADMIN')">
			<c:if test="${not empty tableName}">
				<button id="createRec" type="button" class="btn btn-primary"
					data-toggle="modal" data-target="#editRec">
					<span class="glyphicon glyphicon-plus-sign"></span> Create
					${tableName}
				</button>
				<jsp:include page="CRUID_Forms.jsp" flush="true" />
			</c:if>
		</sec:authorize>