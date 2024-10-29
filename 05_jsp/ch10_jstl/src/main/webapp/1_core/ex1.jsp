<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<%-- JSP 표준 액션 태그에서의 include : jsp를 실행한 결과 html을 include 
	<jsp:include page="footer.jsp"/>
	<c:forEach></c:forEach> --%>
	<h3>core 라이브러리 태그 : if, forEach, set, ....</h3>
	<%
		for(int i=1 ; i<=3 ; i++){
			out.print(i + "번째 하이용");
		}
	%>
	<c:forEach var="i" begin="1" end="3" step="1">
		${i }번째 하이용<br>
	</c:forEach>
	<h3>fmt(formatting)라이브러리 : 날짜나 숫자 format</h3>
	<fmt:formatDate value="<%=new Date() %>" pattern="YY-MM-dd(E)"/>
	<fmt:formatNumber value="356356.356" pattern="##,###.##"/>
	<h3>그외 라이브러리(functions) : el표기법과 함께 사용하지만 사용을 많이 안하신다</h3>
	id 파라미터를 대문자로  : ${fn:toUpperCase(param.id) }
	id 파라미터를 대문자로  : ${param.id.toUpperCase() }
</body>
</html>