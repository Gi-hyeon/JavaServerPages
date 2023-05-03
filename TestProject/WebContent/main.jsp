<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {
	color: inherit;
    text-decoration: none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<%
	MemberVO member = (MemberVO) session.getAttribute("member");

	String memberId = "";
	
	if(member != null){
		memberId = member.getMem_id();
	} else{
		%>
		<script type="text/javascript">
			alert("로그인 후 다시 시도해주세요")
			location.href = "login.jsp";
		</script>
		<%
	}
%>
<script type="text/javascript">
	memberId = "<%= memberId %>";
	
	$(function() {
		
		$.ajax({
			url: `<%= request.getContextPath() %>/selectAllBoard.do`,
			type : 'get',
			data : {
				
			},
			success : function(res) {
				
				itemHTML = `<table border='1'><tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>`;
				if (res.length == 0 || res == null) {
					itemHTML += `<tr><td colspan='5'>조회하실 게시글이 존재하지 않습니다.</td></tr></table>`;
				} else{
					$.each(res, function(i, v) {
						itemHTML += `<tr><td>${v.bo_no}</td><td><a href='boardDetail.jsp?bo_no=${v.bo_no}'>${v.bo_title}</a></td><td>${v.bo_content}</td><td>${v.bo_writer}</td><td>${v.bo_hit}</td></tr>`;
					});
					itemHTML += `</table>`;
				}
				$('#boardTable').append(itemHTML);
				
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status)
			},
			dataType : 'json'
	 	});
		
	})
	
	
</script>
	<h3>게시글 목록</h3>
	<input type="button" value="게시글 등록" id="boardRegister"><br><br>
	<div id="boardTable"></div>
</body>
</html>