<%@page import="totaltest.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="totaltest.dao.MemberDAO"%>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<script type="text/javascript">
	$(function() {
		$('#register').on('click', function() {
			location.href = 'total_signup.jsp';
		})
	})
</script>
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
                                    	total_memberList
                                    </h6>
                                </div>
                                <div class="card-body">
                                <!-- 
                                	1. 로그인 성공 후, 넘어왔을 때 'a001님! 환영합니다!' 메시지 출력을 완성
                                	
                                	2. 회원 목록에 저장되어 있는 회원 모두를 출력
                                	
                                	[회원 등록]
                                	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
                                		이미지	|	회원정보		|  	버튼
                                	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
                                				|	아이디 : a001	|	
                                		이미지	|  비밀번호 : 1234	|	[상세정보]
                                				|	이름 : 박정수	|	
                                				|	성별 : 남자	|	
                                	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
                                	
                                	3. 회원등록 버튼을 클릭 시, 회원 가입 페에지로 이동하여 회원 등록을 진행할 수 있도록 함
                                 -->
                                 
                                 <%
                                 	String loginCheck = request.getParameter("id");
                                 
                                 	MemberDAO dao = MemberDAO.getInstance();
                                 	ArrayList<MemberVO> listOfMembers = dao.getMemberList();
                                 %>
                                 <h2><%=loginCheck %>님! 환영합니다!</h2>
                                 <input type="button" value="회원등록" id="register">
                                 <table border="1">
                                 	<tr>
                                 		<th>이미지</th>
                                 		<th>회원정보</th>
                                 		<th>버튼</th>
                                 	</tr>
                                 <%
                                 	for(int i=0; i<listOfMembers.size(); i++){
                                 		MemberVO vo = listOfMembers.get(i);
                                 		%>
										<tr>
											<td><img alt="X" src="<%=request.getContextPath()%>/images/<%= vo.getFilename()%>" style="height: 180px; width: 100px;"></td>
											<td>
												아이디 : <%= vo.getMem_id() %><br>
												비밀번호 : <%= vo.getMem_pw() %><br>
												이름 : <%= vo.getMem_name() %><br>
												성별 : <%= vo.getMem_sex() %><br>
											</td>
											<td>
												<a href="">상세보기</a>
											</td>
										</tr>
                                 		<%
                                 	}
                                 %>
                                 </table>
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

    <script src="/resources/sbadmin/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
</body>
</html>