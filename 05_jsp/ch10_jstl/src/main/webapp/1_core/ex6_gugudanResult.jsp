<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<c:set var="n1" value="${param.n1 }"/>
	<c:set var="n2" value="${param.n2 }"/>
	<c:set var="result" value="${param.result }"/>
	<%-- <c:set var="correctAnswer" value="${n1 * n2}" />
	<c:if test="${not empty n1 and not empty n2 and not empty result }">
		<c:if test="${correctAnswer eq result }">
		<h2>${n1} * ${n2} = ${result} 정답입니다</h2>
		</c:if>
		<c:if test="${correctAnswer != result }">
		<h2>${n1} * ${n2} = ${result} 틀렸습니다</h2>
		</c:if>
	</c:if> --%>
	<c:if test="${n1*n2 eq result }">
	<h2>${n1} * ${n2 } = ${result } 정답</h2>
	</c:if>
	<c:if test="${n1*n2 ne result }">
	<h2>${n1 } * ${n2 } = ${result } 오답</h2>
	</c:if>
</body>
</html>