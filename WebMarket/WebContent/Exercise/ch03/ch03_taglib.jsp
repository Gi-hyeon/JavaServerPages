<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
	<c:forEach var="i" begin="0" end="10" step="2">
		<c:out value="${i }">
		</c:out>
	</c:forEach>
</body>
</html>