<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	String conPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath %>/css/ex.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h2>구구단</h2>
	<%
	 for(int i=1 ; i<=9 ; i++){
		 out.print(3 + "*" + i + " = " + (3*i) + "<br>");
	 }
	%>
</body>
</html>







