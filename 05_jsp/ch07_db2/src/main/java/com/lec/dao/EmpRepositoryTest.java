package com.lec.dao;

import java.util.ArrayList;

import com.lec.dto.Emp;

public class EmpRepositoryTest {
	public static void main(String[] args) {
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
