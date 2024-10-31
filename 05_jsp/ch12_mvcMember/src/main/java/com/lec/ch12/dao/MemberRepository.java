package com.lec.ch12.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.ch12.dto.Member;


public class MemberRepository {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	public static final int MEMBER_EXISTENT = 1; // 아이디가 중복된 아이디 일경우
	public static final int MEMBER_NONEXISTENT = 0; // 사용가능한 아이디일경우
	private DataSource ds;
	//singleton code
	private static MemberRepository INSTANCE;
	public static MemberRepository getInstance() {
		if(INSTANCE==null) {
			INSTANCE = new MemberRepository();
		}
		return INSTANCE;
	}
	private MemberRepository() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	// 1. 회원 목록 출력 
	public ArrayList<Member> getMemberList(){
		ArrayList<Member> members = new ArrayList<Member>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="SELECT *"
				+ "    FROM MEMBER"
				+ "    ORDER BY NAME";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw").replaceAll("[0-9a-zA-Z~`!@#$%^&*()]", "*"); // 비밀번호 "*" 처리
				String name = rs.getString("name");
				Date birth = rs.getDate("birth");
				Timestamp rdate = rs.getTimestamp("rdate");
				members.add(new Member(id, pw, name, birth, rdate));
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
		return members;
	}
	
	
	// 2. 아이디 중복체크
	public int getCountMember(String id) {
		int count = MEMBER_EXISTENT;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="SELECT COUNT(*)"
				+ "    FROM MEMBER"
				+ "    WHERE ID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);			
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
		return count;
	}	
	// 3. 회원가입
	public int insertMember(Member member) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql ="INSERT INTO MEMBER (ID, PW, NAME, BIRTH)"
				+ "    VALUES (?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setDate(4, member.getBirth());
			pstmt.executeUpdate();
			result = SUCCESS;
			System.out.println("회원가입 성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "회원가입 실패");
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
}
