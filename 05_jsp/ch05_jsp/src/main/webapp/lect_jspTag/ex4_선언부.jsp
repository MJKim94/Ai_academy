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
	<% // 자바 코드 스크립트릿 부분
		int j=0; // 초기화 하지 않으면 쓰레기 데이터
		String localStr = "로컬 ";
		i++; j++;
		globalStr += "<span> ★ </span>";
		localStr += "<span> ※ </span>";
		out.print("전역변수 i : " + i + "<br>");
		out.print("전역변수 j : " + j + "<br>");
		out.print("전역변수 globalStr : " + globalStr + "<br>");
		out.print("전역변수 localStr : " + localStr + "<br>");
		out.print("sum(3,4) = " + sum(3,4));
		
	%>
	<%! // 선언부 : 먼저 실행. 최초1회 실행
		int i; // 선언부 의 데이터는 초기화하지 않아도 초기화
		String globalStr = "전역";
		private int sum(int a, int b){
			return a + b;
		}
	%>
</body>
</html>