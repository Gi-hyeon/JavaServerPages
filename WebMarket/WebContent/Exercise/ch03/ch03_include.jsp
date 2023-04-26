<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="ch03_header.jsp" %>

	<% Calendar cal = Calendar.getInstance(); %>
	
	<%= cal.getTime().toString() %>
	
</body>
</html>