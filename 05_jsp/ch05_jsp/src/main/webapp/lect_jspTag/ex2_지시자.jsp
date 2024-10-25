<%@page import="java.util.Arrays" %>
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
<!-- 지시자: page, include, taglib(9장에서) -->
	<%
	int[] arr = {1,2,3};
	out.print(Arrays.toString(arr));
	%>
	<hr>
	 <!-- JSP 표준 액션 태그 include : jsp를 실행한 결과 html을 include 합니다 -->
	<jsp:include page="../main/footer.jsp"/>
	<hr>
	<!-- 지시자의 include : jsp를 include -->
	<hr>
	다시 ex2_지시자로 옴 - 끝 -
</body>
</html>