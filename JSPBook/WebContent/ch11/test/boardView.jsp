<%@page import="ch11.test.BoardVO"%>
<%@page import="ch11.test.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--
	1. 게시글 상세보기를 출력해주세요.
		> JSTL을 활용해주세요. 
	
	[출력 예]
	
	게시판 상세보기
	──────────────────────────────────────────────
	제목 : 
	작성자 작성일 조회수
	──────────────────────────────────────────────
	내용
	──────────────────────────────────────────────
	
	[ 수정  ] [ 삭제  ] [ 목록  ]
	
	2. 수정 버튼 클릭 시, 수정 페이지(boardUpdateForm.jsp)로 이동합니다.
	3. 삭제 버튼 클릭 시, 해당 게시글이 삭제 처리 될 수 있도록 합니다.
		> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [확인]버튼을 클릭 시 삭제가 처리(boardRemove.jsp) 될 수 있도록 해주세요.
		> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [취소]버튼을 클릭 시 알림창이 꺼질 수 있게 해주세요.
	4. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동합니다.
 -->
 <%
 	int no = Integer.parseInt(request.getParameter("no"));
 
 	BoardRepository dao = BoardRepository.getInstance();
 	BoardVO vo = dao.getBoardById(no);
 	int view = vo.getHit();
 	vo.setHit(++view);
 	request.setAttribute("vo", vo);
 	System.out.println("View Check : " + vo);
 %>
 
	<h3>게시글 상세보기</h3>
	<p>제목 : <c:out value="${vo.title }"></c:out></p>
	<p>
		<c:out value="${vo.writer }"></c:out>
		<c:out value="${vo.regDate }"></c:out>
		<c:out value="${vo.hit }"></c:out>
	</p>
	<p>내용 : <c:out value="${vo.content }"></c:out></p>
	<button onclick="location.href='boardUpdateForm.jsp?no=<%= no %>'">수정</button>
	<button onclick="if(confirm('정말로 삭제하시겠습니까?')){location.href='boardRemove.jsp?no=<%= no %>'}">삭제</button>
	<button onclick="location.href='boardList.jsp'">목록</button>

</body>
</html>