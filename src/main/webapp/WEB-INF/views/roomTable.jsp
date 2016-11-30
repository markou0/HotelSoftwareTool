<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@page session="true"%>
<div id="data_ops" class="btn-group">
</div>
<div class="panel panel-default">
	<div class="panel-heading">Room List</div>
	<div class="table-responsive">
		<table class="table table-bordered">
			<thead>
				<tr>
					<sec:authorize access="hasRole('ADMIN')">
						<th>Operations</th>
					</sec:authorize>
					<th>ID</th>
					<th>RoomType</th>
					<th>Capacity</th>
					<th>Number</th>
					<th>Price</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="room" items="${rooms}" varStatus="status">
					<tr>
						<sec:authorize access="hasRole('ADMIN')">
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
						</sec:authorize>

						<td name="id"><c:out value="${room.id}"></c:out></td>
						<td name="roomType"><c:out value="${room.roomType.name}"></c:out></td>
						<td name="capacity"><c:out value="${room.capacity}"></c:out></td>
						<td name="number"><c:out value="${room.number}"></c:out></td>
						<td name="price"><c:out value="${room.price}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>