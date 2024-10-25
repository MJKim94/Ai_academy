package com.lec.ex;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/ex3_agePro")
public class Ex3_agePro extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		int age = Integer.parseInt(request.getParameter("age"));
		if(age >= 19) {
			// ex3_pass.jsp로 다시 request 요청
			response.sendRedirect("lect_innerObject/ex3_pass.jsp?age="+age);
		}else {
			response.sendRedirect("lect_innerObject/ex3_ng.jsp?age="+age);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
