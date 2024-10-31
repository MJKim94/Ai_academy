<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title>Insert title here</title>
 <link href ="${conPath }/css/ex.css" rel="stylesheet">
</head>
<body>
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<c:if test="${updateResult eq SUCCESS }">
		<script>alert('수정 성공')</script>
	</c:if>
	<c:if test="${updateResult eq FAIL }">
		<script>alert('수정실패')</script>
	</c:if>
	<c:if test="${deleteResult eq SUCCESS }">
		<script>alert('삭제 성공')</script>
	</c:if>
	<c:if test="${deleteResult eq FAIL }">
		<script>alert('삭제 실패')</script>
	</c:if>
	<h1>select.jsp파일</h1>
	<h3>
	select 결과 : ${list }
	(다음 프로젝트부터는 if와 forEach 사용할 예정)
	</h3>
</body>
</html>