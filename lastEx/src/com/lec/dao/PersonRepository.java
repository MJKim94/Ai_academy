package com.lec.dao;

import java.sql.*;
import java.util.ArrayList;

import com.lec.dto.Person;

public class PersonRepository {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "scott";
	private String pw = "tiger";
	public final static int SUCCESS = 1; 
	public final static int FAIL    = 0;
	private static PersonRepository INSTANCE = new PersonRepository();
	public static PersonRepository getInstance() {
		return INSTANCE;
	}
	private PersonRepository() {
	}
	public ArrayList<String> jnameList(){
		ArrayList<String> pers = new ArrayList<String>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT jNAME"
				+ "    FROM JOB";
		try {
			conn = DriverManager.getConnection(url, id, pw);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				pers.add(rs.getString("jname"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		
		return pers;
	}
	// 연예인 정보 가져오는 함수
	public int insertPerson(String pname, String jname, int kor, int eng, int mat) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO PERSON (PNO, PNAME, JNO, KOR, ENG, MAT)"
				+ "  VALUES (PERSON_PNO_SQ.NEXTVAL, ?,"
				+ "    (SELECT JNO FROM JOB WHERE JNAME=?), ?, ?, ?)";
		try {
			conn = DriverManager.getConnection(url, id, pw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			pstmt.setString(2, jname);
			pstmt.setInt(3, kor);
			pstmt.setInt(4, eng);
			pstmt.setInt(5, mat);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// 2번!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	public ArrayList<Person> getPerson(String jname){
		ArrayList<Person> gps = new ArrayList<Person>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT ROWNUM RK, A.*"
				+ "    FROM (SELECT pNAME||'('||PNO||'번)' PNAME, jNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM"
				+ "    FROM PERSON P, JOB  J"
				+ "    WHERE P.jNO=J.jNO"
				+ "    AND jNAME = ?"
				+ "    ORDER BY SUM DESC) A ";
		try {
			conn = DriverManager.getConnection(url, id, pw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, jname);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rank = rs.getInt("rk");
				String pname = rs.getString("pname");
				int kor = rs.getInt("kor");
				int eng = rs.getInt("eng");
				int mat = rs.getInt("mat");
				int sum = rs.getInt("sum");
				gps.add(new Person(rank, pname, jname, kor, eng, mat, sum));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return gps;
	}
	
//	3번기능 : RANK, PNAME(PNO), JNAME, KOR, ENG, MAT, SUM(총합)

	public ArrayList<Person> getPerson(){
		ArrayList<Person> gpss = new ArrayList<Person>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT ROWNUM RK, A.*"
				+ "  FROM (SELECT pNAME||'('||PNO||'번)' pNAME, jNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM"
				+ "        FROM PERSON P, JOB J"
				+ "        WHERE P.jNO=J.jNO"
				+ "        ORDER BY SUM DESC) A ";
		try {
			conn = DriverManager.getConnection(url, id, pw);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rank = rs.getInt("rk");
				String pname = rs.getString("pname");
				String jname = rs.getString("jname");
				int kor = rs.getInt("kor");
				int eng = rs.getInt("eng");
				int mat = rs.getInt("mat");
				int sum = rs.getInt("sum");
				gpss.add(new Person(rank, pname, jname, kor, eng, mat, sum));			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return gpss;
	}
}
