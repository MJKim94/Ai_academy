package com.lec.ex3_speakerTv;
public class TestMain {
	public static void main(String[] args) {
		IVolume[] devices = {new Speaker(),new Tv()};
		IVolume.changeVattery();
		for(IVolume device : devices) {
			device.volumDown(50);
			device.volumDown();
			device.volumUp();
			device.volumUP(50);
			device.setMute(true);
			device.setMute(false);
		}
	}	
}
