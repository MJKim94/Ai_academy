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
		String[] pets = request.getParameterValues("pets");
		if(pets==null){
			
		}
	%>
	<h3>이름 ${param.name }</h3>
	<h3>
	키우는 동물 
	${paramValues.pets[0] }
	${paramValues.pets[1] }
	${paramValues.pets[2] }
	${paramValues.pets[3] }
	${paramValues.pets[4] }
	${empty paramValues.pets ? "없어!!!":"" }
	</h3>
</body>
</html>