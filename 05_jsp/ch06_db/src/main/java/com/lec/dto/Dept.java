package com.lec.dto;
// dto 
public class Dept {
	private int deptno;
	private String dname;
	
	public Dept(int deptno, String dname) {
		super();
		this.deptno = deptno;
		this.dname = dname;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String toString() {
		return "Dept [deptno=" + deptno + ", dname=" + dname + "]";
	}
}
