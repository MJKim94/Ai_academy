package com.lec.ex;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet(urlPatterns = "/HelloWorld")

public class Ex1_HelloWorld extends HttpServlet {
	private static final long serialVersionUID = 1L;
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
 			throws ServletException, IOException {
 		// http://localhost:8090/ch03~/HelloWorld GET방식으로 요청하면 실행되는 부분
 		System.out.println("GET방식으로 요청");
 		actionDo(request, response);
		}
 	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {		
		doGet(request, response);
		//Post 방식으로 요청하면 실행되는 부분이래용~
		System.out.println("POST방식으로 요청");
		actionDo(request, response);
		}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException{
		// 브라우저 화면에 <h1>안녕하세요 첫 Servlet예이예 입니다</h1>가 있는 html보냄버려!!!!!		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter(); // 스트림 생성생성생성생성생성생성
		out.println("<html>");
		out.println("<head>");
		out.println("<link href='css/ex.css' rel ='stylesheet'>");
		out.println("</head>");
		out.println("<boby>");
		out.println("<h1> 안녕하세요 . 너무 어렵네요</h1>");
		out.println("</boby>");
		out.println("</html>");
		out.close();
	}

}
