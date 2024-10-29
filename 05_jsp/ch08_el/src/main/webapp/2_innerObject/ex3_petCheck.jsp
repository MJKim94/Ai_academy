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
	<form action="ex4.jsp">
		name <input type="text" name="name"><br>
		키우는 반려동물을 선택하세요<br>
		<input type="checkbox" name="pets" value="호랑이">호랑이
		<input type="checkbox" name="pets" value="앵무새">앵무새
		<input type="checkbox" name="pets" value="뱀">뱀
		<input type="checkbox" name="pets" value="기니피그">기니피그
		<input type="checkbox" name="pets" value="양">양<br>
		<input type="submit" value="나만없어고양이">
	</form>	
</body>
</html>

















