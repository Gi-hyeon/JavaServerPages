<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
		DiskFileUpload upload = new DiskFileUpload();
	
		List items = upload.parseRequest(request);
		Iterator params = items.iterator();
		
		while(params.hasNext()){
			FileItem fileItem = (FileItem) params.next();
			
			String fileFieldName = fileItem.getFieldName();
			String fileName = fileItem.getName();
			String contentType = fileItem.getContentType();
			long fileSize = fileItem.getSize();
				
			out.println("요청 파라미터 이름 : " + fileFieldName + "<br>");
			out.println("파일 이름 : " + fileName + "<br>");
			out.println("파일 콘텐츠 유형 : " + contentType + "<br>");
			out.println("파일 크기 : " + fileSize + "<br>");
			
		}	
		
	%>
	
</body>
</html>