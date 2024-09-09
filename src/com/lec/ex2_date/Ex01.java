package com.lec.ex2_date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
public class Ex01 {
	public static void main(String[] args) {
		Date nowDate = new Date();
		Calendar nowCal = Calendar.getInstance();
		GregorianCalendar nowGc = new GregorianCalendar();
		System.out.println(nowDate);
		System.out.println(nowCal);
		System.out.println(nowGc);
//		int year = nowCal.get(Calendar.YEAR);
//		int month = nowCal.get(Calendar.MONDAY)+1;
//		2024년 09월 09일 14시 14분 30초
//		yyyy(4자리 년도) yy(2자리 년도), MM(2자리 월), dd(2자리 일), E(요일)
//		a(오전/오후) HH(24시간 단위) hh(12시간 단위 2자리) mm(분 두자리) ss(초 2자리)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일(E) HH시 mm분 ss초");
		String dateStr = sdf.format(nowDate);
		String calStr = sdf.format(nowCal.getTime()); // nowCal.getTime() : Calendar 객체를 date형으로 return 
		String gcStr = sdf.format(nowGc.getTime());
		System.out.println(dateStr);
		System.out.println(calStr);
		System.out.println(gcStr);
		}
}
