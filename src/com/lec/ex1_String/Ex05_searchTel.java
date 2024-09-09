package com.lec.ex1_String;

import java.util.Scanner;

// 배열에 있는 전화번호 검색 
public class Ex05_searchTel {
	public static void main(String[] args) {
		String[] tel = {"010-1234-5678", "010-5678-1234", "010-4321-5678"}; 
		Scanner scanner = new Scanner(System.in);
		boolean noSearch = true; // 검색결과 없으면 true / 검색결과 있으면 false 표시
		System.out.print("검색하실 전화번호 뒷자리 : ");
		String searchTel = scanner.next();
		for(String t : tel) {
			int i = t.lastIndexOf("-");
			String postTel = t.substring(i+1);
			if(postTel.equals(searchTel)) {
				System.out.println("검색 하신 전화번호 는 " + t);
				noSearch = false;
			}
		}
		//		for(int idx=0 ; idx<tel.length ; idx++) {
//			int i = tel[idx].lastIndexOf("-");
//			String postTel = tel[idx].substring(i+1);
//			if(postTel.equals(searchTel)) {
//				System.out.println("검색 하신 전화번호 는 " + tel[idx]);
//				noSearch = false;
//			}//if
//		}//for
		if(noSearch) {
			System.out.println("검색하신 전화번호 는 없습니다.");
		}
	}//main56
}
