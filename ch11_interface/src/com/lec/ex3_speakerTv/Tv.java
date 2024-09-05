package com.lec.ex3_speakerTv;

public class Tv implements IVolume {
	private int volumeLevel;
	private final int MAX_VOLUME = 99;
	private final int MIN_VOLUME = 0;
	public Tv() {
		volumeLevel = 10;
	}

	public void volumUp(int i) {
		if(volumeLevel == MAX_VOLUME) {
			System.out.println("TV 볼림이 최대치 (" + MAX_VOLUME + ")이여서 못 올려요");
		}
		if( (volumeLevel+i) <= MAX_VOLUME) {
			volumeLevel += i;
			System.out.println("TV 볼륨을 "+i+"올려 현재 볼륨은 " + volumeLevel);
		}else {
			int temp = MAX_VOLUME - volumeLevel;
			volumeLevel = MAX_VOLUME;
			System.out.println("TV 볼륨을 " + temp + "만큼 올려 최대치입니다.");
		}
	}
	public void volumUp() {
		if(volumeLevel < MAX_VOLUME) {
			volumeLevel++;
			System.out.println("TV 볼륨을 1올려 현재 볼륨은 " + volumeLevel);
		}else {
			System.out.println("TV 볼륨이 최대치("+MAX_VOLUME+")여서 올리지 못했습니다");
		}
	}
	public void volumDown(int i) {
		if(volumeLevel == MIN_VOLUME) {
			System.out.println("TV 볼륨이 최소치("+MIN_VOLUME+")여서 내리지 못했습니다");
//			volumeLevel -= 0;
//			System.out.println("TV 볼륨을 1내려 현재 볼륨은 " + volumeLevel);
		}else if (volumeLevel-i >= MIN_VOLUME){
			volumeLevel -= i;
			System.out.println("TV 볼름을 " + i + " 만큼 내려 현재 볼름은 " + volumeLevel);
		}else {
			int temp = volumeLevel - MIN_VOLUME;
			volumeLevel = MIN_VOLUME;
			System.out.println("TV 볼륨을  " + temp + " 만큼 내려 음소거 입니다");
		}
	}
	public void volumDown() {
		if(volumeLevel > MIN_VOLUME) {
			volumeLevel--;
			System.out.println("TV 볼륨을 1내려 현재 볼륨은 " + volumeLevel);
		}else {
			System.out.println("TV 볼륨이 최소치("+MIN_VOLUME+")여서 내리지 못했습니다");
		}//if
	}//volumeDown

	@Override
	public void volumUP(int i) {
		// TODO Auto-generated method stub
		
	}
}//class
