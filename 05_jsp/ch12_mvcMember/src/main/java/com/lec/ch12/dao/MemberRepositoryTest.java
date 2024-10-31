package com.lec.ch12.dao;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import com.lec.ch12.dto.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/memberDaoTest")
public class MemberRepositoryTest extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
		throws ServletException, IOException {
		MemberRepository repository = MemberRepository.getInstance();
		ArrayList<Member> members = repository.getMemberList();
			for(Member member : members) {
				System.out.println(member);
		}
			Member newMember = new Member("abb", "a11", "가가나", new Date(101, 3, 1), null);
			// 회원가입할 newMember ID중복 체크후 회원가입
			int cnt = repository.getCountMember(newMember.getId());
			if(cnt==MemberRepository.MEMBER_NONEXISTENT) {
				int result = repository.insertMember(newMember);
				System.out.println(result==MemberRepository.SUCCESS ? "회원가입 성공":"회원가입 실패");
			}else {
				System.out.println("중복된 아이디 입니다.");
			}
	}
}
