<%@page import="ch11.test.BoardVO"%>
<%@page import="ch11.test.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionBoard_error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	1. 게시글 등록을 처리해주세요.
		> 게시글 등록 성공 시, 상세보기 페이지(boardView.jsp)로 이동해주세요.
		> 게시글 등록 실패 시, 에러 페이지(exceptionBoard_error.jsp)로 이동해주세요.
 -->
  <%
 	request.setCharacterEncoding("UTF-8");
 
 	BoardRepository dao = BoardRepository.getInstance();
 	BoardVO vo = new BoardVO();
 	
 	int no = dao.getNo();
 	String writer = request.getParameter("writer");
 	String title = request.getParameter("title");
 	String content = request.getParameter("content");
 	
 	vo.setNo(++no);
 	vo.setTitle(title);
 	vo.setContent(content);
 	vo.setWriter(writer);
 	vo.setRegDate(dao.getCurrenTime());
 	
 	/* request.getParameter("name").toUpperCase(); */
 	
 	dao.addBoard(vo);
 	response.sendRedirect("boardView.jsp?no=" + no);
 %>
</body>
</html>