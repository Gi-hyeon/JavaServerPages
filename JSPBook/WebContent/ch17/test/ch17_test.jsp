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
                               	<!-- 
                               		문제)
                               		
                               		406호 전원의 이름을 ','로 구분하여 각각 나눈 후,
                               		-----------------------------------
                               		'김'씨 성을 가진 사람 몇명 : 3
                               		'박'씨 성을 가진 사람 몇명 : 4
                               		'이'씨 성을 가진 사람 몇명 : 5
                               		...
                               		...
                               		-----------------------------------
                               		
                               		** 406호 전원의 이름을 넣을 때 스크립틀릿으로 활용해도 무방
                               		     또는 JSTL로 바로 값을 넣어도 무방
                               		     
                               		1. JSTL을 이용하여 작성해주세요.
                               	 -->
                               	 <%
                               	 	String[] nameArr = {
                               	 			"전지혜", "신국현", "이지영", "김지완", "이성일", "신현근",
                               	 			"박정수", "변정민", "정은지", "조성희", "박윤수", "조윤재",
                               	 			"정재균", "박승우", "황지현", "김민정", "김동혁", "고영우",
                               	 			"진현성", "이수진", "오미나", "김민욱", "홍기태",
                               	 			"구기현", "전다미", "오대환", "배문기", "유이현",
                               	 			};
                               	 	
                               	 	Map<String, Integer> map = new HashMap<>();
                               	 	
                               	 	String names = Arrays.toString(nameArr).substring(1, Arrays.toString(nameArr).length()-1);
                               		//System.out.println(names);
                               	 %>
                               	 	
									<c:set var="nameArr" value="<%= names %>"/>
                               	 	<c:set var="texts" value="${fn:split(nameArr, ', ') }"/>
                               	    <c:set var="map" value="<%=map %>"/>
                               	 
									<c:forEach var="i" begin="0" end="${fn:length(texts)-1 }">
	                               	 	<c:set var="sName" value="${fn:substring(texts[i], 0, 1) }"></c:set>
	                               	 	
	                               	 	
	                               	 	
	                               	 	
	                               	 	<%-- 
	                               	 	<c:out value="${sName }"></c:out><br>
	                               	 	
	                               	 	
	                               	 	<c:if test="${map.containsKey(sName) }">
	                               	 		if test -> <c:out value="${sName }"/> <br>
	                               	 	</c:if>
	                               	 	
	                               	 	<c:if test="${not map.containsKey(sName) }">
	                               	 		not if test -> <c:out value="${sName }"></c:out> <br>
	                               	 	</c:if>
	                               	 	 --%>
	                               	 	
										<c:set target="${map }" property="${sName }" value="${map[sName] + 1 }"/>
	                               	 	 
										<%-- <c:set target="${map }" property="${sName }" value="${map.get(sName) + 1 }"/> --%>
 									<%-- <c:if test="${not empty sName}">
 										    <c:if test="${not empty namesCount[sName]}">
 										        <c:set target="${namesCount}" property="${sName}" value="${namesCount[sName]+1}" />
 										    </c:if>
 										    <c:if test="${empty namesCount[sName]}">
 										        <c:set target="${namesCount}" property="${sName}" value="1" />
 										    </c:if>
 										</c:if> --%>


									</c:forEach>

									<c:forEach var="entry" items="${map}">
										'${entry.key}'씨 성을 가진 사람 몇명 : ${entry.value} <br>
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