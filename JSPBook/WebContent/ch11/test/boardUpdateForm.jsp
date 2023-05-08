<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	1. 게시판 수정 페이지를 작성해주세요.
	
	[출력 예]
	
	게시글 등록
	─────────────────────────────
	제목 : 제목입니다1
	작성자 : 홍길동
	내용 : 내용입니다1
	─────────────────────────────
	[ 수정  ] [ 목록 ]
	
	2. 수정 버튼 클릭 시, 게시글 수정(boardUpdate.jsp)을 진행해주세요.
	3. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동해주세요. 
 -->
<%
	int no = Integer.parseInt(request.getParameter("no"));
%>
   	<form action="boardUpdate.jsp" method="post">
   		<input type="hidden" name="no" value="<%= no %>">
	 	<p>작성자 : <input type="text" name="writer"></p>
	 	<p>제목 : <input type="text" name="title"></p>
	 	<p>내용 : <input type="text" name="content"></p>
	 	<input type="submit" value="수정">
		<button type="button" onclick="location.href='boardList.jsp'">목록</button>
 	</form>
</body>
</html>