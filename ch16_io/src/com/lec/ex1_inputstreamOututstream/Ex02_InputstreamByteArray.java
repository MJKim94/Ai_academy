package com.lec.ex1_inputstreamOututstream;
import java.io.*;
//파일 input : 1.파일을 연다 (스트림객체생성) 2. 데이터를 읽는다(readMathod사용) 3.파일을 닫는다(closeMathod사용)
public class Ex02_InputstreamByteArray {
	public static void main(String[] args) {
		InputStream is = null;
		try {
			is = new FileInputStream("txtfile/inTest.txt");
			byte[] bs = new byte[10];// byte[x] x에 들어가는 숫자만큼 byte 읽어오는 용도
			while(true) {
				int readByteCount = is.read(bs);
				if(readByteCount == -1) break;
				for(int i=0 ; i<readByteCount ; i++) {
					System.out.print((char)bs[i]);
				}
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(is!=null) is.close();
			}catch(IOException e2) {
				System.out.println(e2.getMessage());
			}
		}
	}
}
