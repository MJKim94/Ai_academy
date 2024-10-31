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
	<form action="${conPath }/insert.do" method="post">
		<table>
			<caption>지인추가</caption>
			<tr>
				<th>이름</th>
					<td>
						<input type="text" name="name" required="required">
					</td>
			</tr>
			<tr>
				<th>전화</th>
					<td>
						<input type="text" name="tel">
					</td>
			</tr>
			<tr>
				<th>주소</th>
					<td>
						<input type="text" name="address">
					</td>
			</tr>
			<tr>
				<th>생년월일</th>
					<td>
						<input type="date" name="birth">
					</td>
			</tr>
			<tr>
				<th>메모</th>
					<td>
						<textarea rows="3" cols="50" name="memo"></textarea>
					</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="추가" class="btn">
					<input type="button" value="목록" class="btn"
						onclick="location='${conPath}/'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>