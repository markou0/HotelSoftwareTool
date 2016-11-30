<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<form:form name="${tableName}Edit" action="${tableName}/edit" onsubmit="return validateRoomBookingForm()"
	method="post" class="form-horizontal">

	<input type="text" value="" class="hidden" name="id">
	<input type="text" value="" class="hidden" name="userName">

	<div class="form-group">
		<label class="control-label col-sm-2">Room Type:</label>
		<div class="col-sm-10">
			<select required class="form-control" name="roomTypeName">
				<c:forEach var="roomType" items="${roomTypes}" varStatus="status">
					<option value="${roomType.name}">${roomType.name}</option>
				</c:forEach>
			</select>
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-sm-2">Room capacity:</label>
		<div class="col-sm-10">
			<select required class="form-control" name="roomCapacity">
				<c:forEach var="room" items="${rooms}" varStatus="status">
					<option value="${room.capacity}">${room.capacity}</option>
				</c:forEach>
			</select>

		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-sm-2">Room Number:</label>
		<div class="col-sm-10">
			<select required class="form-control" name="roomNumber">
				<c:forEach var="room" items="${rooms}" varStatus="status">
					<option value="${room.number}">${room.number}</option>
				</c:forEach>
			</select>
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-sm-2">From</label>
		<div class="col-sm-10">
			<input required type="date" class="form-control" name="dateFrom">
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-sm-2">To</label>
		<div class="col-sm-10">
			<input required type="date" class="form-control" name="dateTo">
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

