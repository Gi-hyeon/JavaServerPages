<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
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
      response.setIntHeader("Refresh", 5);
      
      Calendar cal = Calendar.getInstance(); 
      int hour = cal.get(Calendar.HOUR_OF_DAY);
      int minute = cal.get(Calendar.MINUTE);
      int second = cal.get(Calendar.SECOND);
      String ap = "";
      if(hour < 12){
         ap = "AM";
      } else {
         ap = "PM";
      }
      
      if(hour > 12){
         hour -= 12;
      } else if(hour == 0){
         hour = 12;
      }
      
      System.out.print("" + hour + minute + second);
      System.out.println();
      
   %>
   
   현재 시간은 <%= hour  %>:<%= minute %> <%= second %> <%= ap %><br><br>
   
   <a href="response_data.jsp">Google 홈페이지로 이동하기</a>
</body>
</html>