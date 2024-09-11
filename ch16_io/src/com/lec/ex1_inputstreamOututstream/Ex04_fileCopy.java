package com.lec.ex1_inputstreamOututstream;
import java.io.*;
//bts_7.mp4 = 읽어서 다른폴더로 넣어놔도 되고 같은폴더(~/)bts_7_copy.mp4((7,460,545 byte)
//C:\Users\4545\Desktop\새 폴더\bts_7.mp4
public class Ex04_fileCopy {
	public static void main(String[] args) {
	long start = System.currentTimeMillis(); // 1970.1.1부터 시작시점까지의 밀리세컨
		InputStream is = null;
		OutputStream os = null;
		try {
			is = new FileInputStream("C:\\Users\\4545\\Desktop\\새 폴더\\bts_7.mp4");
			os = new FileOutputStream("C:\\Users\\4545\\Desktop\\새 폴더\\bts_copy.mp4");
			int cnt = 0;
			while(true) {// read & write
				int i = is.read();
				if(i == -1) break;
				os.write(i);
				cnt++;
				if(cnt % 300000 == 0) {
					System.out.println(cnt + "/7,460,545 번");
				}
			}
			System.out.println("파일 복사 완료");
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(is!=null) is.close();
				if(os!=null) os.close();
			} catch (IOException e2) {
			}
		}
	
	long end = System.currentTimeMillis();
	System.out.println((end-start)/1000.0 + "초 걸림");
	}
}
