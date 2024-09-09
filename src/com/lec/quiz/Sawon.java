package com.lec.quiz;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

// new Sawon("24a0001","홍길동","전산실")
public class Sawon {
	public static final String COMPUTER = "전산실";
	public static final String PLANNING = "기획팀";
	public static final String DESIGN = "설계팀";
	private String no; // 사번
	private String name;//사원명
	private String dept;//부서명
	private Date hiredate;//입사일
	public Sawon(String no, String name, String dept) {
		this.no = no;
		this.name = name;
		this.dept = dept;
		hiredate = new Date();
	}
	public Sawon(String no, String name, String dept, int y, int m, int d) {
		this.no = no;
		this.name = name;
		this.dept = dept;
		hiredate = new Date(y - 1900, m-1, d);
		hiredate = new Date(new GregorianCalendar(y, m-1, d).getTimeInMillis());
	}
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년M월d일(E)");
		return "[사번]" + no + " [이름] " + name + " [부서] " + dept + " [입사일] " + sdf.format(hiredate);
	}
}
