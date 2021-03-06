<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<form:form name="${tableName}Edit" action="${tableName}/edit"
	method="post" class="form-horizontal" modelAttribute="${tableName}Form">

	<input type="text" value="" class="hidden" name="id">
	<div class="form-group">
		<label class="control-label col-sm-2">Name:</label>
		<div class="col-sm-10">
			<input required type="text" class="form-control" name="name">
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-sm-2">Description:</label>
		<div class="col-sm-10">
			<textarea class="form-control" rows="5" name="description" value=""></textarea>
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-sm-2">Capacity:</label>
		<div class="col-sm-10">
			<input required type="number" name="capacity" value="1" min="1"
				class="form-control">
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-sm-2">Price:</label>
		<div class="col-sm-10">
			<input required type="number" class="form-control" name="price"
				value="0" min="0" step=any>
		</div>
	</div>

	<div class="form-group">

		<button type="Submit" class="btn btn-primary">Submit</button>
		<button type="Reset" class="btn">Reset</button>

	</div>
</form:form>

