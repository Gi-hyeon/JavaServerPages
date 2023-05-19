<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	CKEDITOR.replace("boContent");
	CKEDITOR.config.allowedContent = true;
	
	var deleteBtn = $('#deleteBtn');
	var updateBtn = $('#updateBtn');
	var dForm = $('#dForm');
	
	deleteBtn.on('click', function(event) {
		event.preventDefault();
		if(confirm("정말 삭제하시겠습니까?")){
			dForm.submit();
		}
	});
	
})
</script>
<title>공지게시판 상세보기</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h3 class="display-3">공지게시판 상세보기 / 수정 / 삭제</h3>
		</div>
	</div>

	<div class="container">
		<form name="newUpdate" action="/notice/update.do" class="form-horizontal" method="post" id="nForm">
			<input type="hidden" name="boNo" value="${notice.boNo }">
			<div class="form-group row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">
					<input name="boTitle" class="form-control" value="${notice.boTitle }" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8" style="word-break: break-all;">
					<textarea name="boContent" class="form-control" cols="50" rows="5">${notice.boContent }</textarea>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<p>
						<a href="" class="btn btn-danger" id="deleteBtn"> 삭제</a> 
						<input type="submit" class="btn btn-success" value="수정 " id="updateBtn">
						<a href="/notice/list.do" class="btn btn-primary"> 목록</a>
					</p>
				</div>
			</div>
		</form>
		<form action="/notice/delete.do" method="post" id="dForm">
			<input type="hidden" name="boNo" value="${notice.boNo }">
		</form>
		<hr>
	</div>
</body>
</html>


