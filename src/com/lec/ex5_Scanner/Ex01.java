package com.lec.ex5_Scanner;

import java.util.Scanner;

public class Ex01 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("나이 : ");
		int age = scanner.nextInt();
		System.out.println("입력 한 나이 : " + age);
		System.out.print("이름 : ");
//		scanner.nextLine();
		String name = scanner.next();
		System.out.println("입력 하신 이름 : " + name);
		System.out.print("주소 : ");
		scanner.nextLine();// 버퍼에 남아있는 내용을 (\n포함) 삭제!!!!!!!!!!!!!!!!!!!!!!!
		String address = scanner.nextLine();// "\n"앞의 값을 리턴 하고 나머지는 버퍼에서 삭제!!!!!!!!!!!!!!!!!!!!!
		System.out.println("입력한 주소는 : " + address);
	}
}