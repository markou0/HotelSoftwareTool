<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>

<body>

	<div class="row">
		<div class="col-sm-4 col-xs-1"></div>
		<div class="col-sm-4 col-xs-10">
			<h2>Login form</h2>
			<form class="form-horizontal" name='form_login'
				action="j_spring_security_check" method='POST'>
				<div class="form-group">
					<label class="control-label col-sm-3" for="email">Username:</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="username"
							placeholder="Enter username" name='user_login'>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="pwd">Password:</label>
					<div class="col-sm-9">
						<input type="password" class="form-control" id="pwd"
							placeholder="Enter password" name='password_login'>
					</div>
				</div>
				<div class="form-group">
					<span class="bg-danger"><c:if test="${not empty error}">
					${error}</span>
				</c:if>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-2">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
					<div class="col-sm-3">
						<a href="#" class="btn btn-default">Sign up</a>
					</div>
				</div>
			</form>
		</div>
		<div class="col-sm-4 col-xs-1"></div>
	</div>

</body>
</html>