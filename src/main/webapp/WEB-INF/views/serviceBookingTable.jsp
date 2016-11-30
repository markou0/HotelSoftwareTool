<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@page session="true"%>
<div id="data_ops" class="btn-group"></div>
<div class="panel panel-default">
	<div class="panel-heading">Service Bookings</div>
	<div class="table-responsive">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Operations</th>
					<th>ID</th>
					<th>Service Name</th>
					<th>Date</th>
					<th>Time</th>
					<th>Price</th>
					<th>User</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="serviceBooking" items="${serviceBookings}"
					varStatus="status">
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

						<td name="id"><c:out value="${serviceBooking.id}"></c:out></td>
						<td name="serviceName"><c:out
								value="${serviceBooking.service.name}"></c:out></td>
						<td name="atDate"><c:out value="${serviceBooking.atDate}"></c:out></td>
						<td name="atTime"><c:out value="${serviceBooking.atTime}"></c:out></td>
						<td name="price"><c:out
								value="${serviceBooking.service.price}"></c:out></td>
						<td name="user"><c:out value="${serviceBooking.user.email}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>