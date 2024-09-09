package com.lec.ex1_String;
public class Ex02_StringApiMethod {
	public static void main(String[] args) {
		String str1 = "abcXabc";
		String str2 = "AbCXabc";
		String str3 = "   ja va   ";
		System.out.println("1." + str1.concat(str2));// 1. abcXabcAbCXabc 
		System.out.println("2." + str1.substring(3));// 2. Xabc 
		System.out.println("3." + str1.substring(3, 5));// 3. Xa 3번째부터 5번째앞까지
		System.out.println("4." + str1.length()); //4.7  문자열 갯수 만큼 숫자 출력
		System.out.println("5." + str1.toUpperCase());//5. ABCXABC : 모두 대문자로 변경후 출력
		System.out.println("6." + str1.toLowerCase());//6. abcxabc : 모두 소문자로 변경후 출력
		System.out.println("7." + str1.charAt(3)); // 7. : 3번째 글자 출력
		System.out.println("8." + str1.indexOf("bc")); // 8. 해당 문자가 처음오는 인덱스를 출력
		String str4 = "abcXabcXabc";
		System.out.println("9." + str4.indexOf("bc", 2)); // 9. 해당 문자를 2번째부터 검색
		System.out.println("10." + str4.lastIndexOf("bc")); // 10. 마지막부터 해당 문자열을 검색
		System.out.println("11." + str4.indexOf("@")); // 11. 해당 문자가 없으면 -1 로 출력
		System.out.println("12." + str1.equals(str2)); // 12. 문자열이 같은지 확인
		System.out.println("13." + str1.equalsIgnoreCase(str2)); // 13. 대소문자 구별없이 비교
		System.out.println("14." + str3.trim()); // 14. 앞뒤 스페이스 제거후 출력
		/*문자열.replace(oldStr, newStr)
		 * 문자열.replaceAll(oldStr정규표현식, newStr)
		 *[0-9] 숫자
		 */ 
		System.out.println("15." + str1.replace("abc", "바꿔")); // 15 앞문자 abc를 뒷문자 바꿔로 변경후 출력
		String str5 = "반가워요. ㅋㅋ 또봐요 ㅎ zz";
		System.out.println("16." + str5.replaceAll("[ㄱ-ㅎz]", "")); // 16. 해당 정규표현식 문자 삭제
		
		
		System.out.println("str1 = " + str1);
		System.out.println("str2 = " + str2);
	}
}
