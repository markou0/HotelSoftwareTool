<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<div id="data_ops" class="btn-group">
</div>
<div class="panel panel-default">
	<div class="panel-heading">Frequently Searched Products</div>
	<div class="table-responsive">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Operations</th>
					<th>ID</th>
					<th>Room Type</th>
					<th>Room Number</th>
					<th>From</th>
					<th>To</th>
					<th>Price</th>
					<th>User</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="roomBooking" items="${roomBookings}" varStatus="status">
					<tr>
						<td name="operations">
							<button name="removeRec" type="button"
								class="btn btn-xs btn-danger" data-toggle="modal"
								data-target="#removeRec">
								<span class="glyphicon glyphicon-remove"></span>
							</button>

							<button name="editRec" type="button"
								class="btn btn-xs btn-warning" data-toggle="modal"
								data-target="#editRec">
								<span class="glyphicon glyphicon-edit"></span>
							</button>
						</td>

						<td name="id"><c:out value="${roomBooking.id}"></c:out></td>
						<td name="roomTypeName"><c:out value="${roomBooking.room.roomType}"></c:out></td>
						<td name="roomName"><c:out value="${roomBooking.room.number}"></c:out></td>
						<td name="from"><c:out value="${roomBooking.from}"></c:out></td>
						<td name="to"><c:out value="${roomBooking.to}"></c:out></td>
						<td name="price"><c:out value="${roomBooking.price}"></c:out></td>
						<td name="user"><c:out value="${roomBooking.user}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>