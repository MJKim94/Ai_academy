<%@page import="com.lec.dao.FriendRepository"%>
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
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	FriendRepository dao = FriendRepository.getIntance();
	int result = dao.insertFriend(name, tel);
	if(result==FriendRepository.SUCCESS){
	%>
	<script>
		alert('친구추가 성공');
		location.href = 'friendInputList.jsp'; // 새롭게 request 요청
	</script>	
	<%}else{%>
	<script>
		alert('친구추가 실패');
		history.back();// 이전페이지로 가라
	</script>		
	<%}%>
</body>
</html>