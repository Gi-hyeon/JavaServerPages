<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>
	<!-- menu 부분 -->
	<%@include file="ch03_menu.jsp" %>

	<!-- menu 부분 End -->
	
	<!-- 
		선언문 태그를 선언하고
		문자열 greeting 변수에 "Book Market Mall"을 초기화해주세요.
		문자열 tagline 변수에 "Welcome to Web Market!"을 초기화해주세요.
			
		::TODO
		
	-->
		<%! 
			String greeting = "도서 웹 쇼핑몰"; 
			String tagline = "Welcome to Web Market!";
		%>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">
				<!-- 표현문을 이용하여 greeting 변수를 출력해주세요. -->
				<%= greeting %>
				<%-- 주석 연습입니다. --%>
			</h1>
		</div>
	</div>
	<main role="main">
	<div class="container">
		<div class="text-center">
			<h3>
				<!-- 표현문을 이용하여 tagline 변수를 출력해주세요. -->
				<%= tagline %>
			</h3>			
		</div>
		<hr>
	</div>
	</main>
	<!-- footer 부분 -->
	
	<%@ include file="ch03_footer.jsp" %>
	<!-- footer 부분 End -->
</body>
</html>