package com.lec.lect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
@WebServlet("/ex2")
public class Ex2_params extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {	
		System.out.println("doGet()호출");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("doPost()호출");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// menu, rest파라미터는 복수개임
		String gender = request.getParameter("gender");
		String[] menu = request.getParameterValues("menu"); // 같은 이름의 파라미터가 전달될때 사용된다
		String[] rest = request.getParameterValues("rest");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(menu!=null) {
			out.println("<h2>선택한 메뉴는 ");
			for(String m : menu) {
				out.println(m + " ");
			}
			out.print("입니다</h2>");
		}else {
			out.println("<h2>선택한 메뉴가 없습니다</h2>");
		}
//		out.println("<h2>선택한 메뉴는 " + Arrays.toString(menu) + "입니다</h2>");
		out.println("<h2>선택한 식당은 " + Arrays.toString(rest) + "입니다</h2>");
		String genderOut = gender==null? "-": gender.equals("m")? "남자" : "여자";
		out.println("<h2>성별은 " + genderOut + "입니다</h2>");
		out.close();
	}

}
