package com.lec.dao;

import java.sql.*;
import java.util.ArrayList;

import com.lec.dto.Dept;

//singleton 패턴 시험문제
public class DeptRepository {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private String uid    = "scott";
	private String upw    = "tiger";
	private static DeptRepository INSTANCE; // INSTANCE 라는변수 생성
	public static DeptRepository getInstance() {
		if(INSTANCE == null) {
			INSTANCE = new DeptRepository();
		}
		return INSTANCE;
	}
	
	private DeptRepository() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
	}
	// SELECT DEPTNO, DNAME FROM DEPT 실행결과 return 함수 만들어보자규
	public ArrayList<Dept> deptList(){
		ArrayList<Dept> dtos = new ArrayList<Dept>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT DEPTNO, DNAME FROM DEPT";
		try {
			conn = DriverManager.getConnection(url, uid, upw); //(2)단계
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
