<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$('#login').on('click', function() {
			var id = $('#id').val().trim();
			var pw = $('#pw').val().trim();
			 $.ajax({
					url: `<%= request.getContextPath() %>/loginCheck.do`,
					type : 'post',
					data : {
						"id" : id,
						"pw" : pw
					},
					success : function(res) {
						if(res.flag == "success"){
							alert("로그인 성공");
							location.href = "main.jsp";
						} else{
							alert("존재하지 않는 회원입니다.");
							location.href = "login.jsp";
						}
					},
					error : function(xhr) {
						alert("상태 : " + xhr.status)
					},
					dataType : 'json'
			 });
		})
		
		$('#register').on('click', function() {
			location.href = 'register.jsp';
		})
	})
</script>
</head>
<body>
<%
    String error = request.getParameter("error");
    if ("1".equals(error)) {
%>
    <script>
        alert("아이디 또는 비밀번호가 잘못되었습니다.");
    </script>
<% 
    }
%>
	<h3>로그인</h3>
	<form action="<%= request.getContextPath() %>/InsertMember.do" method="post" id="loginForm">
		<p>아이디 : <input type="text" name="id" id="id"></p>
		<p>비밀번호 : <input type="text" name="pw" id="pw"></p>
		<input type="button" value="로그인" id="login">
		<input type="button" value="회원가입" id="register">
	</form>
</body>
</html>