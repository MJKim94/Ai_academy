package com.lec.service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InsertService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// insert 로직을 여기서 작성하면 된다 : 파라미터 들 받아서 dao 함수 호출 한다
		System.out.println("insert 로직 수행함");
		request.setAttribute("insertResult", 1); // 1을 리턴하면 인서트 성공
	}

}
