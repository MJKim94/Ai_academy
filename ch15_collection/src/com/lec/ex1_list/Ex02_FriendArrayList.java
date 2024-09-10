package com.lec.ex1_list;

import java.util.ArrayList;

public class Ex02_FriendArrayList {
	public static void main(String[] args) {
//		Friend[] fs = new Friend[2];
//		fs[0] = new Friend("홍길동", "010-4570-8382");
//		fs[1] = new Friend("김길동", "010-1234-4321");
		ArrayList<Friend> friends = new ArrayList<Friend>();
		friends.add(new Friend("홍길동", "010-4570-8382"));
		friends.add(new Friend("김길동", "010-1234-4321"));
		friends.add(new Friend("박길돌", "010-4321-1234"));
		for(int i=0 ; i<friends.size() ; i++) {
			System.out.println(friends.get(i));
		}
		for(Friend friend : friends) {
			System.out.println(friend);
		}
		for(Friend friend : friends) {
			System.out.println(friend.getName() + "\t" + friend.getTel());
		}
		if(friends.isEmpty()) {
			System.out.println("friends 데이거 없습니다");
		}else {
			for(int idx=0 ; idx<friends.size() ; idx++) {
				System.out.println(friends.get(idx).getName() + "\t" + friends.get(idx).getTel());
			}
		}
	}
}
