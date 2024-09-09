package com.lec.ex3_math;
// Math.round(소수점에서 반올림함) ex: Math.round(9.17) => 9(long형)
// Math.ceil(소수점 올릴 실수)		 Math.ceil(9.17) => 10.0(double형)
// Math.floor(소수점에서 버릴 실수)	 Math.floor(9.17) => 9.0(double형)
public class Ex01_round {
	public static void main(String[] args) {
		System.out.println("소수점에서 반올림, 올림, 버림");
		System.out.println("9.15를 올림 : " + (int)Math.ceil(9.15));
		System.out.println("9.15를 반올림 : " + Math.round(9.15));
		System.out.println("9.15를 버림 : " + (int)Math.floor(9.15));
		
		System.out.println("소수점 한자리 에서 반올림, 올림, 버림");
		System.out.println("9.15를 올림 : " + Math.ceil(9.15*10)/10);
		System.out.println("9.15를 반올림 : " + Math.round(9.15*10)/10.0);
		System.out.println("9.15를 버림 : " + Math.floor(9.15*10)/10);
		
		System.out.println("십의자리 에서 반올림, 올림, 버림");
		System.out.println("69를 올림 : " + Math.ceil(69/10.0)*10);
		System.out.println("69를 반올림 : " + Math.round(69/10.0)*10);
		System.out.println("69를 버림 : " + (int)Math.floor(69/10.0)*10);
	}
}
