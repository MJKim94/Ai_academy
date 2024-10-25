package com.lec.dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.dto.Dept;

//singleton 패턴 시험문제
public class DeptRepository {
	private static DeptRepository INSTANCE; // INSTANCE 라는변수 생성
	public static DeptRepository getInstance() {
		if(INSTANCE == null) {
			INSTANCE = new DeptRepository();
		}
		return INSTANCE;
	}
	
	private DeptRepository() {}
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	// SELECT DEPTNO, DNAME FROM DEPT 실행결과 return 함수 만들어보자규
	public ArrayList<Dept> deptList(){
		ArrayList<Dept> dtos = new ArrayList<Dept>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT DEPTNO, DNAME FROM DEPT";
		try {
			conn = getConnection(); //(2)단계
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery(); // 4+5
			while(rs.next()) { //6
				int deptno = rs.getInt("deptno");
				String dname = rs.getString("dname");
				dtos.add(new Dept(deptno, dname));
			}
//			while(rs.next()) {
//				Dept dept = new Dept();
//				dept.setDeptno(rs.getInt("deptno"));
//				dept.setDname(rs.getString("dname"));
//				dtos.add(dept);
//				
//			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally { //7
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}

}
