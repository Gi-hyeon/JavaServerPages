<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="form03_process.jsp" method="post">
		오렌지<input type="checkbox" name="fruit" value="orange">
		사과<input type="checkbox" name="fruit" value="apple">
		바나나<input type="checkbox" name="fruit" value="banana">
		<p><input type="submit" value="전송"></p>
	</form>
</body>
</html>