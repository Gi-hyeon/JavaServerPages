<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#back').on('click', function() {
			location.href = 'main.jsp';
		})
		
		$('#register').on('click', function() {
			var id = $('#id').val().trim();
			var pw = $('#pw').val().trim();
			var name = $('#name').val().trim();
			
			 $.ajax({
				url: `<%= request.getContextPath() %>/insertMember.do`,
				type : 'post',
				data : {
					"id" : id,
					"pw" : pw,
					"name" : name
				},
				success : function(res) {
					alert("성공");
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status)
				},
				dataType : 'json'
			});
		});
		
	})
</script>
</head>
<body>
	<h3>회원가입</h3>
	<form action="" method="post" id="registerForm">
		<p>아이디 : <input type="text" name="id" id="id"></p>
		<p>비밀번호 : <input type="text" name="pw" id="pw"></p>
		<p>이름 : <input type="text" name="pw" id="name"></p>
		<input type="button" value="등록" id="register">
		<input type="button" value="뒤로" id="back">
	</form>
</body>
</html>