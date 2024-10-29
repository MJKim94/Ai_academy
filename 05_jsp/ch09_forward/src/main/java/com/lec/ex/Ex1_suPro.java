package com.lec.ex;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Ex1_suPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		int su = Integer.parseInt(request.getParameter("su"));
		int sum = 0; // 1부터 su 까지 누적할 변수
		for(int i=1 ; i<=su ; i++) {
			sum += i;
		}
		// 1. redirect는 request객체를 새롭게 생성하여 새로운 요청을 한다
//		response.sendRedirect("1_redirect/ex1_suView.jsp?su="+su+"&sum="+sum);
		// 2. dispatcher를 통한 위임(request객체가 그대로 전달)
		request.setAttribute("sum", sum); // view단으로 보여질 객체는 request에 담는다
		RequestDispatcher dispatcher = request.getRequestDispatcher("2_dispatcher/ex1_suView.jsp");
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}

