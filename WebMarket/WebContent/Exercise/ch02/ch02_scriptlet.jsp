<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
	<% 
		java.util.Date date = new java.util.Date(); 
		out.println("<h3>Today : " + date.toString() + "</h3>");
	%>
</body>
</html>