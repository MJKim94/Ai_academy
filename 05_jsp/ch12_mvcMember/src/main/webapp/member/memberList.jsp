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
<!-- join 후에 List Page 올 경우 가입 메세지(insertResult, insertMsg, memberExistentMsg) 출력  -->
	<c:if test="${not empty insertMsg }">
		 <script>alert('${insertMsg}');</script>
	</c:if>
	
	<c:if test="${not empty memberExistentMsg }">
		<script>
			alert('${memberExistentMsg}');
			//history.back();
			history.go(-1);
		</script>
	</c:if>
	
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<c:if test="${insertResult eq SUCCESS }">
		<script>alert('가입성공')</script>
	</c:if>
	<c:if test="${insertResult eq FAIL }">
		<script>alert('가입실패')</script>
	</c:if>
	<table>
		<tr><th>순번</th><th>ID</th><th>PW</th><th>이름</th><th>생일</th><th>가입일</th></tr>
		<%-- <c:if test="${memberList.size() eq 0 }">
		
		</c:if> --%>
		<c:if test="${empty memberList || memberList.isEmpty() }">
			<tr><td colspan="6">회원가입한 회원이 없습니다</td></tr>
		</c:if>
		<c:set var="no" value="1"/> <!-- 순번을 출력할 no변수 선언 -->
		<c:forEach var="member" items="${memberList }">
			<tr>
				<td>${no }</td>
				<td>${member.id }</td>			
				<td>${member.pw }</td>			
				<td>${member.name }</td>			
				<td>
					<fmt:formatDate value="${member.birth }" pattern="MM월dd일(E요일)"/>
				</td>
				<td>
					<fmt:formatDate value="${member.rdate }" pattern="YY-MM-dd(E요일) HH:mm"/>
				</td>			
			</tr>
			<c:set var="no" value="${no+1 }"/> <!-- 순번을 출력할 no 변수를 재선언 -->
		</c:forEach>		
	</table>
	<p>
		<button onclick="location.href='${conPath}/memberJoinView.do'">회원가입</button>
		<button onclick="location.href='${conPath}/'">처음으로</button>
	</p>
</body>
</html>