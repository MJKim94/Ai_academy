package com.lec.ex1_inputstreamOututstream;
import java.io.*;
// 파일 열기(스트림객체생성) -> 쓰기 -> 파일 닫기 (스트림객체close)
public class Ex03_Outputstream {
	public static void main(String[] args) {
		OutputStream os = null;
		try {//파일 연다 ㅇㅋ?
			// 있는 파일은 덮어쓰고, 없는 파일은 생성 한다 ㅇㅋ?
			os = new FileOutputStream("txtFile/outTest.txt", true);
			// true:append, 생략하거나 false : 덮어쓰기~ ㅇㅋ?
			String msg = "Hello, World\nHi, AI\n하잉\n";
			byte[] bs = msg.getBytes();
			// 파일 쓰기 했다 ㅇㅋ?
			os.write(bs);
			System.out.println("파일 출력 성공 짝짝짝짝");
		} catch (IOException e) {
			System.out.println("폴더가 없을때 : "+e.getMessage());
		}finally {
			try {
				//파일 닫기 ㅇㅋ?
				if(os!=null) os.close();
			} catch (IOException e2) {
			}
		}//try-catch-finally
	}//main
}//class
