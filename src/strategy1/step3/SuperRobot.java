package strategy1.step3;

public class SuperRobot extends Robot{
	@Override
	public void actionFly() {
		System.out.println("하늘을 날수 있습니다");
	}
	@Override
	public void actionMssile() {
		System.out.println("미사일 을 쏠 수 있습니다");
	}
	@Override
	public void actionNnife() {
		System.out.println("레이저검이 있습니다");
	}

}
