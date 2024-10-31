package com.lec.ch12.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.lec.ch12.service.MemberJoinService;
import com.lec.ch12.service.MemberListService;
import com.lec.ch12.service.Service;
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//들어온 요청을 판별하고 , 그에 따른 service.execute(req, res) 호출한후 view단으로
		String uri = request.getRequestURI(); // "/ch12_mvcMember/memberList.do
		String conPath = request.getContextPath();
		String command = uri.substring(15);
		//System.out.println("요청 command : " + command);
		Service service = null;
		String viewPage = null;
		if(command.equals("/memberList.do")) {
			service = new MemberListService();
			service.execute(request, response);
			viewPage = "member/memberList.jsp";
		}else if(command.equals("/memberJoin.do")) {
			viewPage = "member/memberJoin.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//들어온 요청을 판별하고 , 그에 따른 service.execute(req, res) 호출한후 view단으로
		String uri = request.getRequestURI(); // "/ch12_mvcMember/memberList.do
		String conPath = request.getContextPath();
		String command = uri.substring(15);
		Service service = null;
		String viewPage = null;
		if(command.equals("/memberList.do")) {
			service = new MemberListService();
			service.execute(request, response);
			viewPage = "member/memberList.jsp";
		}else if(command.equals("/memberJoin.do")) {
			service = new MemberJoinService();
			service.execute(request, response);
			viewPage = "memberList.do"; //
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
