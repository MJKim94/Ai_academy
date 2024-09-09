package com.lec.ex4_Object;
//Person p1 = new Person()
//Person p2 = new Person(9812121021452L)
//p1.equals(p2) => true
//sysout(p1) => 주민번호는 9812121021452입니다
public class Person extends Object {
	private long juminNo;
	public Person(long juminNo) {
		this.juminNo = juminNo;
	}
	public String toString() {
		return "주민번호는" + juminNo;
	}
	public boolean equals(Object obj) {
		//p1.equals(p2) p1.juminNo와 p2의 juminNo와 비교 하여 return
		//p1.this, p2 Obj => juminNO : Obj.juminNo 비교
		if(obj!=null && obj instanceof Person) {
			Person other = (Person)obj;
			boolean juminNoChk = juminNo == other.juminNo;
			return juminNoChk;
		}
		return false;
	}
}
