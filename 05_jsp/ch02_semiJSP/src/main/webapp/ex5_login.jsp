<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="ex5_LoginPro.jsp" method="post">
	<table>
		<tr>
			<th>이름</th>
			<th><input type="text" name="name"></th>
		</tr>
		<tr>
			<th>아이디</th>
			<th><input type="text" name="id"></th>
		</tr>
		<tr>
			<th>비밀번호</th>
			<th><input type="password" name="pw"></th>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="로그인"></td>
		</tr>
	</table>
	</form>
</body>
</html>