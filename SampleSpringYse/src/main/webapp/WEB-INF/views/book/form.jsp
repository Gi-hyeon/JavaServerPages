<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">책 생성하기</h1>
		</div>
	</div>

	<div class="container">
		<form action="" method="post">
			<div class="row">
				<div class="col-md-12 mb-2">
					<div class="row">
						<div class="col-md-2">
							<label for="title" class="col-form-Label">제목</label>
						</div>
						<div class="col-md-10">
							<input type="text" class="form-control" name="title" id="title"/>
						</div>
					</div>
				</div>
				<div class="col-md-12 mb-2">
					<div class="row">
						<div class="col-md-2">
							<label for="title" class="col-form-Label">카테고리</label>
						</div>
						<div class="col-md-10">
							<input type="text" class="form-control" name="category" id="category"/>
						</div>
					</div>
				</div>
				<div class="col-md-12 mb-2">
					<div class="row">
						<div class="col-md-2">
							<label for="title" class="col-form-Label">가격</label>
						</div>
						<div class="col-md-10">
							<input type="text" class="form-control" name="price" id="price"/>
						</div>
					</div>
				</div>
				<button type="submit" class="btn btn-warning">등록</button>
				<a href="/book/list.do" class="btn btn-primary">목록</a>
			</div>
		</form>
	</div>
</body>
</html>