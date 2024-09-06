package strategy1.step3;

public class LowRobot extends Robot{
	@Override
	public void actionFly() {
		System.out.println("하늘을 날수 없습니다");
	}
	@Override
	public void actionMssile() {
		System.out.println("미사일 을 쏠 수 없습니다");
	}
	@Override
	public void actionNnife() {
		System.out.println("겁이 없습니다");
	}

}
