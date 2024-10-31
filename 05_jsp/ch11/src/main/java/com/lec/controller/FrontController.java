package com.lec.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.lec.service.*;
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// 무슨 요청이 들어왔는지 판별 해야한다(insert.do, select.do, update.do, delete.do)
//		System.out.println(request.getRequestURL()); // 콘솔에 출력하는 아이
//		System.out.println(request.getRequestURI());
//		System.out.println(request.getContextPath());
//		response.getWriter().print(request.getRequestURL()); // 웹페이지에 출력하는 아이
//		response.getWriter().print(request.getRequestURI());
		String uri = request.getRequestURI(); // "ch11/insert.do" 
		String conPath = request.getContextPath(); // "/ch11"
		String command = uri.substring(conPath.length()); // "/insert.do"
//		System.out.println("들어온 요청 : " + command);
		//들어온 요청에 따라 각각 다른 일을 하고 view 로 forword
		Service service = null; // new InsertService, SelectService... 할당할 예정
		String viewPage = null; // View 페이지 경로를 저장할 변수
		if(command.equals("/insert.do")) {
			// insert.do 요청이 들어오면 할일 하고 viewPage로
			service = new InsertService();
			service.execute(request, response);
			viewPage = "ex2/insert.jsp";
			
		}else if(command.equals("/select.do")) {
			// select.do 요청이 들어오면 할일 하고 viewPage로
			service = new SelectService();
			service.execute(request, response);
			viewPage = "ex2/select.jsp";
		}else if(command.equals("/update.do")) {
			// update.do 요청이 들어오면 할일 하고 viewPage로
			service = new UpdateService();
			service.execute(request, response);
			viewPage = "select.do"; // update.do 처리후 -> select.do로 설정해야 list page로 이동함
			
		}else if(command.equals("/delete.do")) {
			// delete.do 요청이 들어오면 할일 하고 viewPage로
			service = new DeleteService();
			service.execute(request, response);
			viewPage = "select.do"; // delete.do 처리후 -> select.do로 설정해야 함!
			
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
