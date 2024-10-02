package com.lec.ex;

import java.util.ArrayList;
import java.util.Scanner;

import com.lec.dao.PersonRepository;
import com.lec.dto.Person;

public class PersonMain {
	public static void main(String[] args) {
		PersonRepository repository = PersonRepository.getInstance();
		Scanner scanner = new Scanner(System.in);
		String fn;
		ArrayList<String> jnames = repository.jnameList(); //직업 리스트
		do {
			System.out.print("1:입력 || 2:직업별출력 || 3:전체출력 || 그외:종료");
			fn = scanner.next();
			switch(fn) {
			case "1": // 이름, 직업명, 국, 영, 수 입력받아 insert
				System.out.print("입력할 이름은?");
				String pname = scanner.next();
				System.out.print("직업명" + jnames + "은?");
				String jname = scanner.next();
				System.out.print("국어?");
				int kor = scanner.nextInt();
				System.out.print("영어?");
				int eng = scanner.nextInt();
				System.out.print("수학?");
				int mat = scanner.nextInt();
				int result = repository.insertPerson(pname, jname, kor, eng, mat);
				System.out.println(result==PersonRepository.SUCCESS ? "입력성공":"입력실패");
				break;
			case "2":// 직업명 입력받아 해당 직업명인 사람 리스트 quiz와 같이 출력
				System.out.print("직업명" + jnames + "은?");
				jname = scanner.next();
				ArrayList<Person> person = repository.getPerson(jname);
				if(person.isEmpty()) {
					System.out.println(jname + " 직업군에 등록된 사람이 없습니다");
				}else {
					for(Person p : person) {
						System.out.println(p);
					}
				}
				break;
			case "3":// 등록된 모든 person의 리스트 quiz와 같이 출력
				person = repository.getPerson();
				if(person.isEmpty()) {
					System.out.println("등록된 사람이 없습니다");
				}else {
					for(Person p : person) {
						System.out.println(p);
					}
				}
			}
		}while(fn.equals("1") || fn.equals("2") || fn.equals("3"));
		System.out.println("BYE");
	}
}