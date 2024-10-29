<%@page import="com.lec.dto.Friend"%>
<%@page import="java.util.ArrayList"%>
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
	<form action="friendInputPro.jsp" method="post">
		<p>
		친구이름
		<input type="text" name="name" required="required" size="5">
		전화번호
		<input type="text" name="tel" size="10">
		<input type="submit" value="추가"> 
		</p>
	</form>
	<table>
		<tr><th>순번</th><th>이름</th><th>전화</th></tr>
		<%
			FriendRepository repository = FriendRepository.getIntance();
			ArrayList<Friend> friendList = repository.getFriendList();
			for(Friend friend : friendList){
				String tel = friend.getTel();
				out.println("<tr>");
				out.println("<td>" + friend.getNo() + "</td>");
				out.println("<td>" + friend.getName() + "</td>");
				out.println("<td>" + (tel==null? "":tel) + "</td>");
				out.println("</tr>");
			}
		%>
	</table>
</body>
</html>