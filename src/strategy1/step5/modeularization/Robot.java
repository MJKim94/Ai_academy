package strategy1.step5.modeularization;

import strategy1.step4.interfaces.*;

public abstract class Robot {
	private FlyImpl fly;
	private MissileImpl missile;
	private KnifeImpl knife;
	public abstract void shape(); 
//		String className = getClass().getName();// 클래스 이름을 가지고 오는 오브젝트 
//		int idx = className.lastIndexOf(".");
//		String name = className.substring(idx+1);
//		System.out.println(name + " 의 외형은 팔, 다리, 머리, 몸통이 있습니다 = = =");
//	}
	public void actionWalk() {
		System.out.println("걸을 수 있습니다");
	}
	public void actionRan() {
		System.out.println("달릴 수 있습니다");
	}
	public void actionFly() {
		fly.fly();
	}
	public void actionMissile() {
		missile.missile();
	}
	public void actionKnife() {
		knife.knife();
	}
	public void setFly(FlyImpl fly) {
		this.fly = fly;
	}
	public void setMissile(MissileImpl missile) {
		this.missile = missile;
	}
	public void setKnife(KnifeImpl knife) {
		this.knife = knife;
	}
}
