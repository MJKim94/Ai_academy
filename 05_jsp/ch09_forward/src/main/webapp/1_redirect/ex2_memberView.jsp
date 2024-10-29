<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <link href ="<%=conPath %>/css/ex.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<h2>ID : ${param.id } </h2>
	<h2>PW : ${parma.pw } </h2>
	<h2>NAME : ${param.name }</h2>
</body>
</html>