package com.lec.ex2_readerWriter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

public class Ex02_writer {
	public static void main(String[] args) {
		Writer writer = null;
		
		try {
			writer = new FileWriter("txtFile/msg.txt", true);
			String msg = "내일부터 오라클한다네......\nDBMS는 개발자 OR 데이터를 사용하는 과학자에게도 필수라고하네...\n";
			writer.write(msg);
			msg = "두번째 write입니다...\n";
			writer.write(msg);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(writer!=null) writer.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
	}
}
