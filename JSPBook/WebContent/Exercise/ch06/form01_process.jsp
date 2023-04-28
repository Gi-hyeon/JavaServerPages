<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String add = request.getParameter("add");
	String mail = request.getParameter("mail");
	
	StringBuffer result = new StringBuffer();
	
	result.append(request.getParameter("name")+"<br>").append(request.getParameter("add")).append(request.getParameter("mail"));
	%>
	
	아이디 : <%= name %><br>
	주소 : <%= add %><br>
	이메일 : <%= mail %><br>
	
	테스트 : <%= result %>
</body>
</html>