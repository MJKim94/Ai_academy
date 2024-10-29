package com.lec.dao;

import java.io.IOException;
import java.util.ArrayList;

import com.lec.dto.Emp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/empDaoTest")
public class EmpRepositoryTest extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		EmpRepository empRepository = EmpRepository.getInstance();
		ArrayList<Emp> emps = empRepository.empList();
		System.out.println("empList()결과 :" + emps.size() + "행");
		for(Emp emp : emps) {
			System.out.println(emp);
		}
		emps = empRepository.empListByDeptno(null);
		System.out.println("empListByDeptno(null) 결과 :" + emps.size());
		if(emps.isEmpty()) {
			System.out.println("부서번호의 사원이 없습니다.");
		}else {
			for(Emp emp : emps) {
				System.out.println(emp);
			}
		}
		emps = empRepository.empListByDeptno("40");
		System.out.println("empListByDeptno(\"40\") 결과 :" + emps.size());
		if(emps.isEmpty()) {
			System.out.println("부서번호의 사원이 없습니다.");
		}else {
			for(Emp emp : emps) {
				System.out.println(emp);
			}
		}
		emps = empRepository.empListBySchName("       s   ");
		System.out.println("empListBySchName(\"       s   \") 결과 : " + emps.size());
		if(emps.isEmpty()) {
			System.out.println("검색에 해당되는 이름은 없습니다.");
		}else {
			for(Emp emp : emps) {
				System.out.println(emp);
			}
		}
		emps = empRepository.empListBySchName("     ");
		System.out.println("empListBySchName(\"     \") 결과 :" + emps.size());
		if(emps.size()!=0) {
			for(Emp emp : emps) {
				System.out.println(emp);
			}
		}else {
			System.out.println("해당 사원은 없습니다");
		}
	}
}
	
