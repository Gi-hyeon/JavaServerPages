<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<h1 class="display-3">책 수정하기</h1>
		</div>
	</div>

	<div class="container">
		<!-- action 경로를 안 적으면 해당 보고있는 URL로 넘어가는데 그 때 문을 만들어주면 된다. controller 에서.. -->
		<form action="" method="post">
			<div class="row">
				<div class="col-md-12 mb-2">
					<div class="row">
						<div class="col-md-2">
							<label for="title" class="col-form-Label">제목</label>
						</div>
						<div class="col-md-10">
							<input type="text" class="form-control" name="title" id="title" value="${book.TITLE }"/>
						</div>
					</div>
				</div>
				<div class="col-md-12 mb-2">
					<div class="row">
						<div class="col-md-2">
							<label for="title" class="col-form-Label">카테고리</label>
						</div>
						<div class="col-md-10">
							<input type="text" class="form-control" name="category" id="category" value="${book.CATEGORY }"/>
						</div>
					</div>
				</div>
				<div class="col-md-12 mb-2">
					<div class="row">
						<div class="col-md-2">
							<label for="title" class="col-form-Label">가격</label>
						</div>
						<div class="col-md-10">
							<input type="text" class="form-control" name="price" id="price" value="${book.PRICE }"/>
						</div>
					</div>
				</div>
				<button type="submit" class="btn btn-warning">수정</button>
				<a href="/book/detail.do?bookId=${book.BOOK_ID }" class="btn btn-primary">취소</a>
			</div>
		</form>
	</div>
</body>
</html>