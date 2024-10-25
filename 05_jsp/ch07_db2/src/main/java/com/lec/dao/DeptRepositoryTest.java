package com.lec.dao;

import java.util.ArrayList;

import com.lec.dto.Dept;

public class DeptRepositoryTest {
	public static void main(String[] args) {
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
