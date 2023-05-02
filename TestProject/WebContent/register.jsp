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
		id = "";
		
		$('#back').on('click', function() {
			location.href = 'login.jsp';
		})
		
		$('#idCheck').on('click', function() {
			id = $('#id').val().trim();
			$.ajax({
				url: `<%= request.getContextPath() %>/idDuplication.do`,
				type : 'post',
				data : {
					"id" : id
				},
				success : function(res) {
					if(res.flag == "fail"){
						$('#register').removeAttr("disabled");
						alert("사용가능한 아이디입니다.");
					}else{ //res.flag = "success"일 때
						$('#register').attr("disabled", "disabled");
						alert("사용 불가능한 아이디입니다.")	
					}
					
					//alert(res.flag);
					//alert("성공");
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status)
				},
				dataType : 'json'
			});
		})
		
		$('#register').on('click', function() {
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
					//alert("성공");
					location.href = "login.jsp"
					alert("회원가입 성공!")
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
		<p>아이디 : <input type="text" name="id" id="id"> <input type="button" value="중복검사" id="idCheck"></p>
		<p>비밀번호 : <input type="text" name="pw" id="pw"></p>
		<p>이름 : <input type="text" name="pw" id="name"></p>
		<input type="button" value="등록" id="register" disabled="disabled">
		<input type="button" value="뒤로" id="back">
	</form>
</body>
</html>