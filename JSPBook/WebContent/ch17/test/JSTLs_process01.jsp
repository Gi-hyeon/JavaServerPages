<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("number"));
%>
	<c:set var="value" value="<%= num %>"></c:set>
	<p><c:out value="${value }"></c:out></p>
	
	<c:choose>
		<c:when test="${value } % 2 == 0">
			<h2>짝수 입니다.</h2>
		</c:when>
		<c:otherwise>
			<h2>홀수 입니다.</h2>
		</c:otherwise>
	</c:choose>
	
</body>
</html>