<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
                                <%
                                	List<String> list = new ArrayList<String>();
                               	 	String[] names = {
                               	 			"전지혜", "신국현", "이지영", "김지완", "이성일", "신현근",
                               	 			"박정수", "변정민", "정은지", "조성희", "박윤수", "조윤재",
                               	 			"정재균", "박승우", "황지현", "김민정", "김동혁", "고영우",
                               	 			"진현성", "이수진", "오미나", "김민욱", "홍기태",
                               	 			"구기현", "전다미", "오대환", "배문기", "유이현",
                               	 			};
                               	 	
                               	 	for(int i=0; i<names.length; i++){
                               	 		list.add(names[i]);
                               	 	}
                               	 	HashMap<String, Integer> map = new HashMap<String, Integer>();
                               	 %>
                               	 
                               	 	<c:set var="map" value="<%=map %>"></c:set>
                               	 	<c:forEach var="item" items="<%=list %>">
                               	 		<c:out value="${item }"></c:out>
	                               	 	
	                               	 	<c:set var="sName" value="${fn:substring(item, 0, 1) }"/>
	                               	 	
	                               	 	<%-- 
	                               	 	성 체크 : <c:out value="${sName }"></c:out>
	                               	 	 --%>
	                               	 	 
	                               	 	 
	                               	 	 
	                               	 	 
                               	 	</c:forEach>
                               	 	
                               	 	
                               	 	<%-- 
                               	 	<c:forEach var="item" items="<%=list %>">
                               	 		<c:choose>
                               	 			<c:when test="${map.get(fn:substring(item, 0, 1)) == null }">
                               	 				${map.put(fn:substring(item, 0, 1), 1) }
                               	 			</c:when>
                               	 			<c:otherwise>
                               	 				${map.put(fn:substring(item, 0, 1), map.get(fn:substring(item, 0, 1)) + 1 }
                               	 			</c:otherwise>
                               	 		</c:choose>
                               	 	</c:forEach>
                               	 	 --%>
                               	 	
                               	 	<c:forEach var="item" items="<%=map.keySet() %>">
                               	 		<c:out value="${item }"/> 씨 성을 가진 사람 수 : ${map.get(item) }
                               	 	</c:forEach>
                               	 
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