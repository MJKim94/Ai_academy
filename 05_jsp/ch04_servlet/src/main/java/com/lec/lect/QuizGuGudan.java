package com.lec.lect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/quiz1")
public class QuizGuGudan extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String[] su = request.getParameterValues("su");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(su!=null) {
			out.print(su);
			for(String s : su) {
					int dan = Integer.parseInt(s);
					out.println("<h3>" + dan + "단" + "</h3>");
					for(int i=1 ; i<=9 ; i++){
						out.println(dan + " * " + i + " = " + (dan * i) + "<br>");
					}	
			}
		}else {
			out.println("<h3>구구단을 선택 안하셨습니다.</h3>");
		}
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	}

}
