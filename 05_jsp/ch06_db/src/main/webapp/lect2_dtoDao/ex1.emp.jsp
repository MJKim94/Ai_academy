<%@page import="com.lec.dto.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.dao.EmpRepository"%>
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
</head>
<body>
 <table>
	<%
		EmpRepository empRepository = EmpRepository.getInstance();
		ArrayList<Emp> empList = empRepository.empList();
		if(empList.isEmpty()){
			out.print("<tr><td>입력하신 사원정보가 없습니다.</td></tr>");
		}else{
			out.print("<tr><th>사번</th><th>이름</th><th>직책</th><th>상사사번</th>");
			out.print("    <th>입사일</th><th>급여</th><th>상여</th><th>부서번호</th></tr>");
			for(Emp emp : empList){
				out.print("<tr><td>" + emp.getEmpno() + "</td>");
				out.print("<td>" + emp.getEname() + "</td>");
				out.print("<td>" + emp.getJob() + "</td>");
				out.print("<td>" + emp.getMgr() + "</td>");
				out.print("<td>" + emp.getHiredate() + "</td>");
				out.print("<td>" + emp.getSal() + "</td>");
				out.print("<td>" + emp.getComm() + "</td>");
				out.print("<td>" + emp.getDeptno() + "</td></tr>");
			}
		}
	%>
 </table>
</body>
</html>