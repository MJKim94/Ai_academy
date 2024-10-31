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
	<table>
		<caption>${param.id }번 상세보기</caption>
		<tr><th>ID</th><td>${person.id }</td></tr>
		<tr><th>이름</th><td>${person.name }</td></tr>
		<tr><th>전화</th><td>${person.tel }</td></tr>
		<tr><th>주소</th><td>${person.address }</td></tr>
		<tr><th>생년월일</th><td>${person.birth }</td></tr>
		<tr>
			<th>메모</th>
			<td>
			<pre>${person.memo }</pre> <!-- 내용 그대로 출력 -->
			</td>
		</tr>
		<tr>
			<th>등록</th>
			<td>
				<fmt:formatDate value="${person.rdate }" pattern="YY-MM-dd(E) hh:mm(a)"/>
			</td> 
		</tr>
		<tr>
			<td colspan="2">
				<button onclick="location='${conPath}/update.do?id=${param.id }'">수정</button>
				<button onclick="location='${conPath}/delete.do?id=${param.id }'">삭제</button>
				<button onclick="location='${conPath}/list.do'">목록</button>
				<button onclick="location='${conPath}/insert.do'">추가</button>
			</td>
		</tr>
	</table>
</body>
</html>