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
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	%>
	<h2>결과 화면</h2>
	<p>아이디 :<%=id %></p>
	<p>비밀번호 :<%=pw %></p>
	<p><%=name %>님 나가주세요</p>
</body>
</html>