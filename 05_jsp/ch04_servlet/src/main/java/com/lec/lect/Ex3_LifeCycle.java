package com.lec.lect;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/LC")
public class Ex3_LifeCycle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void init(ServletConfig config) throws ServletException {
		//서블릿 객체 생성시 실행
		System.out.println("Ex3_LifeCycle 서블릿 생성될때 수행");
		}
	public void destroy() {
		// 서블릿 객체가 소멸될때 실행
		System.out.println("Ex3_LifeCycle 서블릿 객체가 소멸될때 실행");
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// service를 오버라이드 하면 doGet() 함수와 doPost()함수가 실행 되지 않고 sevice()를 실행함
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<h1>service() 함수 수행</h1>");
		out.close();
		System.out.println("Ex3_LifeCycle service() 실행");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<h1>doGet() 함수 수행</h1>");
		out.close();
		System.out.println("Ex3_LifeCycle doGet() 실행");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<h1>doPost() 함수 수행</h1>");
		out.close();
		System.out.println("Ex3_LifeCycle doPost() 실행");
	}

}
