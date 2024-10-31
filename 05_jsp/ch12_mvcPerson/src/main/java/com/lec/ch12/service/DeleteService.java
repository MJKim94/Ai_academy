package com.lec.ch12.service;

import com.lec.ch12.dao.PersonRepository;
import com.lec.ch12.dto.Person;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		PersonRepository dao = PersonRepository.getInstance();
		Person person = dao.getPerson(id);
		int deleteResult = dao.deletePerson(id);
		String deleteMsg = deleteResult==PersonRepository.SUCCESS? person.getName()+" 삭제 성공": person.getName()+ "삭제 실패";
		request.setAttribute("deleteMsg", deleteMsg);
	}

}
