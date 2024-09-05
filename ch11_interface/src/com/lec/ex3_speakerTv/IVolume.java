package com.lec.ex3_speakerTv;
// 작업 명세서 역활
// interface : 1,작업명세서 2,다형성 구현 3,기능을 부품화
// 인터페이스에는 static final 변수(상수)와 추상메소드 (예외 : default메소드, static 메소드)
public interface IVolume {
	public void volumUp();
	public void volumUP(int i);
	public void volumDown();
	public void volumDown(int i);
	public default void setMute(boolean mute) {
		if(mute) {
			System.out.println("무음");
		}else {
			System.out.println("무음 해제");
		}
	}
	public static void changeVattery() {
		System.out.println("건전지를 교환합니다.");
	}
}
