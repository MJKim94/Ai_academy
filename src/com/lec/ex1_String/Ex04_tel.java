package com.lec.ex1_String;

import java.util.Scanner;

// quiz : 전화번호(010-1234-5678) 입력 받아, 전화번호, 짝수번째, 거꾸로, 국번, 뒷네자리 출력  
public class Ex04_tel {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		while(true) {
			System.out.print("전화번호(ooo-oooo-oooo), 종료시 x : " );
			String tel = scanner.next();
			if(tel.equalsIgnoreCase("X")) break;
			//전화번호 출력(tel출력)
			System.out.println("전화번호 : " + tel);
			//짝수번째 문자열 출력(length(), charAt(),for문 이용
			System.out.print("전화 번호 짝수 번호 : ");
			 for (int i = 0; i < tel.length(); i ++) {
				 String temp = tel.charAt(i) + "";
				 if(i%2==0 && !temp.equals("-")) {
	                System.out.print(temp + ",");
	            }
			 }
//			for(int i=0; i<tel.length(); i++) {
//				if(i%2==0) {
//					System.out.print(tel.charAt(i) + " ");
//				}
//			}
			System.out.println();
			//거꾸로 출력(length(), cahrAt(), for문 이용
			System.out.print("전화 번호 거꾸로 : " );
			for (int i = tel.length() - 1; i >= 0; i--) {
                System.out.print(tel.charAt(i));
            }
	        System.out.println();
			//전화번호 앞자리 출력(indexOf(), substring()
//			System.out.println("전화 번호 앞자리 : " + tel.substring(0, 3));
	        int idx = tel.indexOf("-");
	        if(idx != -1) {
	        String preTel = tel.substring(0, tel.indexOf("-"));
	        System.out.println("전화 번호 앞자리 : " + preTel);
			//뒷자리 출력(lastIndexOf(), substring()
//			System.out.println("전화 번호 뒷자리 : " + tel.substring(tel.lastIndexOf("-") + 1));
	        String postTel = tel.substring(tel.lastIndexOf("-") + 1);
	        System.out.println("전화 번호 뒷자리 : " + postTel);
	        }
		}
	}

}