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
	<form action="<%=conPath %>/ex3_agePro" method="post">
	나이<input type="text" name="age" min="0" required="required">
	<input type="submit" value="인증">
	</form>
</body>
</html>