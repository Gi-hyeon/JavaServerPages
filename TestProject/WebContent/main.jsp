<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#login').on('click', function() {
			alert("test");
		})
		
		$('#register').on('click', function() {
			location.href = 'register.jsp';
		})
	})
</script>
</head>
<body>
	<h3>로그인</h3>
	<form action="<%= request.getContextPath() %>/InsertMember.do" method="post" id="loginForm">
		<p>아이디 : <input type="text" name="id" id="id"></p>
		<p>비밀번호 : <input type="text" name="pw" id="pw"></p>
		<input type="button" value="로그인" id="login">
		<input type="button" value="회원가입" id="register">
	</form>
</body>
</html>