package com.lec.ex1_inputstreamOututstream;
import java.io.*;
// 파일 input : 1.파일을 연다 (스트림객체생성) 2. 데이터를 읽는다(readMathod사용) 3.파일을 닫는다(closeMathod사용)
public class Ex01_Inputstream {
	public static void main(String[] args) {
		//1. 파일을 연다 ㅇㅋ?
		InputStream is = null;
		try {
			is = new FileInputStream("txtFile/inTest.txt");
			//2. 데이터 읽는다 ㅇㅋ? (파일끝까지 읽는다)
			while(true) {
				int i = is.read(); // 1byte 씩 읽는놈 ㅇㅋ?
				if(i == -1) break; // 파일 다 읽으면 break ㅇㅋ?
				System.out.print((char)i); // 아스키 코드 보고싶으면  + "(" + i + ")" ㅇㅋ?
			}
			System.out.println();
			System.out.println("파일 끝났드아~~~~");
		} catch (FileNotFoundException e) {
			System.out.println("에러메세지 : " + e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}finally { // 3. 파일 닫는다 ㅇㅋ?
			try {
				if(is!=null)is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
