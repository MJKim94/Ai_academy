package com.lec.dao;

import java.io.IOException;
import java.util.ArrayList;

import com.lec.dto.Dept;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/deptRepositoryTest")
public class DeptRepositoryTest extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		DeptRepository deptRepository = DeptRepository.getInstance();
		ArrayList<Dept> deptList = deptRepository.deptList();
		if (deptList.isEmpty()) {
			System.out.println("데이터가 없습니다.");
		}else {
			for(int idx=0 ; idx<deptList.size() ; idx++) {
				System.out.println(deptList.get(idx));
			}
		}
	}
}
