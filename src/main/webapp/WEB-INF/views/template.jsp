<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<base	href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/">
   <jsp:include page="header.jsp" flush="true" />
<c:if test="${not empty content}">
   <jsp:include page="${content}.jsp" flush="true" />
</c:if>

<%@ include file="footer.jsp"%>