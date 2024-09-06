package strategy1.step3;

public class StandardRobot extends Robot{
	@Override
	public void actionFly() {
		System.out.println("하늘을 날수 없습니다");
	}
	@Override
	public void actionMssile() {
		System.out.println("미사일 을 쏠 수 있습니다");
	}
	@Override
	public void actionNnife() {
		System.out.println("나무검 이 있습니다");
	}

}
