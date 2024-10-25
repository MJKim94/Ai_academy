<%@page import="com.lec.dto.Emp"%>
<%@page import="com.lec.dao.EmpRepository"%>
<%@page import="com.lec.dto.Dept"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.dao.DeptRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	String conPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath %>/css/ex.css" rel="stylesheet" type="text/css">
<script>
	windwo.onload = () => {
		document.querySelector('input[name="schName"]').onkeyup = function(){
				document.querySelector('form').submit();
			};
		};
	
</script>
</head>
<body>
	<%-- <form action="">
	<p>
		<label for="ename">사원명</label>
		<input type="text" name="name" id="name" value="<%= request.getParameter("ename") != null ? request.getParameter("ename") : "" %>">
		<input type="submit" value="검색">
	</p>	
	</form>
	<table>
	<%
		String nameStr = request.getParameter("name");
		if(nameStr == null){
			nameStr = "";
		}
		nameStr = nameStr.replace("s", "S").trim();
		EmpRepository empRepository = EmpRepository.getInstance();
		ArrayList<Emp> empList;
		if(nameStr.isEmpty()){
			empList = empRepository.empList();
		}else{
			empList = empRepository.empListBySchName(nameStr);
		}
		out.print("<tr><th>사번</th><th>이름</th><th>직책</th><th>상사사번</th>");
		out.print("    <th>입사일</th><th>급여</th><th>상여</th><th>부서번호</th></tr>");
		if(empList.size()!=0){
			for(Emp emp : empList){
				out.print("<tr><td>" + emp.getEmpno()+ "</td>");
				out.print("<td>" + emp.getEname()+ "</td>");
				out.print("<td>" + emp.getJob()+ "</td>");
				out.print("<td>" + emp.getMgr()+ "</td>");
				out.print("<td>" + emp.getHiredate()+ "</td>");
				out.print("<td>" + emp.getSal()+ "</td>");
				out.print("<td>" + emp.getComm()+ "</td>");
				out.print("<td>" + emp.getDeptno()+ "</td></tr>");
			}
		}else{
			out.print("<tr><td colspan='8'>해당 이름의 사원은 엄서요</td></tr>");
		}
	%>
	</table> --%>
	<form action="">
	<p>
	<%
	String nameStr = request.getParameter("name");
	if(nameStr == null){
		nameStr = "";
	}
	nameStr = nameStr.replace("s", "S").trim();
	EmpRepository empRepository = EmpRepository.getInstance();
	ArrayList<Emp> empList;
	if(nameStr.isEmpty()){
		empList = empRepository.empList();
	}else{
		empList = empRepository.empListBySchName(nameStr);
	}
	%>
		<label for="ename">사원명</label>
		<input type="text" name="name" id="name" value="<%= nameStr %>">
		<!-- <input type="submit" value="검색"> -->
	</p>	
	</form>
	<table>
	<%
		out.print("<tr><th>사번</th><th>이름</th><th>직책</th><th>상사사번</th>");
		out.print("    <th>입사일</th><th>급여</th><th>상여</th><th>부서번호</th></tr>");
		if(empList.size()!=0){
			for(Emp emp : empList){
				out.print("<tr><td>" + emp.getEmpno()+ "</td>");
				out.print("<td>" + emp.getEname()+ "</td>");
				out.print("<td>" + emp.getJob()+ "</td>");
				out.print("<td>" + emp.getMgr()+ "</td>");
				out.print("<td>" + emp.getHiredate()+ "</td>");
				out.print("<td>" + emp.getSal()+ "</td>");
				out.print("<td>" + emp.getComm()+ "</td>");
				out.print("<td>" + emp.getDeptno()+ "</td></tr>");
			}
		}else{
			out.print("<tr><td colspan='8'>해당 사원은 엄서요</td></tr>");
		}
	%>
	</table>
</body>
</html>