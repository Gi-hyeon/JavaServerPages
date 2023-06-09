<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                                    	Ch17. 연습문제
                                    </h6>
                                </div>
                                <div class="card-body">
                                	<c:set var="names" value="전지혜, 신국현, 이지영, 김지완, 이성일, 신현근,
                               	 			박정수, 변정민, 정은지, 조성희, 박윤수, 조윤재,
                               	 			정재균, 박승우, 홍길동"></c:set>
                               	 	<c:set var="name" value="${fn:split(names, ', ') }"></c:set>
                               	 	
                               	 	<c:set var="hongCnt" value="0"></c:set>
                               	 	<c:set var="yuCnt" value="0"></c:set>
                               	 	<c:set var="jeongCnt" value="0"></c:set>
                               	 	<c:set var="haCnt" value="0"></c:set>
                               	 	<c:set var="parkCnt" value="0"></c:set>
                               	 	<c:set var="gilCnt" value="0"></c:set>
                               	 	<c:set var="noCnt" value="0"></c:set>
                               	 	
                               	 	<c:forEach var="nm" varStatus="stat" items="${name }">
                               	 		<c:choose>
                               	 			<c:when test="${fn:substring(name[stat.index], 0, 1) == '홍' }">
                               	 				<c:set var="hongCnt" value="${hongCnt + 1 }"></c:set>
                               	 			</c:when>
                               	 			<c:when test="${fn:substring(name[stat.index], 0, 1) == '유' }">
                               	 				<c:set var="yuCnt" value="${yuCnt + 1 }"></c:set>
                               	 			</c:when>
                               	 			<c:when test="${fn:substring(name[stat.index], 0, 1) == '정' }">
                               	 				<c:set var="jeongCnt" value="${jeongCnt + 1 }"></c:set>
                               	 			</c:when>
                               	 			<c:when test="${fn:substring(name[stat.index], 0, 1) == '하' }">
                               	 				<c:set var="haCnt" value="${haCnt + 1 }"></c:set>
                               	 			</c:when>
                               	 		</c:choose>

										<p>[${stat.count }당신의 이름은? ${nm }]</p>
										<font color="red" style="font-size: 10px;">
											${fn:substring(name[stat.index], 0, 1) } 씨 count 증가!
										</font>
										
										<table>
											<tr>
												<td>홍</td>
												<td>유</td>
												<td>정</td>
												<td>하</td>
												<td>빅</td>
												<td>길</td>
												<td>노</td>
											</tr>
											<tr>
												<td>${hongCnt }</td>
												<td>${yuCnt }</td>
												<td>${jeongCnt }</td>
												<td>${hongCnt }</td>
												<td>${haCnt }</td>
												<td>${parkCnt }</td>
												<td>${gilCnt }</td>
												<td>${noCnt }</td>
											</tr>
										</table>

                               	 	</c:forEach>
                               	 	
										<table>
											<tr>
												<td>홍</td>
												<td>유</td>
												<td>정</td>
												<td>하</td>
												<td>빅</td>
												<td>길</td>
												<td>노</td>
											</tr>
											<tr>
												<td>${hongCnt }</td>
												<td>${yuCnt }</td>
												<td>${jeongCnt }</td>
												<td>${hongCnt }</td>
												<td>${haCnt }</td>
												<td>${parkCnt }</td>
												<td>${gilCnt }</td>
												<td>${noCnt }</td>
											</tr>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
   <!--  <script src="/resources/sbadmin/vendor/jquery/jquery.min.js"></script> -->
    <script src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
</body>
	<script type="text/javascript">
    </script>
</html>