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
	<form action="<%=conPath %>/ex1_suPro">
		누적을 원하는수
		<input type="number" name="su" required="required">
		<input type="submit" value="누적">
	</form>
</body>
</html>