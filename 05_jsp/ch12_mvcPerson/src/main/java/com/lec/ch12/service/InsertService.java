package com.lec.ch12.service;

import java.sql.Date;

import com.lec.ch12.dao.PersonRepository;
import com.lec.ch12.dto.Person;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InsertService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// name, tel, address, birth, memo 파라미터 받아 insert
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		String birthStr = request.getParameter("birth");
		Date birth = null;
		if(!birthStr.equals("")) {
			birth = Date.valueOf(birthStr);
		}
		String memo = request.getParameter("memo");
		Person newPerson = new Person(0, name, tel, address, birth, memo, null);
		PersonRepository dao = PersonRepository.getInstance();
		int insertResult = dao.insertPerson(newPerson);
//		request.setAttribute("insertResult", insertResult);
		if(insertResult == PersonRepository.SUCCESS) {
			request.setAttribute("insertMsg", "지인추가 완성");
		}else {
			request.setAttribute("insertMsg", "지인추가 실패");
		}
				
				
	}

}
