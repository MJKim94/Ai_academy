package com.lec.ch12.service;

import com.lec.ch12.dao.PersonRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// dao 에서 List 가져오는 아이
		PersonRepository dao = PersonRepository.getInstance();
		request.setAttribute("personList", dao.getPersonList());
	}

}
