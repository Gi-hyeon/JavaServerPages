<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.*"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	var searchForm = $('#searchForm');
	var pagingArea = $('#pagingArea');
	
	pagingArea.on('click', 'a', function(event) {
		event.preventDefault();
		var pageNo = $(this).data('page');
		console.log(pageNo);
		searchForm.find('#page').val(pageNo);
		searchForm.submit();
	});

})
</script>
<title>자유게시판 목록</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">자유 게시판 목록</h1>
		</div>
	</div>
	<div class="container">
			<div>
				<div class="text-right">
					<span>전체 ${fCount }건</span>
				</div>
			</div>
			<div style="padding-top: 50px">
				<div class="row" style="padding-bottom: 20px">
					<div class="col-md-7"></div>
					<div class="col-md-5">
						<div class="row">
							<div class="col-md-2"></div>
							<div class="col-md-10">
								<form class="input-group input-group-sm" method="post" id="searchForm">
									<input type="hidden" name="page" id="page">
									<select name="searchType">
										<option value="title" <c:if test="${searchType == 'title' }"><c:out value="selected"/></c:if>>제목</option>
										<option value="writer" <c:if test="${searchType == 'writer' }"><c:out value="selected"/></c:if>>작성자</option>
										<option value="titleWriter" <c:if test="${searchType == 'titleWriter' }"><c:out value="selected"/></c:if>>제목+작성자</option>
									</select>
									<input type="text" name="searchWord" value="${searchWord }" placeholder="Search">
									<input type="submit" value="검색">
								</form>
							</div>
						</div>
					</div>
				</div>
				<table class="table">
					<thead class="table-dark">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:set value="${pagingVO.dataList }" var="freeList"/>
						<c:choose>
							<c:when test="${empty freeList }">
								<tr>
									<td colspan="5">조회하신 게시글이 존재하지 않습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${freeList }" var="free">
									<tr onclick="location.href='/free/detail.do?boNo=${free.boNo}'">
										<td>${free.boNo }</td>
										<td>${free.boTitle }</td>
										<td>${free.boDate }</td>
										<td>${free.boWriter }</td>
										<td>${free.boHit }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<div align="left">
				<a href="/free/form.do" onclick="checkForm(); return false;" class="btn btn-primary">&laquo;글쓰기</a>
			</div>
			<div id="pagingArea">
	        	${pagingVO.pagingHTML}
        	</div>
		<hr>
	</div>
</body>
</html>





