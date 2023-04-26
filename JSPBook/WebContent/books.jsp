<%@page import="dao.BookRepository"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="dto.Book"%>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>도서 목록</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">도서 목록</h1>
		</div>
	</div>
	<%
		// 1. BookRepository 인스턴스를 가져와 BookRepository 클래스 변수로 초가화해주세요.
		BookRepository bookDAO = BookRepository.getInstance();
		// 2. ArrayList의 제네릭 Book클래스 타입으로 책 전체 목록을 가져와주세요. 
		ArrayList<Book> listOfBooks = bookDAO.getAllBooks();
	%>
      
	<div class="container">	
	<%
		// 3. class="row" div를 셋트로하여 책 목록 갯수만큼 책 목록을 출력해주세요.
		for(int i=0; i<listOfBooks.size(); i++){
			Book book = listOfBooks.get(i);
	%>
		<div class="row">
			<div class="col-md-10">	
				<p><h5 ><b>[<%=book.getCategory()  %> <!-- 책 카테고리를 출력(category) -->] <%=book.getName() %> <!-- 책 제목을 출력(name) --></b></h5>
				<p style="padding-top: 10px"> <%= book.getDescription() %>  <!-- 책 내용을 출력(description) --></p>
				<p><%= book.getAuthor() %> <!-- 책 저자 출력(author) --> | <%= book.getPublisher() %> <!-- 책 출판사 출력(Publisher) --> | <%= book.getUnitPrice() %> <!-- 책 금액 출력(UnitPrice) -->원 </p>
			</div>	
			<div class="col-md-2"  style="padding-top: 60px">						    			 
				<a href="./book.jsp?id=<%= book.getBookId() %>" class="btn btn-secondary" role="button"> 상세정보 &raquo;></a>				
			</div>				
		</div>
		<%
		}
		%>
		<hr>
	</div>	
	<%@ include file="footer.jsp" %>
</body>
</html>
