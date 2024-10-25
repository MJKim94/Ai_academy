<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String conPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <link href="<%=conPath %>/css/ex.css" rel="stylesheet" type="text/css">
</head>
<body>
   <!--<h3>ageInput.jsp(나이입력)-> /ex3_agePro(나이에 따른 분기) -> pass.jsp?age=20</h3>  -->
   <%
   int age = Integer.parseInt(request.getParameter("age"));
   %>
   <h3><%=age %>살 이여?</h3>
   <button onclick="history.back()">뒤로가기</button>
   <button onclick="location.href='ex3_ageInput.jsp'">새로입력</button>
</body>
</html>