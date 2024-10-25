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
</head>
<body>
	<form action="ex2_deptnoEmpOut.jsp">
	<p>
		<select  name="deptno">
			<option></option>
			<%
			DeptRepository deptRepository = DeptRepository.getInstance();
			ArrayList<Dept> deptList = deptRepository.deptList();
			for(Dept dept : deptList){
				int deptno = dept.getDeptno();
				String dname = dept.getDname();
				out.print("<option value='" + deptno + "'>"); // <option value="10">
				out.print(deptno + "-" + dname);
				out.print("</option>");
			}
			%>
		</select>
		<input type="submit" value="검색">
	</p>	
	</form>
</body>
</html>