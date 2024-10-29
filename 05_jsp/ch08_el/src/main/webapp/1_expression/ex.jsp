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
	<h2>표현식 태그</h2>
	<p>산술연산 <%=10+1 %></p>
	<p>산술연산 <%=10/0.0 %></p> <!-- 0으로 나누면 에러 발생하지만 0.0으로 나누면 0에 가까운 수로 나눔이 가능하다 -->
	<p>관계연산 1==2 ? <%=1==2 %></p>
	<p>관계연산 1!=2 ? <%=1!=2 %></p>
	<p>조건연산 <%=(1>2) ? "1이 더 큽니다":"2가 더 큽니다" %></p>
	<p>name 파라미터값 : <%=request.getParameter("name") %></p>
	<p>name 파라미터 여부 <%=request.getParameter("name")==null? "안받음":"받음" %></p>
	<%-- <p>name 파라미터 대문자로 <%=request.getParameter("name").toUpperCase() %></p> --%>
	<h2>el표기법(표현식 안에 쓸 수 있는 연산자는 다 사용 가능)</h2>
	<p>산술연산 ${10+1 }</p>
	<p>산술연산 ${10/0 }</p> <!-- 0으로 나누라고 하면 0에 가까운 수로 나눠짐 -->
	<p>관계연산 1==2 ? ${1 eq 2 }</p> <!-- == 가 eq로 변경되어서 사용해야한다 -->
	<p>관계연산 1!=2 ? ${1!=2 } 또는 ${not(1 eq 2)}</p>
	<p>조건연산자는 그대로 ${(1>2) ? "1이 더 큽니다":"2가 더 큽니다" }<p>
	<p>name 파라미터값 : ${param.name }</p>
	<p>name 파라미터 여부 ${empty param.name ? "안받음":"받음" }</p>
	<p>name 파라미터 대문자로 ${param.name.toUpperCase() }</p>
</body>
</html>