package strategy1.step3;

public abstract class Robot {
	public void shape() {
//		String className = new String("strategy1.step2.Robot");
		String className = getClass().getName();// 클래스 이름을 가지고 오는 오브젝트 
		int idx = className.lastIndexOf(".");
		String name = className.substring(idx+1);
//		System.out.println(name);
		System.out.println(name + " 의 외형은 팔, 다리, 머리, 몸통이 있습니다 = = =");
	}
	public void actionWalk() {
		System.out.println("걸을 수 있습니다");
	}
	public void actionRan() {
		System.out.println("달릴 수 있습니다");
	}
	public abstract void actionFly();// 추상메소드 : 구현부가 없고 선엄나 한 메소드
	public abstract void actionMssile();
	public abstract void actionNnife();
}
