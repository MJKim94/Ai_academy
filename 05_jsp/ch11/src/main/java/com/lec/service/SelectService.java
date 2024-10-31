package com.lec.service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SelectService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// select 로직 : 파라미터 받아, dao 함수 호출결과를 request에 setAttribute 한다
		System.out.println("pageNum 받아, 몇등~몇등까지 찾아오는 dao 함수 결과를 request에 setAttribute");
		request.setAttribute("list", "list결과를 ArrayList로");
	}

}
