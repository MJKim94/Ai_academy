package com.lec.ex4_actor;

public class Actor implements IChef, IFireFighter, IPoliceMan {
	private String name;
	public Actor(String name) {
		this.name = name;
	}
	public void makePizza() {
		System.out.println(name+"은 요리사입니다 ♨ 피자를 만들 수 있다");	
	}
	public void makeSpaghetti() {
		System.out.println(name+"은 요리사입니다 ♨ 스파게티를 만들 수 있다");
	}
	public void outFire() {
		System.out.println(name+"은 소방관입니다 ♥ 불을 끌 수 있다");
	}
	public void saveMan() {
		System.out.println(name+"은 소방관입니다 ♥ 사람을 구할 수 있다");
	}
	public void canCatchCriminal() {
		System.out.println(name+"은 경찰입니다 ☞ 범인을 잡는다");
	}
	public void canSearch() {
		System.out.println(name+"은 경찰관입니다 ☞ 물건을 찾는다");
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}


