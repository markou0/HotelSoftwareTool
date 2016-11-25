<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<spring:url value="/resources/css/style.css" var="mainCss" />
<html>
<head>
<title>Main</title>
<meta charset="utf-8">
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
						<li class="active"><a href=""><span
								class="glyphicon glyphicon-home"></span> <span class="sr-only">(current)</span></a></li>
						<li><a href="rooms">Rooms</a></li>
						<li><a href="services">Services</a></li>
						<li><a href="#">Bookings</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">Login</a></li>
						<li><a href="#">Sign up</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Acount <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">My page</a></li>
								<li><a href="#">Admin Tools</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">Logout</a></li>
							</ul></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</header>
	<div class="container-fluid text-center">
		<c:if test="${not empty tableName}">
			<button name="createRec" type="button" class="btn btn-primary"
				data-toggle="modal" data-target="#editRec">
				<span class="glyphicon glyphicon-plus-sign"></span> Create
				${tableName}
			</button>
			<jsp:include page="CRUID_Forms.jsp" flush="true" />
		</c:if>