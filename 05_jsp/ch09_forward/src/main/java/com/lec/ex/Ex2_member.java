package com.lec.ex;

import java.io.IOException;
import java.net.URLEncoder;

import com.lec.dto.Member;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ex2_member extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		// 1. redirect는 request객체를 새로 생성해서 새롭게 요청을 위임
		// url에 한글 전달시 한글을 enconding 처리 해줘야함
//		name = URLEncoder.encode(name, "utf-8");
//		response.sendRedirect("1_redirect/ex2_memberView.jsp?id="+id+"&pw="+pw+"&name="+name);
		// 2. dispatcher에서 view단(jsp) 보여질 객체를 request에 담고 forward한다
		Member member = new Member(id, pw, name);
		request.setAttribute("member", member);
		RequestDispatcher dispatcher = request.getRequestDispatcher("2_dispatcher/ex2_memberView.jsp");
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
