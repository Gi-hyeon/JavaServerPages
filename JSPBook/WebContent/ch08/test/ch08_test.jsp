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
                                <!-- 
                                	문제 풀어보기
                                	아래 정규식을 풀어보고 통과했다면 ch08_test_process.jsp로 전송하여 결과를 출력
                                 -->
	                                <h3>Test</h3>
	                                <form action="ch08_test_process.jsp" method="post" id="frm">
	                                	<h4>숫자만 입력하되, 7 ~ 12자리까지만 입력받을 수 있게 설정</h4>
	                                	<input type="text" id="quest1" name="quest1">
	                                	<br>
	                                	
	                                	<h4>시작은 영소문자 a,b,c고 영소대문자 8 ~ 12자리까지만 입력받을 수 있게 설정</h4>
	                                	<input type="text" id="quest2" name="quest2">
	                                	<br>
	                                	
	                                	<h4>아이디는 영소문자로 시작하고 영소문자, 숫자 8 ~ 16자로 설정</h4>
	                                	<input type="text" id="id" name="id">
	                                	<br>
	                                	
	                                	<h4>비밀번호는 영대문자로 시작하고 영문 대소문자, 숫자, 특수문자 8~16자로 설정</h4>
	                                	<input type="text" id="pw" name="pw">
	                                	<br>
	                                	
	                                	<h4>이름은 한글 2 ~ 5글자로 설정</h4>
	                                	<input type="text" id="name" name="name">
	                                	<br>
	                                	
	                                	<h4>
	                                		핸드폰 번호의 첫번째 자리는 011, 016, 017, 019, 070, 010으로 시작<br>
	                                		두번째 자리는 숫자 3자리 또는 숫자 4자리로 시작 <br>
	                                		세번째 자리는 숫자 4자리로 설정<br>
	                                		예시) 010-1234-1234, 016-123-1234
	                                	</h4>
	                                	<input type="text" id="phone" name="phone">
	                                	<br>
	                                	
	                                	<input type="button" id="sendBtn" value="전송">
	                                	<!-- 
	                                		# 정규식 테스트 사이트
	                                		- 작성하고자 하는 정규식 사이트는 여기서 참고!
	                                		https://regexr.com
	                                	 -->
	                                </form>
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

	$(function() {
		var regExpQuest1 = /^[0-9]{7,12}$/;
		var regExpQuest2 = /^[a-c][a-zA-Z]{4,9}$/;
		var regExpId = /^[a-z][a-z0-9]{7,15}$/;
							// 눈 웃음은 한 글을 제외한 전부를 한다... , 달러는 범위 안에 있는 값을 찾는다
		var regExpPw = /^[A-Z][^가-힣]{7,15}$/;
		var regExpName = /^[가-힣]{2,5}$/;
		var regExpPhone = /^(010|011|016|017|019|070)-[\d]{3,4}-[\d]{4}$/;
		
		
		$('#sendBtn').on('click', function() {
			
			var quest1 = $('#quest1').val().trim();
			var quest2 = $('#quest2').val().trim();
			var id = $('#id').val().trim();
			var pw = $('#pw').val().trim();
			var name = $('#name').val().trim();
			var phone = $('#phone').val();
			
			if (!regExpQuest1.test(quest1)) {
				alert("숫자로만 입력가능합니다(7-12자)");
				$('#quest1').focus();
				return false;
			}
			
			if (!regExpQuest2.test(quest2)) {
				alert("시작은 소문자a,b,c 나머지는 영소대문자 8~12자리만 입력이 가능합니다.");
				$('#quest2').focus();
				return false;
			}
			
			if (!regExpId.test(id)) {
				alert("아이디는 영소문자로 시작하고 영소문자, 숫자 8 ~ 16자로 설정");
				$('#id').focus();
				return false;
			}
			
			if (!regExpPw.test(pw)) {
				alert("비밀번호는 영대문자로 시작하고 영문 대소문자, 숫자, 특수문자 8~16자로 설정");
				$('#pw').focus();
				return false;
			}
			
			if (!regExpName.test(name)) {
				alert("이름");
				$('#name').focus();
				return false;
			}
			
			if (!regExpPhone.test(phone)) {
				alert("폰넘버");
				$('#phone').focus();
				return false;
			}
			
			
			$('#frm').submit();
		});
		
	});
	
	
</script>
</html>