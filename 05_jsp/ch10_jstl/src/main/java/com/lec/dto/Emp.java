package com.lec.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
@AllArgsConstructor
@Data
public class Emp {
	private int empno;
	private String ename;
	private String job;
	private String mgr; // el표기법에서는 null은 빈스트링으로 표시됨
	private Timestamp hiredate;
	private int sal;
	private int comm;
	private int deptno;
}
