<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>대덕인재개발원 JSP</title>
    <link href="/resources/sbadmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="/resources/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
    <div id="wrapper">
		<%@ include file="/include/header.jsp" %>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <%@ include file="/include/nav.jsp" %>
                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">대덕인재개발원 JSP</h1>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">
                                    	total_signin
                                    </h6>
                                </div>
                                <div class="card-body">
                                <%
                                	request.setCharacterEncoding("UTF-8");
                                %>
                                <p> 아이디 : <%= request.getParameter("id") %> </p>
                                <p> 비밀번호 : <%= request.getParameter("pw") %> </p>
                                <p> 이름 : <%= request.getParameter("name") %> </p>
                                <p> 
                                	연락처 : <%= request.getParameter("phone1") %> -
                                			<%= request.getParameter("phone2") %> -
                                			<%= request.getParameter("phone3") %>
                                </p>
                                <p> 이메일 : <%= request.getParameter("email") %> </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="/include/footer.jsp" %>
        </div>
    </div>

    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
   <!--  <script src="/resources/sbadmin/vendor/jquery/jquery.min.js"></script> -->
    <script src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
</body>
<script type="text/javascript">
	function CheckLogin() {
		var form = document.loginForm;
		
		// 아이디가 입력되었는지 검사한다.
		// 아이디가 입력되지 않으면 오류 메세지를 출력하고 해당 입력 항목에 커서가 놓인다.
		if(form.id.value == ""){
			alert("아이디를 입력해주세요!");
			form.id.focus();
			return false;
		}
		
		// 비밀번호가 입력되었는지 검사한다.
		// 비밀번호가 입력되지 않으면 오류 메세지를 출력하고 해당 입력 항목에 커서가 놓인다.
		if(form.pw.value == ""){
			alert("비밀번호를 입력해주세요!");
			form.pw.focus();
			return false;
		}
		
		// 폼 페이지에서 입력한 데이터 값을 서버로 전송한다.
		form.submit();
	}
	
	
	$(function() {

	})
</script>
</html>