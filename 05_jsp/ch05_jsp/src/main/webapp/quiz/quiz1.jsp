<%@page import="java.util.ArrayList"%>
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
		<%
			String name = request.getParameter("name") != null ? request.getParameter("name").trim() : null;
			String suStr = request.getParameter("su");
			int sum = 0;
	        int su = 0;
	        if(name != null && suStr != null){
	        	su = Integer.parseInt(suStr);
	        	for(int i=1 ; i<=su; i++){
	        		sum += i;
	        	}
	        } else if(name == null){
	        	name = "";
	        }
	        if(suStr == null){
	        	suStr = "";
	        }
		%>
	<fieldset>
	<legend>입력</legend>
		<form action="">
				<p>이름<input type="text" name="name" value="<%= name %>"></p>
				<p>숫자<input type="text" name="su" value="<%= suStr %>"></p>
				<input type="submit" value="누적">
		</form>
	</fieldset>
	
	<%
        if (name != null && suStr != null) {
            if (su > 0) {
                out.println("<h3>" + su + "까지의 누적합은 " + sum + "입니다.</h3>");
            }
        }
    %>
</body>
</html>






















