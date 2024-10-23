package com.lec.lect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String gender = request.getParameter("gender");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		String hobby = request.getParameter("hobby");
		String[] mailSend = request.getParameterValues("mailSend");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<h3> 이름 : " + name + "</h3>");
		out.println("<h3> 아이디 : " + id + "</h3>");
		if (pw != null && !pw.isEmpty()) {
		    String pwMasked = "*".repeat(pw.length()); 
		    out.println("<h3> 비밀번호 : " + pwMasked + "</h3>");
		} else {
		    out.println("");
		}
		out.println("<h3> 생년월일 : " + birth + "</h3>");
//		String hobbyOut = hobby ==null? "없음": hobby.equals(" ")? " " : " ";
//		out.println("<h3> 취미 : " + hobbyOut + "</h3>");
		String hobbyOut = (hobby == null || hobby.trim().isEmpty()) ? "없음" : hobby;
		out.println("<h3> 취미 : " + hobbyOut + "</h3>");
		String genderOut = gender==null? "-": gender.equals("m")? "m" : "f";
		out.println("<h3> 성별 : " + genderOut + "</h3>");
		out.println("<h3> 이메일 : " + email + "</h3>");
		if(mailSend!=null) {
			out.println("<h3>메일수신동의 :");
			for(String m : mailSend) {
				out.println(m + " ");
			}
			out.print("</h3>");
		}else {
			out.println(" ");
		}
		
		
		
	}

}
