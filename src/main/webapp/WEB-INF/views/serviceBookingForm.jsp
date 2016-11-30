<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<form:form name="${tableName}Edit" action="${tableName}/edit"
	method="post" class="form-horizontal">

	<input type="text" value="" class="hidden" name="id">
	<input type="text" value="" class="hidden" name="userName">

	<div class="form-group">
		<label class="control-label col-sm-2">Service Name:</label>
		<div class="col-sm-10">
			<select required class="form-control" name="serviceName">
				<c:forEach var="service" items="${services}" varStatus="status">
					<option value="${service.name}">${service.name}</option>
				</c:forEach>
			</select>
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-sm-2">At Date</label>
		<div class="col-sm-10">
			<input required type="date" class="form-control" name="atDate">
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2">At Time</label>
		<div class="col-sm-10">
			<input required type="time" class="form-control" name="atTime">
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-sm-2">Price:</label>
		<div class="col-sm-10">
			<input required disabled type="number" class="form-control"
				name="price" value="0" min="0" step=any>
		</div>
	</div>

	<div class="form-group">

		<button type="Submit" class="btn btn-primary">Submit</button>
		<button type="Reset" class="btn">Reset</button>

	</div>
</form:form>

