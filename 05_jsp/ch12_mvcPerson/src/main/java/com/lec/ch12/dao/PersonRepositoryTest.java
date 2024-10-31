package com.lec.ch12.dao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.lec.ch12.dto.Person;
@WebServlet("/PersonDaoTest")
public class PersonRepositoryTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		PersonRepository dao = PersonRepository.getInstance();
		ArrayList<Person> personList = dao.getPersonList();
		System.out.println("1. list(paging X)");
		for(Person person : personList) {
			System.out.println(person);
			
		}
		System.out.println("1. list(2등~3등)");
		personList = dao.getPersonList(3, 4);
		for(Person person : personList) {
			System.out.println(person);
		}
		System.out.println("3. getCount");
		System.out.println("전체 갯수 : " + dao.getCount());
		System.out.println("4. 한명 출력 ");
		Person person = dao.getPerson(1);
		System.out.println("id가 1인 사람 : " + person);
//		Person newPerson = new Person(0, "김수한", null, "무안", null, "memo", null);
//		int result = dao.insertPerson(newPerson);
//		if(result == PersonRepository.SUCCESS) {
//			System.out.println(newPerson.getName() + " 추가 성공");
//		}
//		newPerson = new Person(0, "김수한", null, "무안", null, "memo", null);
//		person.setName("바꿨다");
//		person.setAddress("이사간데");
//		result = dao.updatePerson(person);
//		if(result == PersonRepository.SUCCESS) {
//			System.out.println(newPerson.getName() + " 수정 성공");
//			System.out.println("수정 한 후 :" + dao.getPerson(1));
//		}
//		System.out.println("7. 삭제");
//		int id = 1;
//		if(dao.getPerson(id)!=null) {
//			result = dao.deletePerson(id);
//			System.out.println(id + "번 삭제 성공");
//		}else {
//			System.out.println(id + "번 Person은 존재 안함");
//		}
	}
}
