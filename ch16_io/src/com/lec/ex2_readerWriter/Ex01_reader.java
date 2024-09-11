package com.lec.ex2_readerWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
public class Ex01_reader {
	public static void main(String[] args) {
		Reader reader = null;
		try {
			reader = new FileReader("txtFile/inTest.txt");//1. 파일 연다
			while(true) { //2. process
				int i = reader.read();
				if(i==-1) break;
				System.out.println((char)i);
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}finally {//3.파일 닫아
			try {
				if(reader != null) reader.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
}
