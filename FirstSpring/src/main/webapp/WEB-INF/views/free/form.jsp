<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.min.js"></script>
<title>자유게시판 등록</title>
<script type="text/javascript">
$(function() {
	CKEDITOR.replace("boContent");
	CKEDITOR.config.allowedContent = true;
	
	var formBtn = $('#formBtn');
	var cancleBtn = $('#cancleBtn');
	
	formBtn.on('click', function() {
		var title = $('#boTitle').val();
		var content = CKEDITOR.instances.boContent.getData();
		var ext = content.replace(/(&nbsp;|<p>|<\/p>|\s+)/g, "");
		
		console.log("title -> " + title + "content -> " + content);
		
		if(title == ""){
			alert("정확한 제목을 입력해주세요!");
			$('#boTitle').focus();
			return false;
		}
		
		if(ext=='' || ext == 0){
			alert("정확한 내용을 입력해주세요!");
			CKEDITOR.instances.boContent.focus();
			return false;
		}
		
		if(title.length > 400 || content.length > 4000){
			alert("글자수 초과!!!");
			return false;
		}
		
		$('#freeForm').submit();
	});
	
	cancleBtn.on('click', function() {
		location.href = "/free/list.do";
	});
	
});
</script>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h3 class="display-3">자유 게시판 등록</h3>
		</div>
	</div>
	<div class="container">
		<form name="newWrite" action="/free/insert.do" class="form-horizontal" method="post" id="freeForm">
			<input name="id" type="hidden" class="form-control" value="">
			<div class="form-group row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">
					<input name="boTitle" id="boTitle" type="text" class="form-control" placeholder="subject">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8">
					<textarea name="boContent" id="boContent" cols="50" rows="5" class="form-control" placeholder="content"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="등록 " id="formBtn">				
					<input type="reset" class="btn btn-primary " value="취소 " id="cancleBtn">
				</div>
			</div>
		</form>
		<hr>
	</div>
</body>
</html>



