<%@page import="java.sql.*"%>
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
	<%!
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String uid    = "scott";
		String upw    = "tiger";
		
	%>
<body>
	<table>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT E.*, DNAME" + 
			   " FROM EMP E, DEPT D" +
			   " WHERE E.DEPTNO LIKE '%'||?" +
			   " AND E.DEPTNO=D.DEPTNO";
		String deptno = request.getParameter("deptno");
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, deptno);
			rs = pstmt.executeQuery();
			out.print("<tr><th>사번</th><th>이름</th><th>직책</th><th>상사사번</th>");
			out.print("    <th>입사일</th><th>급여</th><th>상여</th><th>부서번호</th></tr>");
			if(rs.next()){ // 해당부서번호의 직원이 있는경우 출력
				do{
					int empno = rs.getInt("empno");
					String ename = rs.getString("ename");
					String job = rs.getString("job");
					String mgr = rs.getString("mgr"); // int 로 할시 DB에 NULL 데이터는 0으로 받음
					Date hiredate = rs.getDate("hiredate"); // 날짜만 출력
					int sal = rs.getInt("sal");
					int comm = rs.getInt("comm");
					int dno = rs.getInt("deptno");
					out.print("<tr><td>" + empno + "</td>");
					out.print("<td>" + ename + "</td>");
					out.print("<td>" + job + "</td>");
					out.print("<td>" + mgr + "</td>");
					out.print("<td>" + hiredate + "</td>");
					/* out.print("<td>" + hiredate + " " + hire2 + "</td>"); */
					out.print("<td>" + sal + "</td>");
					out.print("<td>" + comm + "</td>");
					out.print("<td>" + dno + "</td></tr>");
				}while(rs.next());
			}else{ // 해당부서번호의 직원이 없는경우
				out.print("<tr><td colspan='8'>해당부서의 사원이 엄써</td></tr>");
			}			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			
		}
	%>
	</table>
</body>
</html>