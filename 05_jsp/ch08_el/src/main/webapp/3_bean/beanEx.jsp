<%@page import="com.lec.dto.Friend"%>
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
	<%
		//mvc패턴에서는 자바에서 구현될 소스는 자바에서 구현
		Friend friend = new Friend(1, "홍길동", "010-9999-9999");
		request.setAttribute("friend", friend);
	%>
	<h2>친구 정보 (el표기법)</h2>
	<h3>friend : ${friend }</h3>
	<h3>순번 : ${friend.no }(getNo()자동호출)</h3>
	<h3>이름 : ${friend.name }</h3>
	<h3>번호 : ${friend.tel }</h3>
</body>
</html>