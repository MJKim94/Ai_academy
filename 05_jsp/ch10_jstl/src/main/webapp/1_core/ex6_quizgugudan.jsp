<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<form action="ex6_gugudanResult.jsp">
	<p>
		<input type="text" name="n1" readonly="readonly"  size="1" value="<%=(int)(Math.random()*9)+1 %>">
		<b>*</b>
		<input type="text" name="n2" readonly="readonly"  size="1" value="<%=(int)(Math.random()*9)+1 %>">
		<b>=</b>
		<input type="text" name="result" placeholder="정답을 입력해주세요">
	</p>
	<p>
	<input type="submit" value="정답확인"> 
	</p>
	</form>
	
</body>
</html>