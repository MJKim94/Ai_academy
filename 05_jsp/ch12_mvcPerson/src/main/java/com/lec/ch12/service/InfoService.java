package com.lec.ch12.service;

import com.lec.ch12.dao.PersonRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InfoService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// id 파라미터 받아서 dao를 통해 person 정보를 request에 setAttribute함
		int id = Integer.parseInt(request.getParameter("id"));
		PersonRepository dao = PersonRepository.getInstance();
		request.setAttribute("person", dao.getPerson(id));
	}

}
