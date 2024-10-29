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
	<h1>dispatcher 화면</h1>
	<h2>ID : ${member.id }(member.getId()를 호출하는거랑 동일)</h2>
	<h2>PW : ${member.pw }</h2>
	<h2>NAME : ${member.name }</h2>
	<hr>
	<h1>회원 정보 : request에 파라미터 내용</h1>
	<h2>ID ${param.id }</h2>
	<h2>PW ${param.pw }</h2>
	<h2>NAME ${param.name }</h2>
</body>
</html>