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
	<%
		String[] names = {"홍길동", "신길동", "박길동"};
		for(String name : names){
			out.println("<p>" + name + "</p>");
		}
		for(int idx=0 ; idx<names.length ; idx++){
			out.println("<p>" + idx + "번" + names[idx] + "</p>");
		}
		request.setAttribute("names", names); // 자바측에서 View 단에 출력할 내용을 setAttribute
	%>
	<hr>
	<h4>확장 for문</h4>
	<h3>zz</h3>
	<c:forEach var="name" items="${names }">
		<p>${name }</p>
	</c:forEach>
	<h4>일반 for문</h4>
	<c:set var="idx" value="0"/> <!-- idx변수 선언 -->
	<c:forEach var="name" items="${names }">
	<p>${idx }번째 ${name }</p>
	<c:set var="idx" value="${idx+1 }"/> <!-- idx변수를 재선언 : idx += 1 이랑 동일 -->
	</c:forEach>
	<h4>for문 을 끝까지 수행하지 않고 특정 구간까지만 수행(0~1번)</h4>
	<c:forEach var="name" items="${names }" begin="0" end="1">
	<p>${name }</p>
	</c:forEach>
	<h4>5번 반복하는 for문</h4>
	<c:forEach begin="0" end="5">
	<p>아아아아앙아녕하세요!</p>
	</c:forEach>
</body>
</html>